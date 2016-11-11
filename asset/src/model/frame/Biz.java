package model.frame;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

public abstract class Biz {
	
	public Biz(){
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConnection(){
		Connection con = null;
		
		String user="DLWJDWO33";//DATA1
		String passward = "sys";//51³»²¨
		String url = "jdbc:oracle:thin:@172.30.1.13:1521:XE";
		
		try {
			con = DriverManager.getConnection(url, user, passward);
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		return con;
	}
	
	public void close(Connection con){
		if(con != null){
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public abstract void register(Object obj) throws Exception;	
	public abstract void modify(Object obj) throws Exception;	
	public abstract void remove(Object obj) throws Exception;	
	public abstract Object get(Object obj) throws Exception;	
	public abstract ArrayList<Object> get() throws Exception;
}
