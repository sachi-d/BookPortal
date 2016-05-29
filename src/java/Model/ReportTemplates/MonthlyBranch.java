/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.ReportTemplates;

import Controller.DBDatalist;
import Controller.Savelog;
import DB.DBConnectionHandler;
import Model.Bill;
import Model.Book;
import Model.Branch;
import Model.Stock;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

/**
 *
 * @author Sachi
 */
public final class MonthlyBranch {

    private final int year;
    private final int month;
    private final Branch branch;
//    String filelocation;
    private final ArrayList<MonthlyBranchItem> sales;
    private final ArrayList<MonthlyBranchItem> purchases;
    private int totalsales;
    private int totalpurchases;
    private double totalsalesincome;
    private double totalpurchaserevenue;

    public MonthlyBranch(int year, int month, Branch branch) {
        this.year = year;
        this.month = month;
        this.branch = branch;
        sales = new ArrayList<>();
        purchases = new ArrayList<>();
        totalsales = 0;
        totalpurchases = 0;
        totalpurchaserevenue = 0;
        totalsalesincome = 0;
        this.generatePurchaseArray();
        this.generateSalesArray();
    }

    //calculate sales;
    public void generateSalesArray() {
        ArrayList<Bill> bills = new ArrayList<>();
        for (Bill b : DBDatalist.getBillList()) {
            if (b.getIssue_user().getBranch().getIdbranch() == this.branch.getIdbranch()) {
                Calendar cal = Calendar.getInstance();
                cal.setTime(b.getDate());
                if (cal.get(Calendar.YEAR) == this.year) {
                    if (cal.get(Calendar.MONTH) + 1 == this.month) {
                        bills.add(b);
                    }
                }

            }
        }
        HashMap<Book, Integer> salesbooks = new HashMap<>();
        for (Bill b : bills) {
            HashMap<Book, Integer> items = b.getItems();
            for (Book book : items.keySet()) {
                int q = items.get(book);
                boolean isin = false;
                for (Book bb : salesbooks.keySet()) {
                    if (bb.getIdbook() == book.getIdbook()) {
                        // *book is already added to list - therefore increase quantity
                        q += salesbooks.get(bb);
                        salesbooks.put(bb, q);
                        isin = true;
                        break;
                    }
                }
                if (!isin) {
                    salesbooks.put(book, q);
                }

            }
        }
        for (Book v : salesbooks.keySet()) {
            double income = v.getPrice() * salesbooks.get(v);
            MonthlyBranchItem m = new MonthlyBranchItem(v.getTitle(), v.getSubject().getType().getName(), v.getPrice(), salesbooks.get(v), income);
            sales.add(m);
            this.totalsales += salesbooks.get(v);
            this.totalsalesincome += (income);
        }
    }

    //calculate purchases;
    public void generatePurchaseArray() {
        ArrayList<Stock> stocks = new ArrayList<>();
        for (Stock s : DBDatalist.getStockList()) {
            if (s.getBranch().getIdbranch() == this.branch.getIdbranch()) {
                Calendar cal = Calendar.getInstance();
                cal.setTime(s.getDate());
                if (cal.get(Calendar.YEAR) == this.year) {
                    if (cal.get(Calendar.MONTH) + 1 == this.month) {
                        stocks.add(s);
                    }
                }
            }
        }
        HashMap<Book, Integer> purchasedbooks = new HashMap<>();

        for (Stock ss : stocks) {
            Book book = ss.getBook();
            int q = ss.getQuantity();
            boolean isin = false;
            for (Book bb : purchasedbooks.keySet()) {
                if (bb.getIdbook() == book.getIdbook()) {
                    // *book is already added to list - therefore increase quantity
                    q += purchasedbooks.get(bb);
                    purchasedbooks.put(bb, q);
                    isin = true;
                    break;
                }
            }
            if (!isin) {
                purchasedbooks.put(book, q);
            }

        }
        for (Book v : purchasedbooks.keySet()) {
            double income = v.getPrice() * purchasedbooks.get(v);
            MonthlyBranchItem m = new MonthlyBranchItem(v.getTitle(), v.getSubject().getType().getName(), v.getPrice(), purchasedbooks.get(v), income);
            purchases.add(m);
            totalpurchases += purchasedbooks.get(v);
            totalpurchaserevenue += income;
        }
    }

    public int getYear() {
        return year;
    }

    public int getMonth() {
        return month;
    }

    public Branch getBranch() {
        return branch;
    }

    public ArrayList<MonthlyBranchItem> getSales() {
//        this.generateSalesArray();
        return sales;
    }

    public ArrayList<MonthlyBranchItem> getPurchases() {
//        this.generatePurchaseArray();
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

    public void addDatatoDB() {
        Connection con = DBConnectionHandler.createConnection();

        try {

            con.setAutoCommit(false);
            String query = "INSERT INTO monthlybranchreport (branch, year, month, totalsales, totalpurchases, income, revenue) VALUES (?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, this.branch.getName());
            ps.setInt(2, this.year);
            ps.setInt(3, this.month);
            ps.setInt(4, this.totalsales);
            ps.setInt(5, this.totalpurchases);
            ps.setDouble(6, totalsalesincome);
            ps.setDouble(7, totalpurchaserevenue);
            ps.executeUpdate();
            con.commit();
            Savelog.saveLog(null, "monthly branch report generated - " + this.branch.getName() + "-" + this.month + "-" + this.year);

        } catch (SQLException e) {
            try {
                con.rollback();
            } catch (SQLException ex) {
                Savelog.saveLog(null, "monthly branch report failed - " + this.branch.getName() + "-" + this.month + "-" + this.year);
            }

        } finally {
            try {
                con.close();
            } catch (SQLException e) {
                System.out.println("Oops! Something went wrong.\n");
            }
        }
    }

//    public static void main(String[] args) {
//        Branch b = DBDatalist.getBranch(1);
//        MonthlyBranch m = new MonthlyBranch(2016, 2, b);
//        m.generatePurchaseArray();
//    }
    public String MBPurchasestoJSArray() {

        //format
//data: [[1, 800], [2, 600], [3, 200], [4, 200], [5, 90], [6, 500], [7, 600], [8, 550], [9, 600], [10, 800], [11, 900], [12, 800], ],
        ArrayList<MonthlyBranchItem> arr = getPurchases();
        StringBuilder sb = new StringBuilder();
        sb.append("[");
        for (int i = 0; i < arr.size(); i++) {
            String monthdigit = String.valueOf(i + 1);//the book name
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

    public String MBSalestoJSArray() {

        //format
//data: [[1, 800], [2, 600], [3, 200], [4, 200], [5, 90], [6, 500], [7, 600], [8, 550], [9, 600], [10, 800], [11, 900], [12, 800], ],
        ArrayList<MonthlyBranchItem> arr = getSales();
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
