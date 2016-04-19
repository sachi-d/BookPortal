/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DB.DBConnectionHandler;
import Model.Branch;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sachi
 */
public class login extends HttpServlet {

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
        PrintWriter out = response.getWriter();

        try {
            String un = request.getParameter("uname");

            MessageDigest md = null;
            try {
                md = MessageDigest.getInstance("MD5");
            } catch (NoSuchAlgorithmException ex) {
                out.write(ex.toString());
            }
            md.reset();
            md.update(request.getParameter("pw").getBytes());
            byte[] digest = md.digest();
            StringBuilder sb = new StringBuilder();
            for (byte b : digest) {
                sb.append(Integer.toHexString((int) (b & 0xff)));
            }
            String pw = sb.toString();

            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM user WHERE username=? AND password=? AND status=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, un);
            ps.setString(2, pw);
            ps.setInt(3, 1);
            ResultSet rsetUser = ps.executeQuery();

            if (rsetUser.next()) {
                Branch b=DBDatalist.getBranch(rsetUser.getInt(8));
                User user = new User(rsetUser.getInt(1), rsetUser.getString(2), rsetUser.getString(3), rsetUser.getString(4), rsetUser.getString(5), rsetUser.getString(6), rsetUser.getString(7), b);
                request.getSession().invalidate();
                request.getSession().setAttribute("user", user);

                boolean flag = BackupDB.backupDB();
                if (flag) {
                    Savelog.saveLog(request, "backed up the database");
                } else {
                    Savelog.saveLog(request, "failed database back up");
                }

                boolean s = Savelog.saveLog(request, "user logged in");
                if (s) {

                    response.sendRedirect("index.jsp");
                } else {
                    response.sendRedirect("login.jsp?msg=incorrect");
                }

            } else {
                Savelog.saveLog(request, "error user login");
                response.sendRedirect("login.jsp?msg=incorrect");
            }

            con.close();

        } catch (SQLException | NumberFormatException | IOException e) {
            Savelog.saveLog(request, "error user login");
            out.println("Oops! Something went wrong.\n");
            out.println(e.toString());

            response.sendRedirect("login.jsp?msg=error");
        }
    }
}
