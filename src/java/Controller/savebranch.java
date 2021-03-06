/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DB.DBConnectionHandler;
import java.io.IOException;
import java.io.PrintWriter;
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
public class Savebranch extends HttpServlet {

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
        Connection con = DBConnectionHandler.createConnection();

        try {

            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String telno = request.getParameter("telno");

            con.setAutoCommit(false);
            String query = "INSERT INTO branch "
                    + "(name,address,telNo,status) "
                    + "VALUES (?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, address);
            ps.setString(3, telno);
            ps.setInt(4, 1);

            ps.executeUpdate();
            con.commit();
            Savelog.saveLog(request, "branch added successfully-" + name);
            response.sendRedirect("branchview.jsp?msg=success");

        } catch (SQLException | IOException e) {
            try {
                con.rollback();
            } catch (SQLException ex) {
                out.println("Oops! Something went wrong.\n");
                out.println(ex.toString());
                Savelog.saveLog(request, "branch addition failed");
                response.sendRedirect("branchview.jsp?msg=error");
            }
            out.println("Oops! Something went wrong.\n");
            out.println(e.toString());

            response.sendRedirect("branchview.jsp?msg=error");
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                System.out.println("Oops! Something went wrong.\n");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Connection con = DBConnectionHandler.createConnection();

        String para = request.getParameter("para");
        int idbranch = Integer.parseInt(request.getParameter("idbranch"));
        if (para.equals("edit")) {

            try {

                String name = request.getParameter("name");
                String address = request.getParameter("address");
                String telno = request.getParameter("telno");

                con.setAutoCommit(false);
                String query = "UPDATE branch "
                        + "SET name=?, address=?, telNo=? WHERE idbranch=?";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, name);
                ps.setString(2, address);
                ps.setString(3, telno);
                ps.setInt(4, idbranch);

                ps.executeUpdate();
                con.commit();
                Savelog.saveLog(request, "branch editted successfully-" + idbranch);
                response.sendRedirect("branchedit.jsp?msg=success");

            } catch (SQLException | IOException e) {
                try {
                    con.rollback();
                } catch (SQLException ex) {
                    out.println("Oops! Something went wrong.\n");
                    out.println(ex.toString());
                    Savelog.saveLog(request, "branch edit failed-"+idbranch);
                    response.sendRedirect("branchedit.jsp?msg=error");
                }
                out.println("Oops! Something went wrong.\n");
                out.println(e.toString());

                response.sendRedirect("branchedit.jsp?msg=error");
            } finally {
                try {
                    con.close();
                } catch (SQLException e) {
                    System.out.println("Oops! Something went wrong.\n");
                }
            }

        } else if (para.equals("remove")) {
            try {
                con.setAutoCommit(false);
                String query = "UPDATE branch "
                        + "SET status=? WHERE idbranch=?";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setInt(1, 0);
                ps.setInt(2, idbranch);

                ps.executeUpdate();
                con.commit();
                Savelog.saveLog(request, "branch removed successfully-" + idbranch);
                response.sendRedirect("branchedit.jsp?msg=success");

            } catch (SQLException | IOException e) {
                try {
                    con.rollback();
                } catch (SQLException ex) {
                    out.println("Oops! Something went wrong.\n");
                    out.println(ex.toString());
                    Savelog.saveLog(request, "branch remove failed-"+idbranch);
                    response.sendRedirect("branchedit.jsp?msg=error");
                }
                out.println("Oops! Something went wrong.\n");
                out.println(e.toString());

                response.sendRedirect("branchedit.jsp?msg=error");
            } finally {
                try {
                    con.close();
                } catch (SQLException e) {
                    System.out.println("Oops! Something went wrong.\n");
                }
            }
        }
        else{
            response.sendRedirect("branchedit.jsp?msg=error");
        }
    }
}
