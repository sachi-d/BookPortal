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
    
    public void sendEmail() {
        String mailBody1 = "\n";
        if (this.getStatus().equals("Accepted")) {
            mailBody1 = "\nYour purchase request is accepted. Our staff is currently working on it. Once processed, you will be notified by an email.";
        } else if (this.getStatus().equals("Processed")) {
            mailBody1 = "\nYour purchase request is processed. It is on its way to your doorstep. Thank you for choosing BookPortal.";
        }else if (this.getStatus().equals("New")) {
            mailBody1 = "\nYou have requested online purchase from BookPortal. Please wait while your order is being processed. Thank you for choosing BookPortal.";
        }
        String mailBody2 = "Purchase request id : " + this.getIdpurreq() + "\n Bill id : " + this.getBill().getIdbill() + "\nCustomer : " + this.getCustomer() + "\n";
        
        String mailBody3 = "Bill items : ";
        HashMap<Book, Integer> h = this.getBill().getItems();
        for (Book b : h.keySet()) {
            String title = b.getTitle();
            String unitprice = String.valueOf(b.getPrice());
            String q = String.valueOf(h.get(b));
            mailBody3=mailBody3+"\n"+title+"    "+unitprice+" x "+q;
        }
        
        String mailBody=mailBody1+mailBody2+mailBody3;
        System.out.println(mailBody);
    }
    
}
