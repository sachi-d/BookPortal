/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;

/**
 *
 * @author Sachi
 */
@RunWith(Suite.class)
@Suite.SuiteClasses({Model.BillTest.class, Model.NotificationTest.class, Model.PublisherTest.class, Model.ReportTemplates.ReportTemplatesSuite.class, Model.PurchaserequestTest.class, Model.LogTest.class, Model.ReportTest.class, Model.BookTest.class, Model.StockTest.class, Model.BranchTest.class, Model.LanguageTest.class, Model.SubjectTest.class, Model.CartTest.class, Model.AuthorTest.class, Model.UserTest.class, Model.TypeTest.class})
public class ModelSuite {

    @BeforeClass
    public static void setUpClass() throws Exception {
    }

    @AfterClass
    public static void tearDownClass() throws Exception {
    }
    
}
