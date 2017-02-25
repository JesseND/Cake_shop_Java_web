package mypack;
import java.sql.*;


public class UserDAO {
	static java.sql.Connection currentCon = null;
	static ResultSet rs = null;
	
	
	public static int register(UserBean bean){
		
		
		//preparing some objects for connection
//		Statement stmt = null;
		int result =0;		
		PreparedStatement pt = null;
		
		String insertQuery = "insert into customers (username, email, telephone, password)"
				+ "values(?,?,?,?)";
		
		currentCon = ConnectionManager.getConnection();
//		stmt = currentCon.createStatement();
		
		
		
		try{
			
			pt = currentCon.prepareStatement(insertQuery);
			pt.setString(1, bean.getUsername());
			pt.setString(2,  bean.getEmail());
			pt.setString(3, bean.getTelephone());
			pt.setString(4,  bean.getPassword());
			
			result = pt.executeUpdate();
			 pt.clearParameters();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		 try {
			currentCon.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	  }
	
	
	public static UserBean login(UserBean bean){
		
		//preparing some objects for connection
		Statement stmt = null;
		
		String email = bean.getEmail();
		String password = bean.getPassword();
		
	String	searchQuery =  "select * from customers where email='"
            + email
            + "' AND password='"
            + password
            + "'";
	
	//System.out.print prints in the console; Normally used to trace the process
	System.out.println("Your email is : " + email);
	System.out.println("Your password is "+ password);
	System.out.println("Query: "+searchQuery);
	
	
	try{
		
		//connect to DB
		currentCon = ConnectionManager.getConnection();
		stmt = currentCon.createStatement();
		rs = stmt.executeQuery(searchQuery);
		boolean more = rs.next();
		
		//if user does not exit set the isValid variable to false 
		if(!more){
			System.out.println("Sorry, you are not a registered user! Please sign up first");
		     bean.setValid(false);
		}
		
		//if user exists set the isValid variable to true
		else if(more){
			String username = rs.getString("username");
			String telephone = rs.getString("telephone");
			System.out.println("Welcome "+ username+ " here is your phone number: "+ telephone);
			bean.setUsername(username);
			bean.setTelephone(telephone);
			bean.setValid(true);
		}
		
	}
	catch(Exception e)
	{
		System.out.println("Log in Failed: An exception has occurred!"+e);
	}
	finally {
		if(rs!=null)
		{
			try
			{
			rs.close();
			}
			catch(Exception e)
			{
				rs = null;
			}
			if(currentCon!=null)
			{
			   try
			   {
				currentCon.close();
			   }
			   catch(Exception e)
			   {
				 e.printStackTrace();
				}
				currentCon = null;
			}
		}
	}
		
		return bean;
 }
}
	
	

