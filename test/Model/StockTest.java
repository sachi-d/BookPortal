/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.Date;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Sachi
 */
public class StockTest {

    public StockTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    /**
     * Test of getAvailability method, of class Stock.
     */
    @Test
    public void testGetAvailability() {
        System.out.println("getAvailability");
        int idbook =27;
        int expResult = 12;
        int result = Stock.getAvailability(idbook);
        assertEquals(expResult, result);
        
        idbook=66;
        expResult=0;
        result=Stock.getAvailability(idbook);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

}
