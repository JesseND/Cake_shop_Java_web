package mypack;

import java.sql.*;

public class ConnectionManager {

	static Connection con;
	static String url;
	
	public static Connection getConnection(){
		
		try{
			String url = "jdbc:mysql://localhost:3306/mydb";
			Class.forName("com.mysql.jdbc.Driver");
		
			try{
				con = DriverManager.getConnection(url,"root", "123456");
				
			}catch(SQLException e){
				e.printStackTrace();
			}
		}catch(ClassNotFoundException e){
			System.out.println(e);
		}
		
		return con;
	}
	
public static PreparedStatement getPstmt(String sql){
	    	
	    	PreparedStatement pstmt = null;
	    	try{
	    		getConnection(); 
	    		
	    		pstmt = con.prepareStatement(sql);
	    	}catch(Exception e){
	    		e.printStackTrace();
	    	}
			return pstmt;
	    }

public static void close(ResultSet rs, PreparedStatement stmt){
  	
	try{
		
		if(rs!=null)
			rs.close();
		if(stmt != null)
			stmt.close();
		if(con!=null)
			con.close();
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		rs = null; 
		stmt = null;
		con = null;
	}
}
}
