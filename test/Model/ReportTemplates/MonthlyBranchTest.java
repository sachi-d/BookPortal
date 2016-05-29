/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.ReportTemplates;

import Model.Branch;
import java.util.ArrayList;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Sachi
 */
public class MonthlyBranchTest {
    
    public MonthlyBranchTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }

    /**
     * Test of generateSalesArray method, of class MonthlyBranch.
     */
    @Test
    public void testGenerateSalesArray() {
        System.out.println("generateSalesArray");
        MonthlyBranch instance = null;
        instance.generateSalesArray();
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of generatePurchaseArray method, of class MonthlyBranch.
     */
    @Test
    public void testGeneratePurchaseArray() {
        System.out.println("generatePurchaseArray");
        MonthlyBranch instance = null;
        instance.generatePurchaseArray();
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getYear method, of class MonthlyBranch.
     */
    @Test
    public void testGetYear() {
        System.out.println("getYear");
        MonthlyBranch instance = null;
        int expResult = 0;
        int result = instance.getYear();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getMonth method, of class MonthlyBranch.
     */
    @Test
    public void testGetMonth() {
        System.out.println("getMonth");
        MonthlyBranch instance = null;
        int expResult = 0;
        int result = instance.getMonth();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getBranch method, of class MonthlyBranch.
     */
    @Test
    public void testGetBranch() {
        System.out.println("getBranch");
        MonthlyBranch instance = null;
        Branch expResult = null;
        Branch result = instance.getBranch();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getSales method, of class MonthlyBranch.
     */
    @Test
    public void testGetSales() {
        System.out.println("getSales");
        MonthlyBranch instance = null;
        ArrayList<MonthlyBranchItem> expResult = null;
        ArrayList<MonthlyBranchItem> result = instance.getSales();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getPurchases method, of class MonthlyBranch.
     */
    @Test
    public void testGetPurchases() {
        System.out.println("getPurchases");
        MonthlyBranch instance = null;
        ArrayList<MonthlyBranchItem> expResult = null;
        ArrayList<MonthlyBranchItem> result = instance.getPurchases();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getTotalsales method, of class MonthlyBranch.
     */
    @Test
    public void testGetTotalsales() {
        System.out.println("getTotalsales");
        MonthlyBranch instance = null;
        int expResult = 0;
        int result = instance.getTotalsales();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getTotalpurchases method, of class MonthlyBranch.
     */
    @Test
    public void testGetTotalpurchases() {
        System.out.println("getTotalpurchases");
        MonthlyBranch instance = null;
        int expResult = 0;
        int result = instance.getTotalpurchases();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getTotalsalesincome method, of class MonthlyBranch.
     */
    @Test
    public void testGetTotalsalesincome() {
        System.out.println("getTotalsalesincome");
        MonthlyBranch instance = null;
        double expResult = 0.0;
        double result = instance.getTotalsalesincome();
        assertEquals(expResult, result, 0.0);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getTotalpurchaserevenue method, of class MonthlyBranch.
     */
    @Test
    public void testGetTotalpurchaserevenue() {
        System.out.println("getTotalpurchaserevenue");
        MonthlyBranch instance = null;
        double expResult = 0.0;
        double result = instance.getTotalpurchaserevenue();
        assertEquals(expResult, result, 0.0);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of addDatatoDB method, of class MonthlyBranch.
     */
    @Test
    public void testAddDatatoDB() {
        System.out.println("addDatatoDB");
        MonthlyBranch instance = null;
        instance.addDatatoDB();
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of MBPurchasestoJSArray method, of class MonthlyBranch.
     */
    @Test
    public void testMBPurchasestoJSArray() {
        System.out.println("MBPurchasestoJSArray");
        MonthlyBranch instance = null;
        String expResult = "";
        String result = instance.MBPurchasestoJSArray();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of MBSalestoJSArray method, of class MonthlyBranch.
     */
    @Test
    public void testMBSalestoJSArray() {
        System.out.println("MBSalestoJSArray");
        MonthlyBranch instance = null;
        String expResult = "";
        String result = instance.MBSalestoJSArray();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
