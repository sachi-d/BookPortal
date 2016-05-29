/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Sachi
 */
public class BranchTest {

    public BranchTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    /**
     * Test of getIdbranch method, of class Branch.
     */
    @Test
    public void testGetIdbranch() {
        System.out.println("getIdbranch");
        Branch instance = new Branch(7, "branch_name", "branch_address", "branch_telno");
        int expResult = 7;
        int result = instance.getIdbranch();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of setIdbranch method, of class Branch.
     */
    @Test
    public void testSetIdbranch() {
        System.out.println("setIdbranch");
        int idbranch = 0;
        Branch instance = new Branch(7, "branch_name", "branch_address", "branch_telno");
        instance.setIdbranch(idbranch);
        int expResult = idbranch;
        int result = instance.getIdbranch();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

}
