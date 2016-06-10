package GUI.Admin;

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
    driver.findElement(By.name("uname")).sendKeys("admin");
    driver.findElement(By.name("pw")).clear();
    driver.findElement(By.name("pw")).sendKeys("admin123");
    driver.findElement(By.cssSelector("input[type=\"submit\"]")).click();
    driver.findElement(By.cssSelector("span.nav-label")).click();
    assertEquals("Inventory", driver.getTitle());
    assertEquals("Inventory", driver.findElement(By.cssSelector("h3")).getText());
    driver.findElement(By.xpath("//ul[@id='side-menu']/li[2]/a/span")).click();
    assertEquals("Purchases", driver.getTitle());
    assertEquals("Stock purchases", driver.findElement(By.cssSelector("h3")).getText());
    driver.findElement(By.linkText("Branches")).click();
    assertEquals("Branches", driver.getTitle());
    assertEquals("Branches", driver.getTitle());
    assertTrue(isElementPresent(By.xpath("//div[@id='page-wrapper']/div/div/div/div/div[2]/div[3]/button")));
    driver.findElement(By.xpath("//ul[@id='side-menu']/li[4]/a/span")).click();
    assertEquals("Featured books", driver.getTitle());
    assertEquals("Featured books", driver.findElement(By.cssSelector("h3.head-top")).getText());
    driver.findElement(By.xpath("//ul[@id='side-menu']/li[5]/a/span")).click();
    assertEquals("User logs", driver.getTitle());
    assertEquals("User logs", driver.findElement(By.cssSelector("h3.head-top")).getText());
    driver.findElement(By.xpath("//ul[@id='side-menu']/li[6]/a/span")).click();
    assertEquals("Recent arrivals", driver.getTitle());
    assertEquals("Recent arrivals", driver.findElement(By.cssSelector("h3.head-top")).getText());
    driver.findElement(By.linkText("General reports")).click();
    assertEquals("General reports", driver.getTitle());
    assertEquals("General reports", driver.findElement(By.cssSelector("h3.head-top")).getText());
    assertTrue(isElementPresent(By.id("home-tab")));
    driver.findElement(By.id("profile-tab")).click();
    assertTrue(isElementPresent(By.id("profile-tab")));
    driver.findElement(By.xpath("//ul[@id='side-menu']/li[8]/a/span")).click();
    assertEquals("Branch reports", driver.getTitle());
    assertTrue(isElementPresent(By.id("home-tab")));
    driver.findElement(By.id("profile-tab")).click();
    assertTrue(isElementPresent(By.id("profile-tab")));
    driver.findElement(By.xpath("//ul[@id='side-menu']/li[9]/a/span")).click();
    assertEquals("Issued bills", driver.getTitle());
    assertEquals("Issued bills", driver.findElement(By.cssSelector("h3.head-top")).getText());
    driver.findElement(By.linkText("Current stock")).click();
    assertEquals("Branch Stock", driver.getTitle());
    assertEquals("Branch stock", driver.findElement(By.cssSelector("h3")).getText());
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
