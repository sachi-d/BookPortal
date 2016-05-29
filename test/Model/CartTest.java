/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.LinkedHashMap;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Sachi
 */
public class CartTest {

    public CartTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    /**
     * Test of getBookinCart method, of class Cart.
     */
    @Test
    public void testGetBookinCart() {
        System.out.println("getBookinCart");
        Cart instance = new Cart();

        Book b1 = new Book();
        b1.setTitle("b1");
        b1.setIdbook(1);
        b1.setPrice(230.00);
        Book b2 = new Book();
        b2.setTitle("b2");
        b2.setIdbook(2);
        b2.setPrice(230.00);
        Book b3 = new Book();
        b3.setTitle("b3");
        b3.setIdbook(3);
        b3.setPrice(230.00);
        instance.addToCart(b1, 1);
        instance.addToCart(b2, 2);
        instance.addToCart(b3, 3);

        Book expResult = b1;
        Book result = instance.getBookinCart(b1);
        assertEquals(expResult, result);

        expResult = null;
        result = instance.getBookinCart(new Book());
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of incrementQuantity method, of class Cart.
     */
    @Test
    public void testIncrementQuantity() {
        System.out.println("incrementQuantity");
        Cart instance = new Cart();

        Book b1 = new Book();
        b1.setTitle("b1");
        b1.setIdbook(1);
        b1.setPrice(230.00);
        Book b2 = new Book();
        b2.setTitle("b2");
        b2.setIdbook(2);
        b2.setPrice(230.00);
        Book b3 = new Book();
        b3.setTitle("b3");
        b3.setIdbook(3);
        b3.setPrice(230.00);
        instance.getItems().put(b1, 1);
        instance.getItems().put(b2, 2);
        instance.getItems().put(b3, 3);

        instance.incrementQuantity(b1);
        int expResult = 2;
        int result = instance.getItems().get(b1);

        assertEquals(expResult, result);

        instance.incrementQuantity(b2);
        expResult = 3;
        result = instance.getItems().get(b2);
        assertEquals(expResult, result);

        instance.incrementQuantity(b2);
        expResult = 4;
        result = instance.getItems().get(b2);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of decrementQuantity method, of class Cart.
     */
    @Test
    public void testDecrementQuantity() {
        System.out.println("decrementQuantity");
        Cart instance = new Cart();

        Book b1 = new Book();
        b1.setTitle("b1");
        b1.setIdbook(1);
        b1.setPrice(230.00);
        Book b2 = new Book();
        b2.setTitle("b2");
        b2.setIdbook(2);
        b2.setPrice(230.00);
        Book b3 = new Book();
        b3.setTitle("b3");
        b3.setIdbook(3);
        b3.setPrice(230.00);
        instance.addToCart(b1, 1);
        instance.addToCart(b2, 2);
        instance.addToCart(b3, 3);

        instance.decrementQuantity(b1);
        int expResult = 0;
        int result = instance.getItems().get(b1);
        assertEquals(expResult, result);

        instance.decrementQuantity(b1);
        expResult = 0;
        result = instance.getItems().get(b1);
        assertEquals(expResult, result);

        instance.decrementQuantity(b2);
        expResult = 1;
        result = instance.getItems().get(b2);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of isIn method, of class Cart.
     */
    @Test
    public void testIsIn() {
        System.out.println("isIn");
        Cart instance = new Cart();

        Book b1 = new Book();
        b1.setTitle("b1");
        b1.setIdbook(1);
        b1.setPrice(230.00);
        Book b2 = new Book();
        b2.setTitle("b2");
        b2.setIdbook(2);
        b2.setPrice(230.00);
        Book b3 = new Book();
        b3.setTitle("b3");
        b3.setIdbook(3);
        b3.setPrice(230.00);
        instance.addToCart(b1, 1);
        instance.addToCart(b2, 2);
        instance.addToCart(b3, 3);

        boolean expResult = true;
        boolean result = instance.isIn(b1);
        assertEquals(expResult, result);
        assertFalse(instance.isIn(new Book()));
        assertFalse(instance.isIn(null));
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of getTotalperBook method, of class Cart.
     */
    @Test
    public void testGetTotalperBook() {
        System.out.println("getTotalperBook");
        Cart instance = new Cart();
        
        Book b1 = new Book();
        b1.setTitle("b1");
        b1.setIdbook(1);
        b1.setPrice(230.00);
        Book b2 = new Book();
        b2.setTitle("b2");
        b2.setIdbook(2);
        b2.setPrice(230.00);
        Book b3 = new Book();
        b3.setTitle("b3");
        b3.setIdbook(3);
        b3.setPrice(230.00);
        instance.addToCart(b1, 1);
        instance.addToCart(b2, 2);
        instance.addToCart(b3, 3);
        
        double expResult = 230;
        double result = instance.getTotalperBook(b1);
        assertEquals(expResult, result, 0.0);
        
        expResult=460;
        result=instance.getTotalperBook(b2);
        assertEquals(expResult, result,0.0);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of updateTotal method, of class Cart.
     */
    @Test
    public void testUpdateTotal() {
        System.out.println("updateTotal");
        Cart instance = new Cart();
        
        Book b1 = new Book();
        b1.setTitle("b1");
        b1.setIdbook(1);
        b1.setPrice(230.00);
        Book b2 = new Book();
        b2.setTitle("b2");
        b2.setIdbook(2);
        b2.setPrice(230.00);
        Book b3 = new Book();
        b3.setTitle("b3");
        b3.setIdbook(3);
        b3.setPrice(230.00);
        instance.addToCart(b1, 1);
        instance.addToCart(b2, 2);
        instance.addToCart(b3, 3);
        
        instance.updateTotal();
        double expResult=230*(1+2+3);
        double result=instance.getTotal();
        assertEquals(expResult, result,0.0);
        // TODO review the generated test code and remove the default call to fail.
    }

}
