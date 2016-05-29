/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Timestamp;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Sachi
 */
public class LogTest {

    public LogTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    /**
     * Test of getIdlog method, of class Log.
     */
    @Test
    public void testGetIdlog() {
        System.out.println("getIdlog");
        Log instance = new Log(7, null, "ip", "action", null);
        int expResult = 7;
        int result = instance.getIdlog();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of getIp method, of class Log.
     */
    @Test
    public void testGetIp() {
        System.out.println("getIp");
        Log instance = new Log(7, null, "ip", "action", null);
        String expResult = "ip";
        String result = instance.getIp();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

}
