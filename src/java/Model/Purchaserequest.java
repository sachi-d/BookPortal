/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Sachi
 */
public class Purchaserequest {
    private int idpurreq;
    private String customer;
    private String address;
    private String status;
    private Bill bill;

    public Purchaserequest(int idpurreq, String customer, String address, String status, Bill bill) {
        this.idpurreq = idpurreq;
        this.customer = customer;
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

    public Bill getIdbill() {
        return bill;
    }

    public void setIdbill(Bill bill) {
        this.bill = bill;
    }
    
    
}
