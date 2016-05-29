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
public class AnnualBranchItemTest {
    
    public AnnualBranchItemTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }

    /**
     * Test of getMonth method, of class AnnualBranchItem.
     */
    @Test
    public void testGetMonth() {
        System.out.println("getMonth");
        AnnualBranchItem instance = null;
        String expResult = "";
        String result = instance.getMonth();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getQuantity method, of class AnnualBranchItem.
     */
    @Test
    public void testGetQuantity() {
        System.out.println("getQuantity");
        AnnualBranchItem instance = null;
        int expResult = 0;
        int result = instance.getQuantity();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getMonetary_value method, of class AnnualBranchItem.
     */
    @Test
    public void testGetMonetary_value() {
        System.out.println("getMonetary_value");
        AnnualBranchItem instance = null;
        double expResult = 0.0;
        double result = instance.getMonetary_value();
        assertEquals(expResult, result, 0.0);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
