/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import DB.DBConnectionHandler;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.HashMap;

/**
 *
 * @author Sachi
 */
public class Purchaserequest {

    private int idpurreq;
    private String customer;
    private String email;
    private String address;
    private String status;  // New or Accepted or Processed
    private Bill bill;

    public Purchaserequest(int idpurreq, String customer, String email, String address, String status, Bill bill) {
        this.idpurreq = idpurreq;
        this.customer = customer;
        this.email = email;
        this.address = address;
        this.status = status;
        this.bill = bill;
    }

    public int getIdpurreq() {
        return idpurreq;
    }

    public void setIdpurreq(int idpurreq) {
        this.idpurreq = idpurreq;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Bill getBill() {
        return bill;
    }

    public void setBill(Bill bill) {
        this.bill = bill;
    }

    public String sendEmail() {
        String mailBody1 = "\n";
        if (this.getStatus() == null) {
            return null;
        }
        if (this.getStatus().equals("Accepted")) {
            mailBody1 = "\nYour purchase request is accepted. Our staff is currently working on it. Once processed, you will be notified by an email.";
        } else if (this.getStatus().equals("Processed")) {
            mailBody1 = "\nYour purchase request is processed. It is on its way to your doorstep. Thank you for choosing BookPortal.";
        } else if (this.getStatus().equals("New")) {
            mailBody1 = "\nYou have requested online purchase from BookPortal. Please wait while your order is being processed. Thank you for choosing BookPortal.";
        } else {
            return null;
        }

        String mailBody2;

        String mailBody3 = "Bill items : ";
        if (this.getBill() != null) {
            mailBody2 = "Purchase request id : " + this.getIdpurreq() + "\n Bill id : " + this.getBill().getIdbill() + "\nCustomer : " + this.getCustomer() + "\n";
            HashMap<Book, Integer> h = this.getBill().getItems();
            for (Book b : h.keySet()) {
                String title = b.getTitle();
                String unitprice = String.valueOf(b.getPrice());
                String q = String.valueOf(h.get(b));
                mailBody3 = mailBody3 + "\n" + title + "    " + unitprice + " x " + q;
            }
        } else {
            mailBody2 = "Purchase request id : " + this.getIdpurreq() + "\n Bill id : null \nCustomer : " + this.getCustomer() + "\n";
        }

        String mailBody = mailBody1 + mailBody2 + mailBody3;
        System.out.println(mailBody);
        return mailBody1;
    }

    public static boolean insertPurchaseRequest(String cus_name, String cus_address, String cus_email, int idBill) {
        boolean executionstatus = false;
        Connection con = DBConnectionHandler.createConnection();
        try {
            con.setAutoCommit(false);
            String query = "INSERT INTO purchase_req (Customer, Address, Status, Bill_idBill, Email) VALUES (?,?,?,?,?);";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, cus_name);
            ps.setString(2, cus_address);
            ps.setString(3, "New");
            ps.setInt(4, idBill);
            ps.setString(5, cus_email);
            ps.executeUpdate();
            executionstatus = true;
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
//                System.out.println("Oops! Something went wrong.\n");
                return false;
            }
        }
        return executionstatus;
    }

    public static void notifyPaymentError(String cus_name, String cus_address, String cus_email, int idBill) {
        String message = "Purchase request error - bill id :" + idBill + "\n" + cus_name + "/n" + cus_address + "/n" + cus_email;
        //target user is admin
        Notification.insertnotification(1, "PurReqError", message, 0, 0);
    }
}
