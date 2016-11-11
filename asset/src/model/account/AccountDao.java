package model.account;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.frame.Dao;
import model.frame.Sql;
import model.vo.Account;

public class AccountDao extends Dao {
	public Object confirm(Connection con, Object obj) throws Exception{
	      Object acc = null;
	      PreparedStatement pstmt = 
	            con.prepareStatement(Sql.checkAcc);
	      pstmt.setString(1, obj.toString());//추후에 upper
	      ResultSet rset = pstmt.executeQuery();
	      rset.next();
	      acc=rset.getInt(1);
	      System.out.println(acc);
	      close(rset);
	      close(pstmt);
	      return acc;
	}
	//Mypage에서 계좌 등록시.
	@Override
	public void insert(Connection con, Object obj) throws Exception {
		Account acc = (Account)obj;
		//user가 미입력시, string bal = m.getParameter("ba"); 
		//이게 null이라고 가정하고, 분기 작성함./0302_서지현/
		//추후 클라 코드 받아서 테스트 필요
		//int tmp =acc.getBalance();
		PreparedStatement pstmt = con.prepareStatement(Sql.insertAcc);
		pstmt.setString(1, acc.getAccNo());
		pstmt.setString(2, acc.getBankName());
		pstmt.setInt(3, acc.getBalance());
		pstmt.setString(4, acc.getAid());
		System.out.println(acc.toString());
		pstmt.executeUpdate();
	    close(pstmt);
	}
	@Override
	public void update(Connection con, Object obj) throws Exception {
		Account acc =(Account)obj;
		PreparedStatement pstmt = con.prepareStatement(Sql.updateAcc);
		pstmt.setString(1, acc.getBankName());
		pstmt.setInt(2, acc.getBalance());
		pstmt.setString(3, acc.getAccNo());
		pstmt.executeUpdate();
		close(pstmt);

	}
	@Override
	public void delete(Connection con, Object obj) throws Exception {
		PreparedStatement pstmt = con.prepareStatement(Sql.deleteAcc);
		pstmt.setString(1,obj.toString());
		pstmt.executeUpdate();
		close(pstmt);

	}
	@Override
	public ArrayList<Object> select(Connection con,Object obj) throws Exception {
		ArrayList<Object> result = new ArrayList<>();
		PreparedStatement pstmt = con.prepareStatement(Sql.selectAllAcc);
		pstmt.setString(1, obj.toString());
		ResultSet rset = pstmt.executeQuery();
		//String str="";
		while(rset.next()){
			Account acc = null;
			//str=rset.getString("BANKNAME");
			//str = new String(str.getBytes("8859_1"),"KSC5601");
			acc = new Account(
					rset.getString("ACCNO"),
					rset.getString("BANKNAME"),
					rset.getInt("BALANCE")
					);
			result.add(acc);
		}
		close(rset);
		close(pstmt);
		return result;
	}
	@Override
	public ArrayList<Object> select(Connection con) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	//0318 accno 전달 시 account 객체 반환하는 DAO 생성
	   public Account selectAccount(Connection con, String accno) throws Exception {

	      Account acc = null;
	      PreparedStatement pstmt = con.prepareStatement(Sql.selectAccInfo);
	      pstmt.setString(1, accno);
	      ResultSet rset = pstmt.executeQuery();
	      while (rset.next()) {
	         acc = new Account(rset.getString("ACCNO"),
	                       rset.getString("BANKNAME"),
	                       rset.getInt("BALANCE")
	                       );
	      }
	      close(rset);
	      close(pstmt);
	      return acc;
	   }
	   
	   //전달된 accno 에 해당하는 계좌의 잔액 업데이트
	   public void updateBalance(Connection con, String accno, int adjustedBalance) throws SQLException{
	      PreparedStatement pstmt = con.prepareStatement(Sql.updateAccBalance);
	      pstmt.setInt(1, adjustedBalance);
	      pstmt.setString(2, accno);
	      pstmt.executeQuery();   
	      close(pstmt);
	   }

}
