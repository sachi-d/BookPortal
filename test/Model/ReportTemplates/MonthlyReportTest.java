/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.ReportTemplates;

import java.util.ArrayList;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Sachi
 */
public class MonthlyReportTest {
    
    public MonthlyReportTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }

    /**
     * Test of generate method, of class MonthlyReport.
     */
    @Test
    public void testGenerate() {
        System.out.println("generate");
        MonthlyReport instance = null;
        instance.generate();
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getSales method, of class MonthlyReport.
     */
    @Test
    public void testGetSales() {
        System.out.println("getSales");
        MonthlyReport instance = null;
        ArrayList<MonthlyGeneralItem> expResult = null;
        ArrayList<MonthlyGeneralItem> result = instance.getSales();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getPurchases method, of class MonthlyReport.
     */
    @Test
    public void testGetPurchases() {
        System.out.println("getPurchases");
        MonthlyReport instance = null;
        ArrayList<MonthlyGeneralItem> expResult = null;
        ArrayList<MonthlyGeneralItem> result = instance.getPurchases();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getTotalsales method, of class MonthlyReport.
     */
    @Test
    public void testGetTotalsales() {
        System.out.println("getTotalsales");
        MonthlyReport instance = null;
        int expResult = 0;
        int result = instance.getTotalsales();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getTotalpurchases method, of class MonthlyReport.
     */
    @Test
    public void testGetTotalpurchases() {
        System.out.println("getTotalpurchases");
        MonthlyReport instance = null;
        int expResult = 0;
        int result = instance.getTotalpurchases();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getTotalsalesincome method, of class MonthlyReport.
     */
    @Test
    public void testGetTotalsalesincome() {
        System.out.println("getTotalsalesincome");
        MonthlyReport instance = null;
        double expResult = 0.0;
        double result = instance.getTotalsalesincome();
        assertEquals(expResult, result, 0.0);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getTotalpurchaserevenue method, of class MonthlyReport.
     */
    @Test
    public void testGetTotalpurchaserevenue() {
        System.out.println("getTotalpurchaserevenue");
        MonthlyReport instance = null;
        double expResult = 0.0;
        double result = instance.getTotalpurchaserevenue();
        assertEquals(expResult, result, 0.0);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of MGPurchasestoJSArray method, of class MonthlyReport.
     */
    @Test
    public void testMGPurchasestoJSArray() {
        System.out.println("MGPurchasestoJSArray");
        MonthlyReport instance = null;
        String expResult = "";
        String result = instance.MGPurchasestoJSArray();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of MGSalestoJSArray method, of class MonthlyReport.
     */
    @Test
    public void testMGSalestoJSArray() {
        System.out.println("MGSalestoJSArray");
        MonthlyReport instance = null;
        String expResult = "";
        String result = instance.MGSalestoJSArray();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
