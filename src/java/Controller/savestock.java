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

            //check if the entry is already in the current stock
            boolean alreadyin = false;
            int currentstock = 0;
            int curstockid = 0;
            query = "SELECT * FROM current_stock WHERE branch_idbranch=? AND book_idbook=?";
            ps = con.prepareStatement(query);
            ps.setInt(1, idbranch);
            ps.setInt(2, idbook);
            ResultSet rset = ps.executeQuery();
            if (rset.next()) {
                alreadyin = true;
                curstockid = rset.getInt(1);
                currentstock = rset.getInt(4);
            }

            if (alreadyin) {
                query = "UPDATE current_stock SET quantity=? WHERE idcurrent_stock=?";
                ps = con.prepareStatement(query);
                ps.setInt(1, q + currentstock);
                ps.setInt(2, curstockid);
                ps.executeUpdate();
            } else {
                query = "INSERT INTO current_stock "
                        + "(branch_idbranch,book_idbook,quantity) "
                        + "VALUES (?,?,?)";
                ps = con.prepareStatement(query);
                ps.setInt(1, idbranch);
                ps.setInt(2, idbook);
                ps.setInt(3, q);
                ps.executeUpdate();
            }
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
