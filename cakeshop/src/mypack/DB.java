package mypack;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DB {
   private static final String username="root";
   private static final String password="123456";
   private static final String url=
		   "jdbc:mysql://localhost:3306/mydb";
   private static final String driver=
		   "com.mysql.jdbc.Driver";
   private static Connection conn=null;
   //"org.gjt.mm.mysql.Driver"
   
   private static  Connection getConn(){
	   try{
		   if(conn==null||conn.isClosed()){
			   Class.forName(driver);
			   conn=DriverManager.getConnection(
					   url,username,password);
		   }
			  
	   }catch(Exception e){
		   e.printStackTrace();
	   }
	   return conn;
   }
   public static PreparedStatement getPstmt(String sql){
	   PreparedStatement pstmt=null;
	   try{
		  getConn();
		 
		  pstmt=conn.prepareStatement(sql);
	   }catch(Exception e){
		   e.printStackTrace();
	   }
	   return pstmt;
   }
   public static void close(ResultSet rs,
		   PreparedStatement pstmt){
	   try{
		   if(rs!=null)
			   rs.close();
		   if(pstmt!=null)
			   pstmt.close();
		   if(conn!=null)
			   conn.close();
	   }catch(Exception e){
		   e.printStackTrace();
	   }finally{
		   rs=null;
		   pstmt=null;
		   conn=null;
	   }
   }
}
