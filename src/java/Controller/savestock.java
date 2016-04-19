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
public class savestock extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Connection con = DBConnectionHandler.createConnection();

        try {

            String branchname = request.getParameter("branch");
            String book = request.getParameter("book");
            String quantity = request.getParameter("quantity");
            int idbranch=0;
            for(Branch b: DBDatalist.getBranchList()){
                if(b.getName().equals(branchname)){
                    idbranch=b.getIdbranch();
                }
            }
            int idbook=Integer.parseInt(book);
            int q=Integer.parseInt(quantity);

            con.setAutoCommit(false);
            String query = "INSERT INTO branch_stock "
                    + "(branch_idbranch,book_idbook,quantity) "
                    + "VALUES (?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idbranch);
            ps.setInt(2, idbook);
            ps.setInt(3, q);

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
            out.println(e.toString());

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
