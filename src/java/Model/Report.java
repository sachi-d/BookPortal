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
public class Report {
    private int idreport;
    private String type;
    private String title;
    private String location;
    private String month;
    private String branch;
    private int year;

    public Report(int idreport, String type, String title,  int year,String month,String branch,String location) {
        this.idreport = idreport;
        this.type = type;
        this.title = title;
        this.location = location;
        this.year = year;
        this.month=month;
        this.branch=branch;
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
    
    public void genMonthlyBranchReport(){
        
    }
}
