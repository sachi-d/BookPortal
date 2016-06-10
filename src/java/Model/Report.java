/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import DB.DBConnectionHandler;
import Model.ReportTemplates.AnnualReport;
import Model.ReportTemplates.MonthlyReport;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;

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

    public static boolean isMonthlyReportSet(int year, int month) {
        try {
            boolean isset = false;
            Connection con = DBConnectionHandler.createConnection();
            String query = "SELECT * FROM monthlybranchreport where year=? AND month=? ";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, year);
            ps.setInt(2, month);
            ResultSet rsetPurreq = ps.executeQuery();

            while (rsetPurreq.next()) {
                isset = true;
            }
            con.close();
            return isset;

        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    public static void generateReports(int month,int year) {
//        Date today = new Date();
//        Calendar cal = Calendar.getInstance();
//        cal.setTime(today);
//        int month = cal.get(Calendar.MONTH) + 1;
//        int year = cal.get(Calendar.YEAR);
        MonthlyReport monthrep = new MonthlyReport(month, year);
        monthrep.addInformation();
        if (month == 1) {  //if it is a new year (checked by january)  month==1
            AnnualReport annualrep = new AnnualReport(year - 1);
            annualrep.addInformation();
        }

    }

}
