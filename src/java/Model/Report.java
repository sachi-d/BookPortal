/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import Controller.Savelog;
import DB.DBConnectionHandler;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Sachi
 */
public class Report {

    private int idreport;
    private String type;
    private String title;
    private String location;
    private String month;
    private String branch;
    private int year;

    public Report(int idreport, String type, String title, int year, String month, String branch, String location) {
        this.idreport = idreport;
        this.type = type;
        this.title = title;
        this.location = location;
        this.year = year;
        this.month = month;
        this.branch = branch;
    }

    public int getIdreport() {
        return idreport;
    }

    public void setIdreport(int idreport) {
        this.idreport = idreport;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public void genMonthlyBranchReport() {

    }

    public static int addNewReport(String type, String title, int year, String month, String branch, String location) {
        int lastid = 0;

        Connection con = DBConnectionHandler.createConnection();

        try {

            con.setAutoCommit(false);
            String query = "INSERT INTO report (type, title, year, month, branch, location) VALUES (?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, type);
            ps.setString(2, title);
            ps.setInt(3, year);
            ps.setString(4, month);
            ps.setString(5, branch);
            ps.setString(6, location);
            ps.executeUpdate();
            
             //get the id of the report
            query = "SELECT MAX(idReport) FROM report ";
            ps = con.prepareStatement(query);
            ResultSet rset = ps.executeQuery();
            if (rset.next()) {
                lastid = rset.getInt(1);
            }
            
            con.commit();

        } catch (SQLException e) {
            try {
                con.rollback();
            } catch (SQLException ex) {
            }

        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                System.out.println("Oops! Something went wrong.\n");
            }
        }

        return lastid;
    }
}
