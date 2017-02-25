package mypack;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CartDAO {
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private ArrayList<Cart> carts=null;
	private Cart cart=null;
	private int result;

	public int getResult() {
		return result;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
		}
		
	public ArrayList<Cart> getCarts(String email) {
		return getAll(email);
	}
	public ArrayList<Cart> getAll(String email){
	   String sql="select * from cart where email=?";
	   pstmt=DB.getPstmt(sql);
	   try {
		   pstmt.setString(1,email);
		   rs=pstmt.executeQuery();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	   try {
			if(rs==null||!rs.next())
				return null;
			carts=new ArrayList<Cart>();
			do{
				cart=new Cart();
				cart.setEmail(rs.getString("email"));
				cart.setId(rs.getInt("id"));
				cart.setImage(rs.getString("image"));
				cart.setCakename(rs.getString("cakename"));
				cart.setPrice(rs.getInt("price"));
				carts.add(cart);
			}while(rs.next());
		} catch (Exception e) {
			e.printStackTrace();
		}
   	DB.close(rs, pstmt);
   	return carts;
   }
   

    public int del(int id){
    	String sql="delete from cart where id=?";
    	pstmt=DB.getPstmt(sql);
    	try{
    		pstmt.setInt(1,id);
    		result=pstmt.executeUpdate();
    		
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	DB.close(rs, pstmt);
    	return result;
    }

    public Cart getCart(){
    	String sql="select * from cart";
    	pstmt=DB.getPstmt(sql);
    	try{
    		rs=pstmt.executeQuery();
    		if(!rs.next())
    			return null;
    		cart=new Cart();
    		cart.setEmail(rs.getString("email"));
    		cart.setImage(rs.getString("image"));
    		cart.setCakename(rs.getString("cakename"));
    		cart.setPrice(rs.getInt("price"));
    		
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	return cart;
    }   	
 
}
