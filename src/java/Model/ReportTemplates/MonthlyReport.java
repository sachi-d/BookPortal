/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.ReportTemplates;

import Controller.DBDatalist;
import Model.Branch;
import java.util.ArrayList;

/**
 *
 * @author Sachi
 */
public final class MonthlyReport {

    private final int month;
    private final int year;
    private final ArrayList<MonthlyGeneralItem> sales;
    private final ArrayList<MonthlyGeneralItem> purchases;
    private int totalsales;
    private int totalpurchases;
    private double totalsalesincome;
    private double totalpurchaserevenue;

    public MonthlyReport(int month, int year) {
        this.month = month;
        this.year = year;
        this.totalpurchaserevenue = 0;
        this.totalpurchases = 0;
        this.totalsales = 0;
        this.totalsalesincome = 0;
        sales = new ArrayList<>();
        purchases = new ArrayList<>();
        this.generate();
    }

    public void generate() {
        for (Branch b : DBDatalist.getBranchList()) {
            MonthlyBranch mbr = new MonthlyBranch(this.year, this.month, b);

            //add ttal sales and total sales income
            MonthlyGeneralItem mgitem = new MonthlyGeneralItem(b.getName(), mbr.getTotalsales(), mbr.getTotalsalesincome());
            this.sales.add(mgitem);
            this.totalsales += mbr.getTotalsales();
            this.totalsalesincome += mbr.getTotalsalesincome();

            //add total purchases and purchase revenue
            MonthlyGeneralItem mgitem2 = new MonthlyGeneralItem(b.getName(), mbr.getTotalpurchases(), mbr.getTotalpurchaserevenue());
            this.purchases.add(mgitem2);
            this.totalpurchases += mbr.getTotalpurchases();
            this.totalpurchaserevenue += mbr.getTotalpurchaserevenue();
            
            //add to database
            mbr.addDatatoDB();
        }
    }

    public ArrayList<MonthlyGeneralItem> getSales() {
        return sales;
    }

    public ArrayList<MonthlyGeneralItem> getPurchases() {
        return purchases;
    }

    public int getTotalsales() {
        return totalsales;
    }

    public int getTotalpurchases() {
        return totalpurchases;
    }

    public double getTotalsalesincome() {
        return totalsalesincome;
    }

    public double getTotalpurchaserevenue() {
        return totalpurchaserevenue;
    }

    
}
