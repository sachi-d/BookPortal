/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.ReportTemplates;

import Controller.DBDatalist;
import Controller.Executenotification;
import Model.Branch;
import Model.Report;
import Model.User;
import java.text.DateFormatSymbols;
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
//            mbr.addDatatoDB();
//generate notifications for each branchadmin and admin
//            String reporttitle = "Monthly Report - " + b.getName() + " - " + this.month ;
//            String reportmonth=new DateFormatSymbols().getMonths()[this.month - 1];
//            int repid=Report.addNewReport("MB", reporttitle, this.year,reportmonth,b.getName(),"location");
//            User badmin=DBDatalist.getBranchadminfromBranch(b);
//            Executenotification.insertnotification(badmin.getIduser(), "MB", reporttitle, 0, repid);
//            int adminid=1;
//            Executenotification.insertnotification(adminid, "MB", reporttitle, 0, repid);
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

    public String MGPurchasestoJSArray() {

        //format
//data: [[1, 800], [2, 600], [3, 200], [4, 200], [5, 90], [6, 500], [7, 600], [8, 550], [9, 600], [10, 800], [11, 900], [12, 800], ],
        ArrayList<MonthlyGeneralItem> arr = getPurchases();
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        for (int i = 0; i < arr.size(); i++) {
            String monthdigit = String.valueOf(i + 1);
            String salescount = String.valueOf(arr.get(i).getQuantity());
            String val = "[" + monthdigit + "," + salescount + "]";
            sb.append(val);
//            if (i + 1 < arr.size()) {
            sb.append(",");
//            }
        }
        sb.append("]");
        return sb.toString();////
    }

    public String MGSalestoJSArray() {

        //format
//data: [[1, 800], [2, 600], [3, 200], [4, 200], [5, 90], [6, 500], [7, 600], [8, 550], [9, 600], [10, 800], [11, 900], [12, 800], ],
        ArrayList<MonthlyGeneralItem> arr = getSales();
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        for (int i = 0; i < arr.size(); i++) {
            String monthdigit = String.valueOf(i + 1);
            String salescount = String.valueOf(arr.get(i).getQuantity());
            String val = "[" + monthdigit + "," + salescount + "]";
            sb.append(val);
//            if (i + 1 < arr.size()) {
            sb.append(",");
//            }
        }
        sb.append("]");
        return sb.toString();////
    }
}
