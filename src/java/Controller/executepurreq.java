/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DB.DBConnectionHandler;
import Model.Purchaserequest;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sachi
 */
public class Executepurreq extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String pur = "---";
        try {
            String para = request.getParameter("para");
            pur = request.getParameter("pur");
            if (para.equals("accept")) {

                Connection con = DBConnectionHandler.createConnection();
                String query = "UPDATE purchase_Req SET status='Accepted' WHERE idPurchase_req=?";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, pur);
                ps.executeUpdate();
                con.close();
                Savelog.saveLog(request, "Marked as accepted purchase request - " + pur);
                Purchaserequest purreq=DBDatalist.getPurchaserequest(Integer.parseInt(pur));
                purreq.sendEmail();
                response.sendRedirect("billdetailsview.jsp?msg=accepted&purreq=" + pur);
            } else if (para.equals("process")) {
                Connection con = DBConnectionHandler.createConnection();
                String query = "UPDATE purchase_Req SET status='Processed' WHERE idPurchase_req=?";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, pur);
                ps.executeUpdate();
                con.close();
                Savelog.saveLog(request, "Marked as processed purchase request - " + pur);
                Purchaserequest purreq=DBDatalist.getPurchaserequest(Integer.parseInt(pur));
                purreq.sendEmail();
                response.sendRedirect("billdetailsview.jsp?msg=processed&purreq=" + pur);
            }
//            response.sendRedirect("notificationview.jsp?msg=ignoresuccess");

        } catch (Exception e) {
            Savelog.saveLog(request, "error in saving purchase request - " + pur);
            out.println("Oops! Something went wrong.\n");
            out.println(e.toString());

            response.sendRedirect("billdetailsview.jsp?msg=error&purreq=" + pur);
        }

    }
}
