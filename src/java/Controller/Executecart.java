/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Book;
import Model.Cart;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sachi
 */
public class Executecart extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String para = request.getParameter("para");
        int bookid = Integer.parseInt(request.getParameter("id"));
        Book book = DBDatalist.getBook(bookid);
        Cart cart = (Cart) request.getSession().getAttribute("cart");

        if (para.equals("add")) {
            if (cart.isIn(book)) {
                cart.incrementQuantity(book);
            } else {
                cart.addToCart(book, 1);
            }

        } else if (para.equals("remove")) {
            cart.removeFromCart(book);
        } else {

        }
        String page = (String) request.getSession().getAttribute("currentpage");

        response.sendRedirect("site/" + page);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String para = request.getParameter("para");
        int bookid = Integer.parseInt(request.getParameter("id"));
        Book book = DBDatalist.getBook(bookid);
        System.out.println("book - " + book.getTitle());
        Cart cart = (Cart) request.getSession().getAttribute("cart");

        if (para.equals("increment")) {
            cart.incrementQuantity(book);
        } else if (para.equals("decrement")) {
            cart.decrementQuantity(book);
        } else {

        }
        String page = (String) request.getSession().getAttribute("currentpage");

        response.sendRedirect("site/" + page);
    }
}
