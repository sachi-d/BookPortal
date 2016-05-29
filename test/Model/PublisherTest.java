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
public class PublisherTest {

    public PublisherTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    /**
     * Test of getIdpub method, of class Publisher.
     */
    @Test
    public void testGetIdpub() {
        System.out.println("getIdpub");
        Publisher instance = new Publisher(7, "pub_name");
        int expResult = 7;
        int result = instance.getIdpub();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of setIdpub method, of class Publisher.
     */
    @Test
    public void testSetIdpub() {
        System.out.println("setIdpub");
        int idpub = 0;
        Publisher instance = new Publisher(7, "pub_name");
        instance.setIdpub(idpub);
        int expResult = idpub;
        int result = instance.getIdpub();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of getName method, of class Publisher.
     */
    @Test
    public void testGetName() {
        System.out.println("getName");
        Publisher instance = new Publisher(7, "pub_name");
        String expResult = "pub_name";
        String result = instance.getName();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of setName method, of class Publisher.
     */
    @Test
    public void testSetName() {
        System.out.println("setName");
        String name = "new_name";
        Publisher instance = new Publisher(7, "pub_name");
        instance.setName(name);
        String expResult = name;
        String result = instance.getName();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

}
