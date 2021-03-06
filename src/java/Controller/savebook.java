/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DB.DBConnectionHandler;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.sql.ResultSet;
import java.text.ParseException;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Sachi
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)

public class Savebook extends HttpServlet {

    private String getFileName(final Part part) {
        final String partHeader = part.getHeader("content-disposition");

        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(
                        content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String isdeffile = request.getParameter("isdefaultfile");
        String fileName="";
        OutputStream out = null;
        InputStream filecontent = null;
        
        if (isdeffile.equals("newfile")) {
            Part filePart = request.getPart("filecover");

            String path = "C:\\Users\\Sachi\\Documents\\NetBeansProjects\\BookPortal\\web\\site\\images\\book_images";

            File file = new File(path);
            file.mkdir();
            fileName = getFileName(filePart);

            PrintWriter writer = response.getWriter();

            out = new FileOutputStream(new File(path + File.separator
                    + fileName));

            filecontent = filePart.getInputStream();

            int read = 0;
            final byte[] bytes = new byte[1024];

            while ((read = filecontent.read(bytes)) != -1) {
                out.write(bytes, 0, read);

                String photo = "path/" + fileName;

            }

        } else if (isdeffile.equals("def")) {
            fileName="default.jpg";
        }

        PrintWriter outt = response.getWriter();

        Connection con = DBConnectionHandler.createConnection();
        try {
            String title = request.getParameter("title");
            String isbn = request.getParameter("isbn");

            String existingauth1 = request.getParameter("existingauth1");
            String newauth1 = request.getParameter("newauth1");

            String existingauth2 = request.getParameter("existingauth2");
            String newauth2 = request.getParameter("newauth2");

            String existingauth3 = request.getParameter("existingauth3");
            String newauth3 = request.getParameter("newauth3");

            String existingpub = request.getParameter("existingpub");
            String newpub = request.getParameter("newpub");

            String finalpub = "";
            String finalauth1 = "";
            String finalauth2 = "";
            String finalauth3 = "";

            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date pub_date1 = format.parse(request.getParameter("pubdate"));
            java.sql.Date pub_date2 = new java.sql.Date(pub_date1.getTime());

            String description = request.getParameter("description");
            String language = request.getParameter("language");
            String edition = request.getParameter("edition");
            String subject = request.getParameter("subject");
            String price = request.getParameter("price");

            String image = "site/images/book_images/" + fileName;
//            String image = "site/images/book_images/";

            java.sql.Date today = new Date(Calendar.getInstance().getTimeInMillis());
            con.setAutoCommit(false);

            String query = "";
            PreparedStatement ps = null;

            if (newpub != null) {
                query = "INSERT INTO publisher (name)" + "VALUES(?)";
                ps = con.prepareStatement(query);
                ps.setString(1, newpub);
                ps.executeUpdate();
                Savelog.saveLog(request, "New publisher inserted - " + newpub);

                query = "SELECT MAX(idpublisher) FROM publisher ";
                ps = con.prepareStatement(query);
                ResultSet rset = ps.executeQuery();
                if (rset.next()) {
                    finalpub = rset.getString(1);
                }

            } else if (existingpub != null) {
                finalpub = existingpub;
            }

            query = "INSERT INTO book"
                    + " (name,ISBN,pub_date,edition,pur_date,price,description,image,featured,reserved,publisher_idpublisher,language_idlanguage,subject_idsubject,status) "
                    + "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            ps = con.prepareStatement(query);
            ps.setString(1, title);
            ps.setString(2, isbn);
            ps.setDate(3, pub_date2);
            ps.setInt(4, Integer.parseInt(edition));
            ps.setDate(5, today);
            ps.setInt(6, Integer.parseInt(price));
            ps.setString(7, description);
            ps.setString(8, image);
            ps.setInt(9, 0);
            ps.setInt(10, 0);
            ps.setInt(11, Integer.parseInt(finalpub));
            ps.setInt(12, Integer.parseInt(language));
            ps.setInt(13, Integer.parseInt(subject));
            ps.setInt(14, 1);

            ps.executeUpdate();

            //get the id of the book
            query = "SELECT MAX(idbook) FROM book ";
            String idbook = "";
            ps = con.prepareStatement(query);
            ResultSet rset = ps.executeQuery();
            if (rset.next()) {
                idbook = rset.getString(1);
            }
            Savelog.saveLog(request, "New book inserted - " + idbook);

            //insert authors
            if (!(existingauth1 == null && newauth1 == null)) {
                if (newauth1 != null) {
                    query = "INSERT INTO author (name)" + "VALUES(?)";
                    ps = con.prepareStatement(query);
                    ps.setString(1, newauth1);
                    ps.executeUpdate();
                    Savelog.saveLog(request, "New author inserted - " + newauth1);

                    query = "SELECT MAX(idauthor) FROM author ";
                    ps = con.prepareStatement(query);
                    rset = ps.executeQuery();
                    if (rset.next()) {
                        finalauth1 = rset.getString(1);
                    }
                } else {
                    finalauth1 = existingauth1;
                }
                query = "INSERT INTO book_has_author (book_idbook,author_idauthor) " + "VALUES (?,?)";
                ps = con.prepareStatement(query);
                ps.setString(1, idbook);
                ps.setString(2, finalauth1);
                ps.executeUpdate();
                Savelog.saveLog(request, "New book_has_author inserted book - " + idbook + " author - " + finalauth1);
            }

            if (!(existingauth2 == null && newauth2 == null)) {
                if (newauth2 != null) {
                    query = "INSERT INTO author (name)" + "VALUES(?)";
                    ps = con.prepareStatement(query);
                    ps.setString(1, newauth2);
                    ps.executeUpdate();
                    Savelog.saveLog(request, "New author inserted - " + newauth2);

                    query = "SELECT MAX(idauthor) FROM author ";
                    ps = con.prepareStatement(query);
                    rset = ps.executeQuery();
                    if (rset.next()) {
                        finalauth2 = rset.getString(1);
                    }
                } else {
                    finalauth2 = existingauth2;
                }
                query = "INSERT INTO book_has_author (book_idbook,author_idauthor) " + "VALUES (?,?)";
                ps = con.prepareStatement(query);
                ps.setString(1, idbook);
                ps.setString(2, finalauth2);
                ps.executeUpdate();
                Savelog.saveLog(request, "New book_has_author inserted book - " + idbook + " author - " + finalauth2);
            }

            if (!(existingauth3 == null && newauth3 == null)) {
                if (newauth3 != null) {
                    query = "INSERT INTO author (name)" + "VALUES(?)";
                    ps = con.prepareStatement(query);
                    ps.setString(1, newauth3);
                    ps.executeUpdate();
                    Savelog.saveLog(request, "New author inserted - " + newauth3);

                    query = "SELECT MAX(idauthor) FROM author ";
                    ps = con.prepareStatement(query);
                    rset = ps.executeQuery();
                    if (rset.next()) {
                        finalauth3 = rset.getString(1);
                    }
                } else {
                    finalauth3 = existingauth3;
                }
                query = "INSERT INTO book_has_author (book_idbook,author_idauthor) " + "VALUES (?,?)";
                ps = con.prepareStatement(query);
                ps.setString(1, idbook);
                ps.setString(2, finalauth3);
                ps.executeUpdate();
                Savelog.saveLog(request, "New book_has_author inserted book - " + idbook + " author - " + finalauth3);
            }
            con.commit();
//            response.sendRedirect("bookinsert.jsp?msg=success");

        } catch (SQLException e) {
            try {
                con.rollback();
            } catch (SQLException ex) {
                System.out.println("Oops! Something went wrong.\n");
                System.out.println(ex.toString());
                Savelog.saveLog(request, "book addition failed");
                response.sendRedirect("bookinsert.jsp?msg=error");
            }
            System.out.println("Oops! Something went wrong.\n");
            System.out.println(e.toString());

            response.sendRedirect("bookinsert.jsp?msg=error");
        } catch (ParseException ex) {
            System.out.println("PARSE exception");
            Logger.getLogger(Savebook.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                System.out.println("Oops! Something went wrong.\n");
            }
        }

        if(out!=null){
            out.close();
        }
        if(filecontent!=null){
            filecontent.close();
        }
        response.sendRedirect("bookinsert.jsp?msg=success");
//        response.sendRedirect("inventoryview.jsp?msg=success");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            String para = request.getParameter("para");
            if (para.equals("fadd")) {
                int idd = Integer.parseInt(request.getParameter("newfeatbook"));
                System.out.println("new book id=" + idd);
                Connection con = DBConnectionHandler.createConnection();
                String query = "UPDATE book SET featured=1 WHERE idbook=?";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setInt(1, idd);
                ps.executeUpdate();
                con.close();
                Savelog.saveLog(request, "added new featured book - " + idd);
            } else if (para.equals("fremove")) {
                int idbook = Integer.parseInt(request.getParameter("book"));
                System.out.println("removed - " + idbook);
                Connection con = DBConnectionHandler.createConnection();
                String query = "UPDATE book SET featured=0 WHERE idbook=?";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setInt(1, idbook);
                ps.executeUpdate();
                con.close();
                Savelog.saveLog(request, "removed featured book - " + idbook);
            }
            response.sendRedirect("featuredbooks.jsp");
        } catch (Exception e) {
            Savelog.saveLog(request, "error in saving featured book");
            out.println("Oops! Something went wrong.\n");
            out.println(e.toString());

        }

    }

    private int getlastbook(HttpServletRequest req) {
        int idbook = 0;
        try {

            Connection con = DBConnectionHandler.createConnection();
            String query2 = "Select MAX(idbook) from book";
            PreparedStatement ps2 = con.prepareStatement(query2);
            ResultSet rsetSub = ps2.executeQuery();
            idbook = rsetSub.getInt(1);
            con.close();
        } catch (SQLException ex) {
            Savelog.saveLog(req, "failed to load max book id");
            Logger.getLogger(Savebook.class.getName()).log(Level.SEVERE, null, ex);
        }
        return idbook;
    }

}
