/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DB.DBConnectionHandler;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sachi
 */
public class saveuser extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Connection con = DBConnectionHandler.createConnection();

        try {

            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String NIC = request.getParameter("NIC");
            String userlevel = request.getParameter("userlevel");
            String uname = request.getParameter("uname");
            String branch = request.getParameter("branch");

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

            con.setAutoCommit(false);
            String query = "INSERT INTO user "
                    + "(username,password,user_level,fname,lname,nic,branch_idbranch,status) "
                    + "VALUES (?,?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, uname);
            ps.setString(2, pw);
            ps.setString(3, userlevel);
            switch (userlevel) {
                case "Sales staff":
                    ps.setInt(8, 0);
                    break;
                default:
                    ps.setInt(8, 1);
                    break;
            }
            ps.setString(4, fname);
            ps.setString(5, lname);
            ps.setString(6, NIC);
            ps.setInt(7, 1);
            switch (branch) {
                case "Nugegoda":
                    ps.setInt(7, 1);
                    break;
                case "Rathnapura":
                    ps.setInt(7, 2);
                    break;
                default:
                    ps.setInt(3, 0);
                    break;
            }

            ps.executeUpdate();
            Savelog.saveLog(request, "new user signup1" + uname);
            con.commit();
            Savelog.saveLog(request, "new user signup" + uname);
            response.sendRedirect("index.jsp?msg=success");

        } catch (SQLException | IOException e) {
            try {
                con.rollback();
            } catch (SQLException ex) {
                out.println("Oops! Something went wrong.\n");
                out.println(ex.toString());

                response.sendRedirect("signup.jsp?msg=available");
            }
            out.println("Oops! Something went wrong.\n");
            out.println(e.toString());

            response.sendRedirect("signup.jsp?msg=error");
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                System.out.println("Oops! Something went wrong.\n");
            }
        }
    }
}
