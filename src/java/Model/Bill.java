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
import java.util.HashMap;

/**
 *
 * @author Sachi
 */
public class Bill {

    private int idbill;
    private Date date;
    private double total;
    private String paymethod;
    private User issue_user;
    HashMap<Book, Integer> items;

    public Bill(int idbill, Date date, double total, String paymethod, User issue_user, HashMap<Book, Integer> items) {
        this.idbill = idbill;
        this.date = date;
        this.total = total;
        this.paymethod = paymethod;
        this.issue_user = issue_user;
        this.items = items;
    }

    public int getIdbill() {
        return idbill;
    }

    public void setIdbill(int idbill) {
        this.idbill = idbill;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getPaymethod() {
        return paymethod;
    }

    public void setPaymethod(String paymethod) {
        this.paymethod = paymethod;
    }

    public User getIssue_user() {
        return issue_user;
    }

    public void setIssue_user(User issue_user) {
        this.issue_user = issue_user;
    }

    public HashMap<Book, Integer> getItems() {
        return items;
    }

    public void setItems(HashMap<Book, Integer> items) {
        this.items = items;
    }

    public static int getLastBillID() {
        int id = 0;
        try {
            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT max(idPurchase_req) FROM purchase_req";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rsetBranch = ps.executeQuery();

            while (rsetBranch.next()) {
                id = rsetBranch.getInt(1);
                break;
            }
            con.close();
            return id;

        } catch (Exception e) {
            System.out.println(e);
            return id;
        }
    }
    

}
