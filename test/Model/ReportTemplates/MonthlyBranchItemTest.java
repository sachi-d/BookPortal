/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.ReportTemplates;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Sachi
 */
public class MonthlyBranchItemTest {
    
    public MonthlyBranchItemTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }

    /**
     * Test of getBook method, of class MonthlyBranchItem.
     */
    @Test
    public void testGetBook() {
        System.out.println("getBook");
        MonthlyBranchItem instance = null;
        String expResult = "";
        String result = instance.getBook();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getType method, of class MonthlyBranchItem.
     */
    @Test
    public void testGetType() {
        System.out.println("getType");
        MonthlyBranchItem instance = null;
        String expResult = "";
        String result = instance.getType();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getUprice method, of class MonthlyBranchItem.
     */
    @Test
    public void testGetUprice() {
        System.out.println("getUprice");
        MonthlyBranchItem instance = null;
        double expResult = 0.0;
        double result = instance.getUprice();
        assertEquals(expResult, result, 0.0);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getQuantity method, of class MonthlyBranchItem.
     */
    @Test
    public void testGetQuantity() {
        System.out.println("getQuantity");
        MonthlyBranchItem instance = null;
        int expResult = 0;
        int result = instance.getQuantity();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getMonetary_value method, of class MonthlyBranchItem.
     */
    @Test
    public void testGetMonetary_value() {
        System.out.println("getMonetary_value");
        MonthlyBranchItem instance = null;
        double expResult = 0.0;
        double result = instance.getMonetary_value();
        assertEquals(expResult, result, 0.0);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
