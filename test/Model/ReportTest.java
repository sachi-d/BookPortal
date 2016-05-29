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
public class ReportTest {

    public ReportTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    /**
     * Test of getIdreport method, of class Report.
     */
    @Test
    public void testGetIdreport() {
        System.out.println("getIdreport");
        Report instance = new Report(0, "Reg", "new reg", 1999, "month", "branch", "location");
        int expResult = 0;
        int result = instance.getIdreport();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of getType method, of class Report.
     */
    @Test
    public void testGetType() {
        System.out.println("getType");
        Report instance = new Report(0, "Reg", "new reg", 1999, "month", "branch", "location");
        String expResult = "Reg";
        String result = instance.getType();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of getTitle method, of class Report.
     */
    @Test
    public void testGetTitle() {
        System.out.println("getTitle");
        Report instance = new Report(0, "Reg", "new reg", 1999, "month", "branch", "location");
        String expResult = "new reg";
        String result = instance.getTitle();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of getLocation method, of class Report.
     */
    @Test
    public void testGetLocation() {
        System.out.println("getLocation");
        Report instance = new Report(0, "Reg", "new reg", 1999, "month", "branch", "location");
        String expResult = "location";
        String result = instance.getLocation();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of getYear method, of class Report.
     */
    @Test
    public void testGetYear() {
        System.out.println("getYear");
        Report instance = new Report(0, "Reg", "new reg", 1999, "month", "branch", "location");
        int expResult = 1999;
        int result = instance.getYear();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of getMonth method, of class Report.
     */
    @Test
    public void testGetMonth() {
        System.out.println("getMonth");
        Report instance = new Report(0, "Reg", "new reg", 1999, "month", "branch", "location");
        String expResult = "month";
        String result = instance.getMonth();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of getBranch method, of class Report.
     */
    @Test
    public void testGetBranch() {
        System.out.println("getBranch");
        Report instance = new Report(0, "Reg", "new reg", 1999, "month", "branch", "location");
        String expResult = "branch";
        String result = instance.getBranch();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

}
