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
import java.text.SimpleDateFormat;
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

public class trialsavebook extends HttpServlet {

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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        Part filePart = request.getPart("filecover");

        String path = "C:\\Users\\Sachi\\Documents\\NetBeansProjects\\BookPortal\\web\\site\\images\\book_images";

        File file = new File(path);
        file.mkdir();
        String fileName = getFileName(filePart);

        OutputStream out1 = null;

        InputStream filecontent = null;

        PrintWriter writer = response.getWriter();

        out1 = new FileOutputStream(new File(path + File.separator
                + fileName));

        filecontent = filePart.getInputStream();

        int read = 0;
        final byte[] bytes = new byte[1024];

        while ((read = filecontent.read(bytes)) != -1) {
            out1.write(bytes, 0, read);

            String photo = "path/" + fileName;

        }

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

            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet trialsavebook</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<p>title=" + title + "---</p>");
                out.println("<p>isbn=" + isbn + "---</p>");
                out.println("<p>exauth1=" + existingauth1 + "---</p>");
                out.println("<p>newauth1=" + newauth1 + "---</p>");
                out.println("<p>exauth2=" + existingauth2 + "---</p>");
                out.println("<p>newauth2=" + newauth2 + "---</p>");
                out.println("<p>exauth3=" + existingauth3 + "---</p>");
                out.println("<p>newauth3=" + newauth3 + "---</p>");
                out.println("<p>expub=" + existingpub + "---</p>");
                out.println("<p>newpub=" + newpub + "---</p>");

                out.println("<p>pubdate=" + pub_date2 + "---</p>");
                out.println("<p>description=" + description + "---</p>");
                out.println("<p>language=" + language + "---</p>");
                out.println("<p>edition=" + edition + "---</p>");

                out.println("</body>");
                out.println("</html>");

            }

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                /* TODO output your page here. You may use following sample code. */
                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Servlet trialsavebook</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>" + e + "</h1>");
                out.println("</body>");
                out.println("</html>");
            }
        }
    }

}
