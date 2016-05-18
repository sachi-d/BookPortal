/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DB.DBConnectionHandler;
import Model.Book;
import Model.Cart;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sachi
 */
public class Savebill extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int count = Integer.parseInt(request.getParameter("itemcount"));
        System.out.println(request.getParameter("trial"));
        boolean executionstatus = false;
        HashMap<Book, Integer> items = new HashMap<>();
        for(int i=0;i<count;i++){
            System.out.println("--"+request.getParameter("bookid_0"));
            int id=Integer.parseInt(request.getParameter("bookid_"+i));
            Book b=DBDatalist.getBook(id);
            int q=Integer.parseInt(request.getParameter("q_"+i));
            items.put(b, q);
        }
        
        int userid=Integer.parseInt(request.getParameter("userid"));
        double total=Double.parseDouble(request.getParameter("subtot"));
        
        Connection con = DBConnectionHandler.createConnection();
        java.sql.Date today = new Date(Calendar.getInstance().getTimeInMillis());
        int lastid = 0;
        System.out.println("out try");
        try {

            con.setAutoCommit(false);
            String query = "INSERT INTO bill (Date, total, paymethod, issue_user) VALUES (?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setDate(1, today);
            ps.setDouble(2, total);
            ps.setString(3, "Cash");
            ps.setInt(4, userid); 
            System.out.println("before execute");
            ps.executeUpdate();
            executionstatus = true;
            System.out.println("insert bill");

            //get the id of the report
            query = "SELECT MAX(idBill) FROM bill ";
            ps = con.prepareStatement(query);
            ResultSet rset = ps.executeQuery();
            if (rset.next()) {
                lastid = rset.getInt(1);
            } else {
                executionstatus = false;
            }
            if (lastid != 0) {
                for (Book b : items.keySet()) {
                    query = "INSERT INTO book_has_bill (book_idbook,Bill_idBill,quantity) VALUES (?,?,?)";
                    ps = con.prepareStatement(query);
                    ps.setInt(1, b.getIdbook());
                    ps.setInt(2, lastid);
                    ps.setInt(3, items.get(b));
                    ps.executeUpdate();
                    System.out.println("insertbook-" + b.getTitle());
                }
                executionstatus = true;
            }

            con.commit();

        } catch (SQLException e) {
            executionstatus = false;
            try {
                con.rollback();
            } catch (SQLException ex) {
                System.out.println(ex);
            }
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                System.out.println("Oops! Something went wrong.\n");
                executionstatus = false;
            }
        }
        if (executionstatus) {
            response.sendRedirect("issuebill.jsp?msg=success");
        } else {
            response.sendRedirect("issuebill.jsp?msg=error");
        }
    }

    public static boolean saveOnlineBill(Cart cart) {
        boolean executionstatus = false;
        HashMap<Book, Integer> items = cart.getItems();
        Connection con = DBConnectionHandler.createConnection();
        java.sql.Date today = new Date(Calendar.getInstance().getTimeInMillis());
        int lastid = 0;
        System.out.println("out try");
        try {

            con.setAutoCommit(false);
            String query = "INSERT INTO bill (Date, total, paymethod, issue_user) VALUES (?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setDate(1, today);
            ps.setDouble(2, cart.getTotal());
            ps.setString(3, "Online");
            ps.setInt(4, 1); //consider admin as the issuer of online transactions
            System.out.println("before execute");
            ps.executeUpdate();
            executionstatus = true;
            System.out.println("insert bill");

            //get the id of the report
            query = "SELECT MAX(idBill) FROM bill ";
            ps = con.prepareStatement(query);
            ResultSet rset = ps.executeQuery();
            if (rset.next()) {
                lastid = rset.getInt(1);
            } else {
                executionstatus = false;
            }
            if (lastid != 0) {
                for (Book b : items.keySet()) {
                    query = "INSERT INTO book_has_bill (book_idbook,Bill_idBill,quantity) VALUES (?,?,?)";
                    ps = con.prepareStatement(query);
                    ps.setInt(1, b.getIdbook());
                    ps.setInt(2, lastid);
                    ps.setInt(3, items.get(b));
                    ps.executeUpdate();
                    System.out.println("insertbook-" + b.getTitle());
                }
                executionstatus = true;
            }

            con.commit();

        } catch (SQLException e) {
            executionstatus = false;
            try {
                con.rollback();
            } catch (SQLException ex) {
                System.out.println(ex);
            }
        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                System.out.println("Oops! Something went wrong.\n");
                return false;
            }
        }
        return executionstatus;
    }
}
