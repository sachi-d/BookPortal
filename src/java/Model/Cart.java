/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.HashMap;

/**
 *
 * @author Sachi
 */
public class Cart {

    private HashMap<Book, Integer> items;
    private double total;

    public Cart(HashMap<Book, Integer> items, double total) {
        this.items = items;
        this.total = total;
    }

    public Cart() {
        this.items = new HashMap<>();
        this.total = 0;
    }

    public HashMap<Book, Integer> getItems() {
        return items;
    }

    public void setItems(HashMap<Book, Integer> items) {
        this.items = items;
    }

    public double getTotal() {
        updateTotal();
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public void addToCart(Book b, int q) {
        items.put(b, q);
        System.out.println("items added-" + items.get(b));
    }

    public void removeFromCart(Book b) {
        for(Book bb:items.keySet()){
            if(bb.getIdbook()==b.getIdbook()){
                items.remove(bb);
                break;
            }
        }
    }

    public void incrementQuantity(Book b) {
        for (Book bb : items.keySet()) {
            if (bb.getIdbook() == b.getIdbook()) {
//                System.out.println("item q - " + items.get(bb));
                int newq = (items.get(bb)) + 1;
//                System.out.println("newq-" + newq);
                items.put(bb, newq);
                break;
            }
        }

    }

    public void decrementQuantity(Book b) {
        for (Book bb : items.keySet()) {
            if (bb.getIdbook() == b.getIdbook()) {
                int newq = (items.get(bb)) - 1;
                if (newq >= 0) {
                    items.put(bb, newq);
                }
                break;
            }
        }
        
    }

    public int getCartSize() {
        return this.items.size();
    }

    public boolean isIn(Book b) {
        boolean isin=false;
        for(Book bb:items.keySet()){
            if(bb.getIdbook()==b.getIdbook()){
                isin=true;
                break;
            }
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
//        System.out.println("total updated");
    }
}
