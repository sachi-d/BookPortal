/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Controller.Executenotification;
import DB.DBConnectionHandler;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sachi
 */
public class Notification {

    private int idnotification;
    private User targetuser;
    private String type;    //intReg , ReportAlert
    private String message;
    private int status;  //1 = open , 0 = closed 
    private User newuser;
    private Report newreport;
    private Timestamp timestamp;

    public Notification(int idnotification, User targetuser, String type, String message, int status, User newuser, Report newreport, Timestamp t) {
        this.idnotification = idnotification;
        this.targetuser = targetuser;
        this.type = type;
        this.message = message;
        this.newuser = newuser;
        this.newreport = newreport;
        this.status = status;
        this.timestamp = t;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    public int getIdnotification() {
        return idnotification;
    }

    public void setIdnotification(int idnotification) {
        this.idnotification = idnotification;
    }

    public User getTargetuser() {
        return targetuser;
    }

    public void setTargetuser(User targetuser) {
        this.targetuser = targetuser;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public User getNewuser() {
        return newuser;
    }

    public void setNewuser(User newuser) {
        this.newuser = newuser;
    }

    public Report getNewreport() {
        return newreport;
    }

    public void setNewreport(Report newreport) {
        this.newreport = newreport;
    }

    public static void insertnotification(int targetuser, String type, String message, int newuser, int newreport) {
        try {
            Connection con = DBConnectionHandler.createConnection();
            con.setAutoCommit(false);
            java.sql.Date today = new Date(Calendar.getInstance().getTimeInMillis());
            try {

                String query = "INSERT INTO notification "
                        + "(targetuser,type,message,status,newuser,newreport,datetime)"
                        + "VALUES (?,?,?,?,?,?,?)";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setInt(1, targetuser);
                ps.setString(2, type);
                ps.setString(3, message);
                ps.setInt(4, 1);
                ps.setInt(5, newuser);
                ps.setInt(6, newreport);
                ps.setDate(7, today);
                ps.executeUpdate();

                con.commit();
            } catch (SQLException ex) {
                Logger.getLogger(Executenotification.class.getName()).log(Level.SEVERE, null, ex);
            }

        } catch (SQLException ex) {
            Logger.getLogger(Executenotification.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static void ignorenotification(int id) {
        try {
            Connection con = DBConnectionHandler.createConnection();
            String query = "UPDATE notification SET status=0 WHERE idNotification=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Executenotification.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
