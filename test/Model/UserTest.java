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
public class UserTest {

    public UserTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    /**
     * Test of getIduser method, of class User.
     */
    @Test
    public void testGetIduser() {
        System.out.println("getIduser");
        User instance = new User(7, "uname", "pw", "ulevel", "fname", "lname", "nic", new Branch(0, "branch_name", "branch_address", "branch_telno"));
        int expResult = 7;
        int result = instance.getIduser();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of setIduser method, of class User.
     */
    @Test
    public void testSetIduser() {
        System.out.println("setIduser");
        int iduser = 0;
        User instance = new User(7, "uname", "pw", "ulevel", "fname", "lname", "nic", new Branch(0, "branch_name", "branch_address", "branch_telno"));
        instance.setIduser(iduser);
        int expResult=iduser;
        int result=instance.getIduser();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of getUsername method, of class User.
     */
    @Test
    public void testGetUsername() {
        System.out.println("getUsername");
        User instance = new User(7, "uname", "pw", "ulevel", "fname", "lname", "nic", new Branch(0, "branch_name", "branch_address", "branch_telno"));
        String expResult = "uname";
        String result = instance.getUsername();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of setUsername method, of class User.
     */
    @Test
    public void testSetUsername() {
        System.out.println("setUsername");
        String username = "new_uname";
        User instance = new User(7, "uname", "pw", "ulevel", "fname", "lname", "nic", new Branch(0, "branch_name", "branch_address", "branch_telno"));
        instance.setUsername(username);
        String expResult=username;
        String result=instance.getUsername();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }



}
