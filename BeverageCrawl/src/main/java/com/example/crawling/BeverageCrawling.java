package com.example.crawling;




import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

public class BeverageCrawling {

      
      
      public static void main(String[] args) {
         
         String WEB_DRIVER_ID = "webdriver.chrome.driver"; //드라이버 ID
         String WEB_DRIVER_PATH = "C:\\WebDriver\\bin\\chromedriver.exe"; //드라이버 경로
         
         List<WebElement> menu_list = new ArrayList<WebElement>();
         ArrayList<String> Menu_name = new ArrayList<>();
         
         List<WebElement> menu_class_list = new ArrayList<WebElement>();         
         ArrayList<String> Menu_class_name = new ArrayList<>();
         
         List<WebElement> drink_list = new ArrayList<WebElement>();         
         ArrayList<String> drink_name = new ArrayList<>();
         
         List<WebElement> drink_loca_list = new ArrayList<WebElement>();         
         ArrayList<String> drink_loca = new ArrayList<>();
         
         List<WebElement> img_list = new ArrayList<>();
         ArrayList<String> img = new ArrayList<>();
         ArrayList<String> menuName = new ArrayList<>(); 
         ArrayList<String> drink_EngName = new ArrayList<>();
         ArrayList<String> kcal = new ArrayList<>();
         ArrayList<String> sat_FAT = new ArrayList<>();
         ArrayList<String> protein = new ArrayList<>();
         ArrayList<String> sodium = new ArrayList<>();
         ArrayList<String> sugars = new ArrayList<>();
         ArrayList<String> caffeine_last = new ArrayList<>();   
         ArrayList<String> drinkInfo = new ArrayList<>();
         
         
         System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);
         
           ChromeOptions options = new ChromeOptions();
           options.addArguments("--start-maximized");          // 최대크기로
           options.addArguments("--headless");                 // Browser를 띄우지 않음
           options.addArguments("--disable-gpu");              // GPU를 사용하지 않음, Linux에서 headless를 사용하는 경우 필요함.
           options.addArguments("--no-sandbox");               // Sandbox 프로세스를 사용하지 않음, Linux에서 headless를 사용하는 경우 필요함.
           options.addArguments("--disable-popup-blocking");    // 팝업 무시
           options.addArguments("--disable-default-apps");     // 기본앱 사용안함
         WebDriver driver = new ChromeDriver();
         String url = "https://www.starbucks.co.kr/menu/drink_list.do";  // 크롤링할 사이트
         
