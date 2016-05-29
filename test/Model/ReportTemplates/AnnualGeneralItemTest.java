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
public class AnnualGeneralItemTest {
    
    public AnnualGeneralItemTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }

    /**
     * Test of getBranch method, of class AnnualGeneralItem.
     */
    @Test
    public void testGetBranch() {
        System.out.println("getBranch");
        AnnualGeneralItem instance = null;
        String expResult = "";
        String result = instance.getBranch();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getQuantity method, of class AnnualGeneralItem.
     */
    @Test
    public void testGetQuantity() {
        System.out.println("getQuantity");
        AnnualGeneralItem instance = null;
        int expResult = 0;
        int result = instance.getQuantity();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getMonetary_value method, of class AnnualGeneralItem.
     */
    @Test
    public void testGetMonetary_value() {
        System.out.println("getMonetary_value");
        AnnualGeneralItem instance = null;
        double expResult = 0.0;
        double result = instance.getMonetary_value();
        assertEquals(expResult, result, 0.0);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
