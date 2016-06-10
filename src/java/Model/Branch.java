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

    public Branch(int idbranch, String name, String address, String telNo) {
        this.idbranch = idbranch;
        this.name = name;
        this.address = address;
        this.telNo = telNo;
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
    
    public static int getBranchIDfromName(String name) {
        int id = 0;
        try {
            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM branch where name=? ";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, name);
            ResultSet rsetBranch = ps.executeQuery();

            while (rsetBranch.next()) {
//                User ba = getBranchadminfromBranch(rsetBranch.getString(2));
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
    
    public void remove(){
        System.out.println("removed branch-"+this.name);
    }
}
