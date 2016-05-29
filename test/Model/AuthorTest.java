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
public class AuthorTest {
    
    public AuthorTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }

    /**
     * Test of getIdauthor method, of class Author.
     */
    @Test
    public void testGetIdauthor() {
        System.out.println("getIdauthor");
        Author instance = new Author(7, "author_name");
        int expResult = 7;
        int result = instance.getIdauthor();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of setIdauthor method, of class Author.
     */
    @Test
    public void testSetIdauthor() {
        System.out.println("setIdauthor");
        int idauthor = 0;
        Author instance = new Author(7, "author_name");
        instance.setIdauthor(idauthor);
        int expResult=idauthor;
        int result=instance.getIdauthor();
        assertEquals(expResult, result);
    }

    /**
     * Test of getName method, of class Author.
     */
    @Test
    public void testGetName() {
        System.out.println("getName");
        Author instance = new Author(7, "author_name");
        String expResult = "author_name";
        String result = instance.getName();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of setName method, of class Author.
     */
    @Test
    public void testSetName() {
        System.out.println("setName");
        String name = "new_name";
        Author instance = new Author(7, "author_name");
        instance.setName(name);
        String expResult=name;
        String result=instance.getName();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }
    
}
