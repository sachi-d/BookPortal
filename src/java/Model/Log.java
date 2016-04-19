/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Timestamp;
import java.util.Date;

/**
 *
 * @author Sachi
 */
public class Log {
    private int idlog;
    private User user;
    private String ip;
    private String action;
    private Timestamp timestamp;

    public Log(int idlog, Timestamp timestamp, String ip, String action,User user ) {
        this.idlog = idlog;
        this.user = user;
        this.ip = ip;
        this.action = action;
        this.timestamp = timestamp;
    }

    public int getIdlog() {
        return idlog;
    }

    public void setIdlog(int idlog) {
        this.idlog = idlog;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getDescription() {
        return action;
    }

    public void setDescription(String action) {
        this.action = action;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }
    
    
}
