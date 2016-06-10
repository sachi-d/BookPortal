/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DB.DBConnectionHandler;
import Model.Notification;
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
public class Executenotification extends HttpServlet {

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            String result = "";
            String para = request.getParameter("para");
            if (para.equals("accept")) {
                System.out.println("accept user");
                String userId = request.getParameter("user");
                Connection con = DBConnectionHandler.createConnection();
                String query = "UPDATE user SET status=1 WHERE iduser=?";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, userId);
                ps.executeUpdate();
                con.close();
                result = "success";
            } else if (para.equals("reject")) {
                String userId = request.getParameter("user");
                Connection con = DBConnectionHandler.createConnection();
                String query = "UPDATE user SET status=0 WHERE iduser=?";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, userId);
                ps.executeUpdate();
                con.close();
                result = "rejected";
            }
            String notId = request.getParameter("not");
            Notification.ignorenotification(Integer.parseInt(notId));
            if (result.equals("")) {
                response.sendRedirect("notificationview.jsp?msg=ignoresuccess");
            } else {
                response.sendRedirect("notificationview.jsp?msg=" + result);
            }

        } catch (Exception e) {
            Savelog.saveLog(request, "error - user reg notification");
            out.println("Oops! Something went wrong.\n");
            out.println(e.toString());

            response.sendRedirect("notificationview.jsp?msg=error");
        }

    }

    

   
}
