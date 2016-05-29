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
public class PurchaserequestTest {
    
    public PurchaserequestTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }

    /**
     * Test of sendEmail method, of class Purchaserequest.
     */
    @Test
    public void testSendEmail() {
        System.out.println("sendEmail");
        Purchaserequest instance = new Purchaserequest(7, "customer_name", "customer_email", "customer_address", "New", null);
        String result = instance.sendEmail();
        String expResult = "\nYou have requested online purchase from BookPortal. Please wait while your order is being processed. Thank you for choosing BookPortal.";
        assertEquals(expResult, result);
        
        instance.setStatus("Accepted");
        expResult = "\nYour purchase request is accepted. Our staff is currently working on it. Once processed, you will be notified by an email.";
        result = instance.sendEmail();
        assertEquals(expResult, result);
        
        instance.setStatus("Processed");
        expResult = "\nYour purchase request is processed. It is on its way to your doorstep. Thank you for choosing BookPortal.";
        result = instance.sendEmail();
        assertEquals(expResult, result);
        
        instance.setStatus(null);
        expResult = null;
        result = instance.sendEmail();
        assertEquals(expResult, result);
        
        instance.setStatus("fdf");
        expResult = null;
        result = instance.sendEmail();
        assertEquals(expResult, result);
// TODO review the generated test code and remove the default call to fail.
    }
    
}
