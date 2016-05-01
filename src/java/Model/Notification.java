/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Controller.Savelog;
import DB.DBConnectionHandler;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Calendar;

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

    public Notification(int idnotification, User targetuser, String type, String message,int status, User newuser,Report newreport,Timestamp t) {
        this.idnotification = idnotification;
        this.targetuser = targetuser;
        this.type = type;
        this.message = message;
        this.newuser=newuser;
        this.newreport=newreport;
        this.status=status;
        this.timestamp=t;
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
    
    
}
