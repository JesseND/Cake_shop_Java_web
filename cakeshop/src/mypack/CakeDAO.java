package mypack;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



public class CakeDAO {
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private ArrayList<Cake> cakes=null;
	private Cake cake=null;
	private int result;
	private int id=0;

	public void setId(int id) {
		this.id = id;
	}
	public int getResult() {
		return result;
	}
	public void setCake(Cake cake) {
		this.cake = cake;
		}
		
	public ArrayList<Cake> getCakes() {
		return getAll();
	}
	public ArrayList<Cake> getAll(){
	   String sql="select * from cake";
	   pstmt=DB.getPstmt(sql);
	   try {
		rs=pstmt.executeQuery();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	   return rsToList(rs);
   }
    private ArrayList<Cake> rsToList(ResultSet rs){
    	try {
			if(rs==null||!rs.next())
				return null;
			cakes=new ArrayList<Cake>();
			do{
				cake=new Cake();
				cake.setId(rs.getInt("id"));
				cake.setImage(rs.getString("image"));
				cake.setCakename(rs.getString("cakename"));
				cake.setPrice(rs.getInt("price"));
				cakes.add(cake);
			}while(rs.next());
		} catch (Exception e) {
			e.printStackTrace();
		}
    	DB.close(rs, pstmt);
    	return cakes;
    }

    public int buy(String email,String image,String cakename,int price){
    	int result=0;
    	String sql="insert into cart(email,image,cakename,price) values(?,?,?,?)";
    	pstmt=DB.getPstmt(sql);
    	try{
    		pstmt.setString(1,email);
    		pstmt.setString(2,image);
    		pstmt.setString(3,cakename);
    		pstmt.setInt(4,price);
    		result=pstmt.executeUpdate();
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	DB.close(rs, pstmt);
    	return result;
    }
    public Cake getCake(){
    	String sql="select * from cake where id=?";
    	pstmt=DB.getPstmt(sql);
    	try{
    		pstmt.setInt(1,id);
    		rs=pstmt.executeQuery();
    		if(!rs.next())
    			return null;
    		cake=new Cake();
    		cake.setId(id);
    		cake.setImage(rs.getString("image"));
    		cake.setCakename(rs.getString("cakename"));
    		cake.setPrice(rs.getInt("price"));
    		
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	return cake;
    }   	
 
}
