/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.ReportTemplates;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;

/**
 *
 * @author Sachi
 */
@RunWith(Suite.class)
@Suite.SuiteClasses({Model.ReportTemplates.AnnualBranchItemTest.class, Model.ReportTemplates.MonthlyReportTest.class, Model.ReportTemplates.AnnualGeneralItemTest.class, Model.ReportTemplates.MonthlyGeneralItemTest.class, Model.ReportTemplates.AnnualBranchTest.class, Model.ReportTemplates.MonthlyBranchItemTest.class, Model.ReportTemplates.MonthlyBranchTest.class, Model.ReportTemplates.AnnualReportTest.class})
public class ReportTemplatesSuite {

    @BeforeClass
    public static void setUpClass() throws Exception {
    }

    @AfterClass
    public static void tearDownClass() throws Exception {
    }
    
}
