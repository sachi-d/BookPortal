/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DB.DBConnectionHandler;
import Model.Branch;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sachi
 */
public class Savestock extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Connection con = DBConnectionHandler.createConnection();

        try {

            String branch = request.getParameter("idbranch");
            String book = request.getParameter("book");
            String quantity = request.getParameter("quantity");
            int idbranch = Integer.parseInt(branch);
            System.out.println("branch id= " + idbranch);
            int idbook = Integer.parseInt(book);
            int q = Integer.parseInt(quantity);
            java.sql.Date today = new Date(Calendar.getInstance().getTimeInMillis());

            con.setAutoCommit(false);

            String query = "INSERT INTO branch_stock "
                    + "(branch_idbranch,book_idbook,quantity,date) "
                    + "VALUES (?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idbranch);
            ps.setInt(2, idbook);
            ps.setInt(3, q);
            ps.setDate(4, today);

            ps.executeUpdate();

            con.commit();
            Savelog.saveLog(request, "branch stock added successfully");
            response.sendRedirect("stockview.jsp?msg=success");

        } catch (SQLException | IOException e) {
            try {
                con.rollback();
            } catch (SQLException ex) {
                out.println("Oops! Something went wrong.\n");
                out.println(ex.toString());
                Savelog.saveLog(request, "branch stock addition failed");
                response.sendRedirect("stockview.jsp?msg=error");
            }
            out.println("Oops! Something went wrong.\n");
            System.out.println(e.toString());

            response.sendRedirect("stockview.jsp?msg=error");
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                System.out.println("Oops! Something went wrong.\n");
            }
        }
    }
}
