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
public final class AnnualReport {

    private int year;
    private ArrayList<AnnualBranchItem> salesrecords;
    private ArrayList<AnnualBranchItem> purchaserecords;
    private int totalsales;
    private int totalpurchase;
    private double totalsalesincome;
    private double totalpurchaserevenue;

    public AnnualReport(int year) {
        this.year = year;
        salesrecords = new ArrayList<>();
        purchaserecords = new ArrayList<>();
        totalpurchase = 0;
        totalpurchaserevenue = 0;
        totalsales = 0;
        totalsalesincome = 0;
        this.generate();
    }

    public void generate() {
        for (Branch b : DBDatalist.getBranchList()) {
            AnnualBranch abr = new AnnualBranch(b, this.year);
            //add to the collection of branch reports

            //add ttal sales and total sales income
            AnnualBranchItem abi = new AnnualBranchItem(b.getName(), abr.getTotalsales(), abr.getSalesincome());
            this.salesrecords.add(abi);
            this.totalsales += abr.getTotalsales();
            this.totalsalesincome += abr.getSalesincome();

            //add total purchases and purchase revenue
            AnnualBranchItem abii = new AnnualBranchItem(b.getName(), abr.getTotalpurchases(), abr.getPurchaserevenue());
            this.purchaserecords.add(abii);
            this.totalpurchase += abr.getTotalpurchases();
            this.totalpurchaserevenue += abr.getPurchaserevenue();

            //add to database
//            abr.addDatatoDB();
        }
    }

    public ArrayList<AnnualBranchItem> getSalesrecords() {
        return salesrecords;
    }

    public ArrayList<AnnualBranchItem> getPurchaserecords() {
        return purchaserecords;
    }

    public int getTotalsales() {
        return totalsales;
    }

    public int getTotalpurchase() {
        return totalpurchase;
    }

    public double getTotalsalesincome() {
        return totalsalesincome;
    }

    public double getTotalpurchaserevenue() {
        return totalpurchaserevenue;
    }

    public String AGPurchasestoJSArray() {

        //format
//data: [[1, 800], [2, 600], [3, 200], [4, 200], [5, 90], [6, 500], [7, 600], [8, 550], [9, 600], [10, 800], [11, 900], [12, 800], ],
        ArrayList<AnnualBranchItem> arr = getPurchaserecords();
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        for (int i = 0; i < arr.size(); i++) {
            String monthdigit = String.valueOf(i+1);
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
    
    public String AGSalestoJSArray() {

        //format
//data: [[1, 800], [2, 600], [3, 200], [4, 200], [5, 90], [6, 500], [7, 600], [8, 550], [9, 600], [10, 800], [11, 900], [12, 800], ],
        ArrayList<AnnualBranchItem> arr = getSalesrecords();
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        for (int i = 0; i < arr.size(); i++) {
            String monthdigit = String.valueOf(i+1);
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
