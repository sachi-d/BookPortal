package GUI.Cashier;

import java.util.regex.Pattern;
import java.util.concurrent.TimeUnit;
import org.junit.*;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;
import org.openqa.selenium.*;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.Select;

public class ViewComponents {
  private WebDriver driver;
  private String baseUrl;
  private boolean acceptNextAlert = true;
  private StringBuffer verificationErrors = new StringBuffer();

  @Before
  public void setUp() throws Exception {
    driver = new FirefoxDriver();
    baseUrl = "http://localhost:8080/";
    driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
  }

  @Test
  public void testViewComponents() throws Exception {
    driver.get(baseUrl + "/BookPortal/login.jsp");
    driver.findElement(By.name("uname")).clear();
    driver.findElement(By.name("uname")).sendKeys("ridmika");
    driver.findElement(By.name("pw")).clear();
    driver.findElement(By.name("pw")).sendKeys("ridmika123");
    driver.findElement(By.cssSelector("input[type=\"submit\"]")).click();
    assertEquals("Home", driver.getTitle());
    assertEquals("Home", driver.getTitle());
    driver.findElement(By.linkText("Inventory")).click();
    assertEquals("Inventory", driver.getTitle());
    assertEquals("Inventory", driver.findElement(By.cssSelector("h3")).getText());
    driver.findElement(By.xpath("//ul[@id='side-menu']/li[2]/a/span")).click();
    assertEquals("Purchases", driver.getTitle());
    assertEquals("Stock purchases", driver.findElement(By.cssSelector("h3")).getText());
    driver.findElement(By.linkText("Issue a bill")).click();
    assertEquals("Issue bill", driver.getTitle());
    assertEquals("Issue a bill", driver.findElement(By.cssSelector("h3.head-top")).getText());
    assertEquals("27, Happy Street,Colombo 3 \n 2 123 456\n www.thebookportal.lk", driver.findElement(By.cssSelector("h5")).getText());
    assertEquals("Invoice", driver.findElement(By.id("forms-example")).getText());
    driver.findElement(By.xpath("//ul[@id='side-menu']/li[4]/a/span")).click();
    driver.findElement(By.xpath("//ul[@id='side-menu']/li[5]/a/span")).click();
    driver.findElement(By.xpath("//ul[@id='side-menu']/li[6]/a/span")).click();
    driver.findElement(By.cssSelector("a.dropdown-toggle.dropdown-at > span")).click();
    driver.findElement(By.linkText("Logout")).click();
  }

  @After
  public void tearDown() throws Exception {
    driver.quit();
    String verificationErrorString = verificationErrors.toString();
    if (!"".equals(verificationErrorString)) {
      fail(verificationErrorString);
    }
  }

  private boolean isElementPresent(By by) {
    try {
      driver.findElement(by);
      return true;
    } catch (NoSuchElementException e) {
      return false;
    }
  }

  private boolean isAlertPresent() {
    try {
      driver.switchTo().alert();
      return true;
    } catch (NoAlertPresentException e) {
      return false;
    }
  }

  private String closeAlertAndGetItsText() {
    try {
      Alert alert = driver.switchTo().alert();
      String alertText = alert.getText();
      if (acceptNextAlert) {
        alert.accept();
      } else {
        alert.dismiss();
      }
      return alertText;
    } finally {
      acceptNextAlert = true;
    }
  }
}
