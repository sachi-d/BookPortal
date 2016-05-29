/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.HashMap;
import java.util.LinkedHashMap;

/**
 *
 * @author Sachi
 */
public class Cart {

    private LinkedHashMap<Book, Integer> items;
    private double total;

    public Cart(LinkedHashMap<Book, Integer> items, double total) {
        this.items = items;
        this.total = total;
    }

    public Cart() {
        this.items = new LinkedHashMap<>();
        this.total = 0;
    }

    public LinkedHashMap<Book, Integer> getItems() {
        return items;
    }

    public void setItems(LinkedHashMap<Book, Integer> items) {
        this.items = items;
    }

    public double getTotal() {
        updateTotal();
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public Book getBookinCart(Book b) {
        try {
            b.getIdbook();
        } catch (Exception e) {
            return null;
        }
        Book mybook = null;
        for (Book bb : items.keySet()) {

            if (bb.getIdbook() == b.getIdbook()) {
                mybook = bb;
                break;
            }
        }
        return mybook;
    }

    //Add book to the cart
    public void addToCart(Book b, int q) {
        if (q >= 0) {
            items.put(b, q);
        }
    }

    //Remove book from cart
    public void removeFromCart(Book b) {
        items.remove(getBookinCart(b));
    }

    //Increment the quantity of the book in cart
    public void incrementQuantity(Book b) {
        Book bb = getBookinCart(b);
        int newq = (items.get(bb)) + 1;
        items.put(bb, newq);
    }

    public void decrementQuantity(Book b) {
        Book bb = getBookinCart(b);
        int newq = (items.get(bb)) - 1;
        if (newq >= 0) {
            items.put(bb, newq);

        }
    }

    public int getCartSize() {
        return this.items.size();
    }

    public boolean isIn(Book b) {
        if (b == null) {
            return false;
        }
        boolean isin = true;
        Book bb = getBookinCart(b);
        if (bb == null) {
            isin = false;
        }
        return isin;
    }

    public double getTotalperBook(Book b) {
        int q = items.get(b);
        return b.getPrice() * q;
    }

    public void updateTotal() {
        double tot = 0;
        for (Book b : items.keySet()) {
            tot += (b.getPrice() * items.get(b));
        }
        this.total = tot;
    }

}
