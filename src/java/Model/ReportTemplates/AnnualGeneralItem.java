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
public class AnnualGeneralItem {

    String branch;
    int quantity;
    double monetary_value;

    public AnnualGeneralItem(String branch, int quantity, double monetary_value) {
        this.branch = branch;
        this.quantity = quantity;
        this.monetary_value = monetary_value;
    }

    public String getBranch() {
        return branch;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getMonetary_value() {
        return monetary_value;
    }
}
