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
public class TypeTest {

    public TypeTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    /**
     * Test of getIdType method, of class Type.
     */
    @Test
    public void testGetIdType() {
        System.out.println("getIdType");
        Type instance = new Type(3, "sample_type_name");
        int expResult = 3;
        int result = instance.getIdType();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
    }

    /**
     * Test of setIdType method, of class Type.
     */
    @Test
    public void testSetIdType() {
        System.out.println("setIdType");
        int idType = 0;
        Type instance = new Type(3, "sample_type_name");
        instance.setIdType(idType);
        int result=instance.getIdType();
        int expResult=0;
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of getName method, of class Type.
     */
    @Test
    public void testGetName() {
        System.out.println("getName");
        Type instance = new Type(3, "sample_type_name");
        String expResult = "sample_type_name";
        String result = instance.getName();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of setName method, of class Type.
     */
    @Test
    public void testSetName() {
        System.out.println("setName");
        String name = "new_type_name";
        Type instance = new Type(3, "sample_type_name");
        instance.setName(name);
        String expResult=name;
        String result=instance.getName();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
//        fail("The test case is a prototype.");
    }

}
