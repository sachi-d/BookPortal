/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.ArrayList;
import java.util.Date;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Sachi
 */
public class BookTest {

    public BookTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Test
    public void testGetShortDescription() {
        System.out.println("getShortDescription");
        Book instance = new Book();
        instance.setDescription("0123456789");
        String expResult = "0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123...";
        String result = instance.getShortDescription();
        assertEquals(expResult, result);

        instance.setDescription("0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789");
        result = instance.getShortDescription();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
    }

    /**
     * Test of bookListtoJSArray method, of class Book.
     */
    @Test
    public void testBookListtoJSArray() {
        System.out.println("bookListtoJSArray");
        String expResult = "[{label:\"Accidental entrepreneur\",value:\"29\",desc:\"3500.0\",},{label:\"Amazinger face\",value:\"30\",desc:\"1250.0\",},{label:\"Bandara maru un\",value:\"1\",desc:\"230.0\",},{label:\"Best ever cooking\",value:\"31\",desc:\"875.0\",},{label:\"Big brother boris\",value:\"7\",desc:\"850.0\",},{label:\"Bowls\",value:\"48\",desc:\"1200.0\",},{label:\"Brooklynn\",value:\"11\",desc:\"1250.0\",},{label:\"Brotherband\",value:\"38\",desc:\"1350.0\",},{label:\"Business for dummies\",value:\"33\",desc:\"3400.0\",},{label:\"Clinical medicine\",value:\"5\",desc:\"1800.0\",},{label:\"Cometh the hour\",value:\"6\",desc:\"1200.0\",},{label:\"Crazy weirdo\",value:\"3\",desc:\"400.0\",},{label:\"Drills and skills - Australian football\",value:\"51\",desc:\"1200.0\",},{label:\"Ekas gahaniya\",value:\"37\",desc:\"750.0\",},{label:\"Empire of storms\",value:\"27\",desc:\"1500.0\",},{label:\"Epidemiology\",value:\"17\",desc:\"3200.0\",},{label:\"Fresh Cut Flowers\",value:\"39\",desc:\"890.0\",},{label:\"Harry Potter\",value:\"4\",desc:\"700.0\",},{label:\"Inner game of tennis\",value:\"49\",desc:\"1200.0\",},{label:\"James Brown\",value:\"40\",desc:\"1250.0\",},{label:\"Lady midnight\",value:\"10\",desc:\"1350.0\",},{label:\"Last anniversary\",value:\"41\",desc:\"900.0\",},{label:\"Life as we know it\",value:\"42\",desc:\"1300.0\",},{label:\"Maestra\",value:\"9\",desc:\"1500.0\",},{label:\"Manikkawatha\",value:\"15\",desc:\"1340.0\",},{label:\"Me before you\",value:\"8\",desc:\"1300.0\",},{label:\"Michael Jordan - The life\",value:\"50\",desc:\"890.0\",},{label:\"One pot favorites\",value:\"2\",desc:\"500.0\",},{label:\"Pompomania\",value:\"32\",desc:\"1000.0\",},{label:\"Red riding hood\",value:\"43\",desc:\"450.0\",},{label:\"Separation\",value:\"18\",desc:\"1230.0\",},{label:\"Sleep revolution\",value:\"44\",desc:\"1700.0\",},{label:\"Talking tommy\",value:\"25\",desc:\"1250.0\",},{label:\"The amazing mrs Livesy\",value:\"28\",desc:\"2500.0\",},{label:\"The road ruin\",value:\"13\",desc:\"1890.0\",},{label:\"Three wishes\",value:\"45\",desc:\"900.0\",},{label:\"Thuru samuda\",value:\"12\",desc:\"340.0\",},{label:\"Tree house fun\",value:\"46\",desc:\"500.0\",},{label:\"Truly madly\",value:\"47\",desc:\"1450.0\",},{label:\"Wala bamma\",value:\"16\",desc:\"1250.0\",},{label:\"Where's Wally\",value:\"34\",desc:\"450.0\",},{label:\"Yes No\",value:\"26\",desc:\"1234.0\",},{label:\"You are enough\",value:\"35\",desc:\"1200.0\",},{label:\"Zootopia\",value:\"36\",desc:\"350.0\",}]";
        String result = Book.bookListtoJSArray();
        assertEquals(expResult, result);

        // TODO review the generated test code and remove the default call to fail.
    }

}
