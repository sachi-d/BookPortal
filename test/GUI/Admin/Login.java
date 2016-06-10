package GUI.Admin;

import java.util.regex.Pattern;
import java.util.concurrent.TimeUnit;
import org.junit.*;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;
import org.openqa.selenium.*;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.Select;

public class Login {
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
  public void testLogin() throws Exception {
    driver.get(baseUrl + "/BookPortal/login.jsp");
    assertEquals("Login", driver.getTitle());
    assertEquals("Login", driver.findElement(By.cssSelector("h2")).getText());
    assertTrue(isElementPresent(By.cssSelector("input[type=\"submit\"]")));
    assertTrue(isElementPresent(By.linkText("Signup")));
    driver.findElement(By.name("uname")).clear();
    driver.findElement(By.name("uname")).sendKeys("admin");
    driver.findElement(By.name("pw")).clear();
    driver.findElement(By.name("pw")).sendKeys("admin123");
    driver.findElement(By.cssSelector("input[type=\"submit\"]")).click();
    assertTrue(isElementPresent(By.linkText("Inventory")));
    assertTrue(isElementPresent(By.linkText("Stock purchases")));
    assertTrue(isElementPresent(By.xpath("//ul[@id='side-menu']/li[3]/a/span")));
    assertTrue(isElementPresent(By.xpath("//ul[@id='side-menu']/li[4]/a/span")));
    assertTrue(isElementPresent(By.xpath("//ul[@id='side-menu']/li[5]/a/span")));
    assertTrue(isElementPresent(By.xpath("//ul[@id='side-menu']/li[6]/a/span")));
    assertTrue(isElementPresent(By.xpath("//ul[@id='side-menu']/li[7]/a/span")));
    assertTrue(isElementPresent(By.xpath("//ul[@id='side-menu']/li[8]/a/span")));
    assertTrue(isElementPresent(By.xpath("//ul[@id='side-menu']/li[9]/a/span")));
    assertTrue(isElementPresent(By.xpath("//ul[@id='side-menu']/li[10]/a/span")));
    assertTrue(isElementPresent(By.cssSelector("i.fa.fa-shopping-cart")));
    assertTrue(isElementPresent(By.cssSelector("i.fa.fa-globe")));
    assertTrue(isElementPresent(By.xpath("//li[3]/a/span")));
    driver.findElement(By.xpath("//li[3]/a/span")).click();
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
