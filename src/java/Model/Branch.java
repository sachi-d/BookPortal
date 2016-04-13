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
public class Branch {
    private int idbranch;
    private String name;
    private String address;
    private String telNo;
    private int status;
    private User branchAdmin;

    public Branch(int idbranch, String name, String address, String telNo, User u) {
        this.idbranch = idbranch;
        this.name = name;
        this.address = address;
        this.telNo = telNo;
        branchAdmin=u;
    }

    public int getIdbranch() {
        return idbranch;
    }

    public void setIdbranch(int idbranch) {
        this.idbranch = idbranch;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTelNo() {
        return telNo;
    }

    public void setTelNo(String telNo) {
        this.telNo = telNo;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public User getBranchAdmin() {
        return branchAdmin;
    }

    public void setBranchAdmin(User branchAdmin) {
        this.branchAdmin = branchAdmin;
    }
    
    
}
