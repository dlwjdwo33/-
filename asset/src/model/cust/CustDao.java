package model.cust;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.frame.Dao;
import model.frame.Sql;
import model.vo.Customer;

public class CustDao extends Dao {

	//회원가입 이후, DB에 전송
	@Override
	public void insert(Connection con, Object obj) throws Exception {
		Customer cust = (Customer)obj;
	      PreparedStatement pstmt = con.prepareStatement(Sql.insertCust);
	      pstmt.setString(1, cust.getId());
	      pstmt.setString(2, cust.getPwd());
	      pstmt.setString(3, cust.getName());
	      pstmt.setInt(4, cust.getGender());
	      pstmt.setInt(5, cust.getAge());
	      pstmt.setString(6, cust.getLocation());
	      pstmt.executeUpdate();
	      close(pstmt);
	     
	}
	@Override
	public void update(Connection con, Object obj) throws Exception {
		Customer cust = (Customer)obj;
		PreparedStatement pstmt = con.prepareStatement(Sql.updateCust);
		pstmt.setString(1, cust.getPwd());
		pstmt.setString(2, cust.getName());
		pstmt.setInt(3, cust.getGender());
		pstmt.setInt(4, cust.getAge());
		pstmt.setString(5, cust.getLocation());
		pstmt.setString(6, cust.getId());
		pstmt.executeUpdate();
		close(pstmt);
	}

	@Override
	public void delete(Connection con, Object obj) throws Exception {
		Customer cust = (Customer)obj;
		PreparedStatement pstmt = con.prepareStatement(Sql.deleteCust);
		pstmt.setString(1, cust.getId());
		pstmt.executeUpdate();
		close(pstmt);
	}

	@Override
	public Object select(Connection con, Object obj) throws Exception {
	      Object cust = null;
	      PreparedStatement pstmt = 
	            con.prepareStatement(Sql.selectCust);
	      pstmt.setString(1, obj.toString());
	      ResultSet rset = pstmt.executeQuery();
	      rset.next();
	      cust = new Customer(
	            rset.getString("ID"),
	            rset.getString("PASSWORD"),
	            rset.getString("NAME"),
	            rset.getInt("GENDER"),
	            rset.getInt("AGE"),
	            rset.getString("AREA")
	            );
	      close(rset);
	      close(pstmt);
	      return cust;
	}
	@Override
	public ArrayList<Object> select(Connection con) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
