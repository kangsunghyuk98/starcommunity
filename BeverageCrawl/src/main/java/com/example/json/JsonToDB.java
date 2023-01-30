package com.example.json;

import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;

import java.sql.*;


import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.*;

public class JsonToDB {

	public static void main(String[] args) {
		java.sql.Statement stmt = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String filePath = "C:\\BeverageJson\\beverage.json";

		String name="";
		String engName="";
		String category = "";
		String image = "";
		String kcal = "";
		String sat_fat = "";
		String protein = "";
		String sodium = "";
		String sugars = "";
		String caffeine = "";
		String drinkInfo = "";
		
		try{
			String driverClassName = "org.mariadb.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/project";
			String user = "project";
			String password = "1234";
			
			//JDBC Driver Loading
			Class.forName(driverClassName);
			
			//JDBC Connection getting
			conn = DriverManager.getConnection(url, user, password);
			
			System.out.println("DB 연결 성공");
			System.out.println("** Driver:" + driverClassName + ", Connection:" + conn);
		
			
			//테이블  테이블 생성
			
			
			String query = "CREATE TABLE TEST(";
					query += "category varchar(250) not null,";
					query += "name varchar(250) primary key not null,";
					query += "engName varchar(250) not null,";
					query += "image varchar(255) not null,";
					query += "kcal varchar(50) not null,";
					query += "sat_fat varchar(50) not null,";
					query += "protein varchar(50) not null,";
					query += "sodium varchar(50) not null,";
					query += "sugars varchar(50) not null,";
					query += "caffeine varchar(50) not null,";
					query += "drinkInfo varchar(250) not null)";
			
			stmt = conn.createStatement();
			
			boolean b = stmt.execute(query);
			
			System.out.println("b : " + b);
	
		}catch(ClassNotFoundException ex){
			System.out.println("드라이버 로딩 실패");
			ex.printStackTrace();
		} catch (SQLException e) {
			System.out.println("sql오류 :이미 생성");
			//.printStackTrace();
		}
		
		//table create JDBC 로직 종료
		
		//insert into JDBC 로직
			
		try {
			String driverClassName = "org.mariadb.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/project";
			String user = "project";
			String password = "1234";
			
			//JDBC Driver Loading
			Class.forName(driverClassName);
			
			//JDBC Connection getting
			conn = DriverManager.getConnection(url, user, password);
			
			System.out.println("DB 연결 성공");
			System.out.println("** Driver:" + driverClassName + ", Connection:" + conn);
			
			//JSON 읽어와서 쿼리에 담기위한 사전작업
			Reader reader = new FileReader(filePath);
		    
		    JSONParser parser = new JSONParser();
		    
		    Object obj = parser.parse(reader);
		    JSONArray jsonArr = (JSONArray) obj;
		    
			//SQL문 작성
			String SQL = "insert into test( category, name, engName, image, kcal, sat_fat, protein, sodium, sugars, caffeine, drinkInfo ) values(?,?,?,?,?,?,?,?,?,?,?)";
			
			//PreParedStatement 객체 생성, 객체 생성시 SQL 문장 저장
			pstmt = conn.prepareStatement(SQL);
			
			//psmt.set<데이터타입><? 순서, 값)
			//다건 JSON객체 (JSONArray)
			if(jsonArr.size()>0) {
				for(int i=0; i<jsonArr.size(); i++) {
					JSONObject jsonObj = (JSONObject)jsonArr.get(i);
					System.out.println((String)jsonObj.get("category"));
					System.out.println((String)jsonObj.get("name"));
					System.out.println((String)jsonObj.get("engName"));					
					System.out.println((String)jsonObj.get("image"));
					System.out.println((String)jsonObj.get("kcal"));
					System.out.println((String)jsonObj.get("sat_fat"));
					System.out.println((String)jsonObj.get("protein"));
					System.out.println((String)jsonObj.get("sodium"));
					System.out.println((String)jsonObj.get("sugars"));
					System.out.println((String)jsonObj.get("caffeine"));					
					System.out.println((String)jsonObj.get("drinkInfo"));	
					
					category=(String)jsonObj.get("category");
					name=(String)jsonObj.get("name");
					engName=(String)jsonObj.get("engName");					
					image=(String)jsonObj.get("image");
					kcal=(String)jsonObj.get("kcal");
					sat_fat=(String)jsonObj.get("sat_fat");
					protein=(String)jsonObj.get("protein");
					sodium=(String)jsonObj.get("sodium");
					sugars=(String)jsonObj.get("sugars");
					caffeine=(String)jsonObj.get("caffeine");			
					drinkInfo=(String)jsonObj.get("drinkInfo");	
					
					pstmt.setString(1, category);
					pstmt.setString(2, name);
					pstmt.setString(3, engName);					
					pstmt.setString(4, image);
					pstmt.setString(5, kcal);
					pstmt.setString(6, sat_fat);
					pstmt.setString(7, protein);
					pstmt.setString(8, sodium);
					pstmt.setString(9, sugars);
					pstmt.setString(10, caffeine);
					pstmt.setString(11, drinkInfo);
					
					int r = pstmt.executeUpdate();
					
					System.out.println("SQL 실행:"+r+"개 의 row삽입");
				}
			}

			//SQL문 작성
			String SQL2 = "insert into test( category, name, engName, image, kcal, sat_fat, protein, sodium, sugars, caffeine, drinkInfo ) values(?,?,?,?,?,?,?,?,?,?,?)";
			
			//PreParedStatement 객체 생성, 객체 생성시 SQL 문장 저장
			pstmt = conn.prepareStatement(SQL2);
			
			
		}catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}