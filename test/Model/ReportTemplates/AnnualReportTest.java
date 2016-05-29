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
public class AnnualReportTest {
    
    public AnnualReportTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }

    /**
     * Test of generate method, of class AnnualReport.
     */
    @Test
    public void testGenerate() {
        System.out.println("generate");
        AnnualReport instance = null;
        instance.generate();
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getSalesrecords method, of class AnnualReport.
     */
    @Test
    public void testGetSalesrecords() {
        System.out.println("getSalesrecords");
        AnnualReport instance = null;
        ArrayList<AnnualGeneralItem> expResult = null;
        ArrayList<AnnualGeneralItem> result = instance.getSalesrecords();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getPurchaserecords method, of class AnnualReport.
     */
    @Test
    public void testGetPurchaserecords() {
        System.out.println("getPurchaserecords");
        AnnualReport instance = null;
        ArrayList<AnnualGeneralItem> expResult = null;
        ArrayList<AnnualGeneralItem> result = instance.getPurchaserecords();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getTotalsales method, of class AnnualReport.
     */
    @Test
    public void testGetTotalsales() {
        System.out.println("getTotalsales");
        AnnualReport instance = null;
        int expResult = 0;
        int result = instance.getTotalsales();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getTotalpurchase method, of class AnnualReport.
     */
    @Test
    public void testGetTotalpurchase() {
        System.out.println("getTotalpurchase");
        AnnualReport instance = null;
        int expResult = 0;
        int result = instance.getTotalpurchase();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getTotalsalesincome method, of class AnnualReport.
     */
    @Test
    public void testGetTotalsalesincome() {
        System.out.println("getTotalsalesincome");
        AnnualReport instance = null;
        double expResult = 0.0;
        double result = instance.getTotalsalesincome();
        assertEquals(expResult, result, 0.0);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getTotalpurchaserevenue method, of class AnnualReport.
     */
    @Test
    public void testGetTotalpurchaserevenue() {
        System.out.println("getTotalpurchaserevenue");
        AnnualReport instance = null;
        double expResult = 0.0;
        double result = instance.getTotalpurchaserevenue();
        assertEquals(expResult, result, 0.0);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of AGPurchasestoJSArray method, of class AnnualReport.
     */
    @Test
    public void testAGPurchasestoJSArray() {
        System.out.println("AGPurchasestoJSArray");
        AnnualReport instance = null;
        String expResult = "";
        String result = instance.AGPurchasestoJSArray();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of AGSalestoJSArray method, of class AnnualReport.
     */
    @Test
    public void testAGSalestoJSArray() {
        System.out.println("AGSalestoJSArray");
        AnnualReport instance = null;
        String expResult = "";
        String result = instance.AGSalestoJSArray();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
