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
public class SubjectTest {

    public SubjectTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    /**
     * Test of getType method, of class Subject.
     */
    @Test
    public void testGetType() {
        System.out.println("getType");
        Subject instance = new Subject(4, "sub_name", null);
        Type expResult = null;
        Type result = instance.getType();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of setType method, of class Subject.
     */
    @Test
    public void testSetType() {
        System.out.println("setType");
        Type type = null;
        Subject instance = new Subject(4, "sub_name", new Type(0, "type"));
        instance.setType(type);
        Type expResult = null;
        Type result = instance.getType();
        assertEquals(expResult, result);

        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of getIdsubject method, of class Subject.
     */
    @Test
    public void testGetIdsubject() {
        System.out.println("getIdsubject");
        Subject instance = new Subject(4, "sub_name", new Type(0, "type"));
        int expResult = 4;
        int result = instance.getIdsubject();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of getName method, of class Subject.
     */
    @Test
    public void testGetName() {
        System.out.println("getName");
        Subject instance = new Subject(4, "sub_name", new Type(0, "type"));
        String expResult = "sub_name";
        String result = instance.getName();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

}