         try {
            driver.get(url);
            //try {Thread.sleep(1000);} catch (InterruptedException e) {}
            menu_list = driver.findElements(By.cssSelector("div.product_list > dl > dt"));
            for(WebElement temp : menu_list) {
               Menu_name.add(temp.findElement(By.cssSelector("a")).getText());
               
            }
            
            menu_class_list = driver.findElements(By.cssSelector("div.product_list > dl > dd"));
            for(WebElement temp : menu_class_list) {
               Menu_class_name.add(temp.findElement(By.cssSelector("ul")).getAttribute("class"));
               
            }
            
            for(int i = 0; i <Menu_name.size();i++) {
               drink_list = driver.findElements(By.cssSelector("ul."+ Menu_class_name.get(i) + " > li"));
               for(WebElement temp : drink_list) {
                  drink_name.add(temp.findElement(By.cssSelector("dl > dd")).getText());
                  
               }
               
               drink_loca_list = driver.findElements(By.cssSelector("ul."+ Menu_class_name.get(i) + " > li"));
               for(WebElement temp : drink_loca_list) {
                  drink_loca.add(temp.findElement(By.cssSelector("dl > dt > a")).getAttribute("prod"));            
                  
               }   
               img_list = driver.findElements(By.cssSelector("ul."+ Menu_class_name.get(i) + " > li"));
               for(WebElement temp : img_list) {
                  img.add(temp.findElement(By.cssSelector("dl > dt > a > img")).getAttribute("src"));
            }
            }
            
            
            
            
            for(int i = 0; i <drink_loca.size();i++) {
               String temp = "https://www.starbucks.co.kr/menu/drink_view.do?product_cd="+drink_loca.get(i);
               driver.get(temp);
               //try {Thread.sleep(1000);} catch (InterruptedException e) {}
               
               
               WebElement temp2 = driver.findElement(By.cssSelector("li.kcal > dl > dd"));
               kcal.add(temp2.getText());
               
               temp2 = driver.findElement(By.cssSelector("#container > div.sub_tit_wrap"));
               menuName.add(temp2.findElement(By.cssSelector("a.cate")).getText() );
               
               temp2 = driver.findElement(By.cssSelector("#container > div.content02 > div.product_view_wrap1 > div.product_view_detail > div.myAssignZone > h4 > span"));
               drink_EngName.add(temp2.getText() );
               
               temp2 = driver.findElement(By.cssSelector("li.sat_FAT > dl > dd"));
               sat_FAT.add(temp2.getText());
               
               temp2 = driver.findElement(By.cssSelector("li.protein > dl > dd"));
               protein.add(temp2.getText());
                              
               temp2 = driver.findElement(By.cssSelector("li.sodium > dl > dd"));
               sodium.add(temp2.getText());
               
               temp2 = driver.findElement(By.cssSelector("li.sugars > dl > dd"));
               sugars.add(temp2.getText());
               
               temp2 = driver.findElement(By.cssSelector("li.caffeine.last > dl > dd"));
               caffeine_last.add(temp2.getText());             
               
               temp2 = driver.findElement(By.cssSelector("#container > div.content02 > div.product_view_wrap1 > div.product_view_detail > div.myAssignZone > p"));
               drinkInfo.add(temp2.getText().replace("\n", "") );
               }   
               
         //JSON 형식으로 데이터 출력
            JSONObject obj = new JSONObject();
            try {
            	JSONArray jArray = new JSONArray();
            	for( int i = 0; i< menuName.size(); i++ ) {
            		JSONObject sObj = new JSONObject();
            		sObj.put("category", menuName.get(i) );
            		sObj.put("name", drink_name.get(i) );
            		sObj.put("engName", drink_EngName.get(i) );
            		sObj.put("image", img.get(i) );
            		sObj.put( "kcal", kcal.get(i) );
            		sObj.put("sat_fat", sat_FAT.get(i) );
            		sObj.put("protein", protein.get(i) );
            		sObj.put("sodium", sodium.get(i) );
            		sObj.put("sugars", sugars.get(i) );
            		sObj.put("caffeine", caffeine_last.get(i) );
            		sObj.put("drinkInfo", drinkInfo.get(i) );
            		jArray.put( sObj );
            		
            	}
            	System.out.println(jArray.toString());
            	            	
            }catch (JSONException e) {
                System.out.println( e.getMessage() );
            }
            
	//크롤링한 데이터 나열
            
           /*
            //System.out.println("커피 종류 : " + Menu_name);
            System.out.println("커피 종류 : " + menuName);
            System.out.println( menuName.size() );
            
            //System.out.println(Menu_class_name);
            System.out.println("음료 이름 : " + drink_name);
            System.out.println( drink_name.size() );
            //System.out.println(drink_loca);
            System.out.println("이미지 : " + img);
            System.out.println( img.size() );
            System.out.println("칼로리 : " + kcal);
            System.out.println( kcal.size() );
            System.out.println("지방 : " + sat_FAT);
            System.out.println( sat_FAT.size() );
            System.out.println("단백질 : " + protein);
            System.out.println( protein.size() );
            System.out.println("나트륨 : " + sodium);
            System.out.println( sodium.size() );
            System.out.println("당류 : " + sugars);
            System.out.println( sugars.size() );
            System.out.println("카페인 : " + caffeine_last);
            System.out.println( caffeine_last.size() );
            
            */             


            
         } catch (Exception e) {
            e.addSuppressed(e);
         }
         
      }
}