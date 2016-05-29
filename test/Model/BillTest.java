/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.Date;
import java.util.HashMap;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Sachi
 */
public class BillTest {

    public BillTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    /**
     * Test of getIdbill method, of class Bill.
     */
    @Test
    public void testGetIdbill() {
        System.out.println("getIdbill");
        Bill instance = new Bill(0, new Date(), 0, "paymethod", null, null);
        int expResult = 0;
        int result = instance.getIdbill();

        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.

    }

    /**
     * Test of setIdbill method, of class Bill.
     */
    @Test
    public void testSetIdbill() {
        System.out.println("setIdbill");
        int idbill = 0;
        Bill instance = new Bill(0, new Date(), 0, "paymethod", null, null);
        instance.setIdbill(idbill);
        int expResult = idbill;
        int result = instance.getIdbill();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of getDate method, of class Bill.
     */
    @Test
    public void testGetDate() {
        System.out.println("getDate");
        Bill instance = new Bill(0, new Date(), 0, "paymethod", null, null);
        Date expResult = new Date();
        Date result = instance.getDate();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of setDate method, of class Bill.
     */
    @Test
    public void testSetDate() {
        System.out.println("setDate");
        Date date = new Date();
        Bill instance = new Bill(0, new Date(), 0, "paymethod", null, null);
        instance.setDate(date);
        Date expResult = date;
        Date result = instance.getDate();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

}
