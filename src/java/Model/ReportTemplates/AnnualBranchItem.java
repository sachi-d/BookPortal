/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.ReportTemplates;

import java.text.DateFormatSymbols;

/**
 *
 * @author Sachi
 */
public class AnnualBranchItem {

    String month;
    int quantity;
    double monetary_value;

    public AnnualBranchItem(String month, int quantity, double monetary_value) {
        this.month = month;
        this.quantity = quantity;
        this.monetary_value = monetary_value;
    }

    public String getMonth() {
        return month;
    }

    public int getQuantity() {
        return quantity;
    }

    public double getMonetary_value() {
        return monetary_value;
    }
    
    public static int getMonthIDfromName(String name){
        for(int i=1;i<13;i++){
            String m = new DateFormatSymbols().getMonths()[i-1];
            if(m.equals(name)){
                return i;
            }
        }
        return 0;
    }

}
