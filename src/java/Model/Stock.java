/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import DB.DBConnectionHandler;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

/**
 *
 * @author Sachi
 */
public class Stock {
    private Book book;
    private Branch branch;
    private int quantity;
    private int idstock;
    private Date date;

    public Stock(int id,Book book, Branch branch, int quantity,Date date) {
        this.idstock=id;
        this.book = book;
        this.branch = branch;
        this.quantity = quantity;
        this.date=date;
    }
    public Stock(int id,Book book, Branch branch, int quantity) {
        this.idstock=id;
        this.book = book;
        this.branch = branch;
        this.quantity = quantity;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public Branch getBranch() {
        return branch;
    }

    public void setBranch(Branch branch) {
        this.branch = branch;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getIdstock() {
        return idstock;
    }

    public void setIdstock(int idstock) {
        this.idstock = idstock;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
     public static int getAvailability(int idbook) {
        int q = 0;
        int idbranch=1;
        try {
            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM current_stock WHERE branch_idbranch=? AND book_idbook=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, idbranch);
            ps.setInt(2, idbook);
            ResultSet rsetStock = ps.executeQuery();

            if (rsetStock.next()) {
                q = rsetStock.getInt(4);
            }
            con.close();

        } catch (Exception e) {
            System.out.println(e);
        }
        return q;
    }
}
