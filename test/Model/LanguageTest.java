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
public class LanguageTest {
    
    public LanguageTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }

    /**
     * Test of getIdlan method, of class Language.
     */
    @Test
    public void testGetIdlan() {
        System.out.println("getIdlan");
        Language instance = new Language(0, "lan_name");
        int expResult = 0;
        int result = instance.getIdlan();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of setIdlan method, of class Language.
     */
    @Test
    public void testSetIdlan() {
        System.out.println("setIdlan");
        int idlan = 0;
        Language instance = new Language(7, "lan_name");
        instance.setIdlan(idlan);
        int expResult=idlan;
        int result=instance.getIdlan();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of getName method, of class Language.
     */
    @Test
    public void testGetName() {
        System.out.println("getName");
        Language instance = new Language(0, "lan_name");
        String expResult = "lan_name";
        String result = instance.getName();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of setName method, of class Language.
     */
    @Test
    public void testSetName() {
        System.out.println("setName");
        String name = "new_name";
        Language instance = new Language(0, "lan_name");
        instance.setName(name);
        String expResult=name;
        String result=instance.getName();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }
    
}
