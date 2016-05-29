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
public class AnnualBranchTest {
    
    public AnnualBranchTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }

    /**
     * Test of generateSalesArray method, of class AnnualBranch.
     */
    @Test
    public void testGenerateSalesArray() {
        System.out.println("generateSalesArray");
        AnnualBranch instance = null;
        instance.generateSalesArray();
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of generatePurchaseArray method, of class AnnualBranch.
     */
    @Test
    public void testGeneratePurchaseArray() {
        System.out.println("generatePurchaseArray");
        AnnualBranch instance = null;
        instance.generatePurchaseArray();
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getTotalsales method, of class AnnualBranch.
     */
    @Test
    public void testGetTotalsales() {
        System.out.println("getTotalsales");
        AnnualBranch instance = null;
        int expResult = 0;
        int result = instance.getTotalsales();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getTotalpurchases method, of class AnnualBranch.
     */
    @Test
    public void testGetTotalpurchases() {
        System.out.println("getTotalpurchases");
        AnnualBranch instance = null;
        int expResult = 0;
        int result = instance.getTotalpurchases();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getSalesincome method, of class AnnualBranch.
     */
    @Test
    public void testGetSalesincome() {
        System.out.println("getSalesincome");
        AnnualBranch instance = null;
        double expResult = 0.0;
        double result = instance.getSalesincome();
        assertEquals(expResult, result, 0.0);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getPurchaserevenue method, of class AnnualBranch.
     */
    @Test
    public void testGetPurchaserevenue() {
        System.out.println("getPurchaserevenue");
        AnnualBranch instance = null;
        double expResult = 0.0;
        double result = instance.getPurchaserevenue();
        assertEquals(expResult, result, 0.0);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getSalesrecords method, of class AnnualBranch.
     */
    @Test
    public void testGetSalesrecords() {
        System.out.println("getSalesrecords");
        AnnualBranch instance = null;
        ArrayList<AnnualBranchItem> expResult = null;
        ArrayList<AnnualBranchItem> result = instance.getSalesrecords();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getPurchaserecords method, of class AnnualBranch.
     */
    @Test
    public void testGetPurchaserecords() {
        System.out.println("getPurchaserecords");
        AnnualBranch instance = null;
        ArrayList<AnnualBranchItem> expResult = null;
        ArrayList<AnnualBranchItem> result = instance.getPurchaserecords();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of addDatatoDB method, of class AnnualBranch.
     */
    @Test
    public void testAddDatatoDB() {
        System.out.println("addDatatoDB");
        AnnualBranch instance = null;
        instance.addDatatoDB();
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of ABPurchasestoJSArray method, of class AnnualBranch.
     */
    @Test
    public void testABPurchasestoJSArray() {
        System.out.println("ABPurchasestoJSArray");
        AnnualBranch instance = null;
        String expResult = "";
        String result = instance.ABPurchasestoJSArray();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of ABSalestoJSArray method, of class AnnualBranch.
     */
    @Test
    public void testABSalestoJSArray() {
        System.out.println("ABSalestoJSArray");
        AnnualBranch instance = null;
        String expResult = "";
        String result = instance.ABSalestoJSArray();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
