/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.ReportTemplates;

/**
 *
 * @author Sachi
 */
public class MonthlyBranchItem {

    String book;
    String type;
    double uprice;
    int quantity;
    double monetary_value;

    public MonthlyBranchItem(String book, String type, double uprice, int quantity, double monetary_value) {
        this.book = book;
        this.type = type;
        this.uprice = uprice;
        this.quantity = quantity;
        this.monetary_value = monetary_value;
    }

    public String getBook() {
        return book;
    }

    public String getType() {
        return type;
    }

    public double getUprice() {
        return uprice;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getMonetary_value() {
        return monetary_value;
    }
    

}
