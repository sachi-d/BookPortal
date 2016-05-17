/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sachi
 */
public class Loadsubjects extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            int category = Integer.parseInt(request.getParameter("type"));
            System.out.println("inside get");
            switch (category) {
                case 1:
                    out.print(
                            "<option value='1'>Product Name 1 For Category 2</option>"
                            + "<option value='2'>Product Name 2 For Category 2</option>"
                            + "<option value='3'>Product Name 3 For Category 2</option>"
                    );
                    System.out.println("categor1");
                    break;
                case 2:
                    out.print(
                            "<option value='1'>Product Name 1 For Category 3</option>"
                            + "<option value='2'>Product Name 2 For Category 3</option>"
                            + "<option value='3'>Product Name 3 For Category 3</option>"
                    );
                    System.out.println("catego222");
                    break;
                default:
                    out.print(
                            "<option value='1'>Product Name 1 For Category 1</option>"
                            + "<option value='2'>Product Name 2 For Category 1</option>"
                            + "<option value='3'>Product Name 3 For Category 1</option>"
                    );
                    System.out.println("categor2");
                    break;
            }
        } catch (Exception ex) {
            out.print("Error getting product name..." + ex.toString());
        } finally {
            out.close();
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
