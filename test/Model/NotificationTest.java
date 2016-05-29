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
public class NotificationTest {

    public NotificationTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    /**
     * Test of getIdnotification method, of class Notification.
     */
    @Test
    public void testGetIdnotification() {
        System.out.println("getIdnotification");
        Notification instance = new Notification(7, null, "type", "message", 8, null, null, null);
        int expResult = 7;
        int result = instance.getIdnotification();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of setIdnotification method, of class Notification.
     */
    @Test
    public void testSetIdnotification() {
        System.out.println("setIdnotification");
        int idnotification = 0;
        Notification instance = new Notification(7, null, "type", "message", 8, null, null, null);
        instance.setIdnotification(idnotification);
        int expResult = idnotification;
        int result = instance.getIdnotification();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of getTargetuser method, of class Notification.
     */
    @Test
    public void testGetTargetuser() {
        System.out.println("getTargetuser");
        Notification instance = new Notification(7, null, "type", "message", 8, null, null, null);
        User expResult = null;
        User result = instance.getTargetuser();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

}
