/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.ReportTemplates;

import Controller.Savelog;
import DB.DBConnectionHandler;
import Model.Branch;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormatSymbols;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Sachi
 */
public final class AnnualBranch {

    private final Branch branch;
    private final int year;
    private int totalsales;
    private int totalpurchases;
    private double salesincome;
    private double purchaserevenue;
    private final ArrayList<AnnualBranchItem> salesrecords;
    private final ArrayList<AnnualBranchItem> purchaserecords;

    public AnnualBranch(Branch branch, int year) {
        this.branch = branch;
        this.year = year;
        this.totalsales = 0;
        this.totalpurchases = 0;
        this.salesincome = 0;
        this.purchaserevenue = 0;
        salesrecords = new ArrayList<>();
        purchaserecords = new ArrayList<>();
        this.generatePurchaseArray();
        this.generateSalesArray();
    }

    //calculate sales;
    public void generateSalesArray() {
        Connection con = DBConnectionHandler.createConnection();
        for (int month = 1; month < 13; month++) {
            String m = new DateFormatSymbols().getMonths()[month];
            try {
                String query = "SELECT * FROM monthlybranchreport where year=? AND month=? AND branch=?";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setInt(1, this.year);
                ps.setInt(2, month);
                ps.setString(3, this.branch.getName());
                ResultSet rsetPurreq = ps.executeQuery();

                while (rsetPurreq.next()) {
                    AnnualBranchItem pur = new AnnualBranchItem(
                            m,
                            rsetPurreq.getInt(5),
                            rsetPurreq.getDouble(7));
                    this.salesrecords.add(pur);
                    this.totalsales += pur.quantity;
                    this.salesincome += pur.monetary_value;
                }

            } catch (Exception e) {
                System.out.println(e);
            }
        }
        try {
            con.close();
        } catch (SQLException ex) {
            System.out.println("Exception");
            Logger.getLogger(AnnualBranch.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void generatePurchaseArray() {
        Connection con = DBConnectionHandler.createConnection();
        for (int month = 1; month < 13; month++) {
            String m = new DateFormatSymbols().getMonths()[month];
            try {
                String query = "SELECT * FROM monthlybranchreport where year=? AND month=? AND branch=?";

                PreparedStatement ps = con.prepareStatement(query);
                ps.setInt(1, this.year);
                ps.setInt(2, month);
                ps.setString(3, this.branch.getName());
                ResultSet rsetPurreq = ps.executeQuery();

                while (rsetPurreq.next()) {
                    AnnualBranchItem pur = new AnnualBranchItem(
                            m,
                            rsetPurreq.getInt(6),
                            rsetPurreq.getDouble(8));

                    purchaserecords.add(pur);
                    totalpurchases += pur.quantity;
                    purchaserevenue += pur.monetary_value;
                }

            } catch (Exception e) {
                System.out.println(e);
            }
        }
        try {
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(AnnualBranch.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getTotalsales() {
        return totalsales;
    }

    public int getTotalpurchases() {
        return totalpurchases;
    }

    public double getSalesincome() {
        return salesincome;
    }

    public double getPurchaserevenue() {
        return purchaserevenue;
    }

    public ArrayList<AnnualBranchItem> getSalesrecords() {
        return salesrecords;
    }

    public ArrayList<AnnualBranchItem> getPurchaserecords() {
        return purchaserecords;
    }

    public void addDatatoDB() {
        Connection con = DBConnectionHandler.createConnection();

        try {

            con.setAutoCommit(false);
            String query = "INSERT INTO annualbranchreport (branch, year, sales, purchases, income, revenue) VALUES (?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, this.branch.getName());
            ps.setInt(2, this.year);
            ps.setInt(3, this.totalsales);
            ps.setInt(4, this.totalpurchases);
            ps.setDouble(5, salesincome);
            ps.setDouble(6, purchaserevenue);
            ps.executeUpdate();
            con.commit();
            Savelog.saveLog(null, "annual branch report generated - " + this.branch.getName() + "-" + this.year);

        } catch (SQLException e) {
            try {
                con.rollback();
            } catch (SQLException ex) {
                Savelog.saveLog(null, "annual branch report failed - " + this.branch.getName() + "-" + this.year);
            }

        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                System.out.println("Oops! Something went wrong.\n");
            }
        }
    }

}
