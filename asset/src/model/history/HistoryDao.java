package model.history;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.frame.Dao;
import model.frame.Sql;
import model.vo.Account;
import model.vo.History;
import model.vo.SelectedDate;

public class HistoryDao extends Dao {

	@Override
	public void insert(Connection con, Object obj) throws Exception {
		History his = (History)obj;
		PreparedStatement pstmt = con.prepareStatement(Sql.insertHis);
		pstmt.setString(1, his.getAccNo());
		pstmt.setInt(2,his.getDwcode());
		pstmt.setInt(3,his.getPayment());
		pstmt.setInt(4, his.getPrice());
		pstmt.setString(5,his.getDate());
		pstmt.setString(6, his.getMemo());
		pstmt.setString(7, his.getUseloc());
		pstmt.setInt(8, his.getMcode());
		pstmt.setInt(9, his.getLcode());
		pstmt.executeUpdate();
	    close(pstmt);
	}

	@Override
	public void update(Connection con, Object obj) throws Exception {
		// TODO Auto-generated method stub
	}

	@Override
	public void delete(Connection con, Object obj) throws Exception {
		 PreparedStatement pstmt = con.prepareStatement(Sql.deleteHis);
	      pstmt.setInt(1, Integer.parseInt(obj.toString()));
	      pstmt.executeUpdate();
	      close(pstmt);
	}

	@Override
	public Object select(Connection con, Object obj) throws Exception {
		Object his = null;

      return his;
	}

	@Override
	public ArrayList<Object> select(Connection con) throws Exception {
		ArrayList<Object> result = new ArrayList<>();
		PreparedStatement pstmt = con.prepareStatement(Sql.selectAllHis);
		ResultSet rset = pstmt.executeQuery();
		String str1 ="";
		String str2 ="";
		while (rset.next()) {
			History his = null;
			str1 = rset.getString("MEMO");
			str2=rset.getString("SPECIFICATION");
			his = new History(rset.getInt("HIS_SEQ"), 
					rset.getString("HACCNO"), 
					rset.getInt("DWCODE"),
					rset.getInt("PAYTYPE"), 
					rset.getInt("PRICE"), 
					rset.getString("HDATE"), 
					str1,
					str2,
					rset.getInt("HMCODE"), 
					rset.getInt("HLCODE"));
			result.add(his);
		}
		close(rset);
		close(pstmt);
		return result;
	}

	public ArrayList<Object> selectAcc(Connection con, String id) throws Exception {
		ArrayList<Object> result = new ArrayList<>();
		Account acc = null;
		PreparedStatement pstmt = con.prepareStatement(Sql.selectAccount);
		pstmt.setString(1, id);
		ResultSet rset = pstmt.executeQuery();
		while (rset.next()) {
			acc = new Account(rset.getString("ACCNO"),
					rset.getString("bankName"), 
					rset.getInt("balance"),
					rset.getString("aid"));
			result.add(acc);
		}
		close(rset);
		close(pstmt);
		return result;
	}

	public ArrayList<Object> selectlist(Connection con, Object obj , String id) throws Exception {
		ArrayList<Object> result = new ArrayList<>();
		SelectedDate std = null;
		std = (SelectedDate) obj;
		PreparedStatement pstmt = con.prepareStatement(Sql.selectDate);
		pstmt.setString(1, std.getStartDate());
		pstmt.setString(2, std.getEndDate());
		pstmt.setString(3, id);

		ResultSet rset = pstmt.executeQuery();
		while (rset.next()) {
			History his = null;
			his = new History(
					rset.getInt("HIS_SEQ"),
					rset.getString("HACCNO"), 
					rset.getString("BANKNAME"), 
					rset.getInt("DWCODE"),
					rset.getInt("PAYTYPE"), 
					rset.getInt("PRICE"), 
					rset.getString("HDATE"), 
					rset.getString("MEMO"),
					rset.getString("SPECIFICATION"), 
					rset.getInt("HMCODE"), 
					rset.getString("AID"),
					rset.getString("MCODENAME"));
			result.add(his);
		}
		close(rset);
		close(pstmt);
		return result;
	}

	public ArrayList<Object> selectacchis(Connection con, String accno) throws SQLException {
		ArrayList<Object> result = new ArrayList<>();
	//계좌별 조회
		PreparedStatement pstmt = con.prepareStatement(Sql.selectacchis);
		pstmt.setString(1, accno);		
		ResultSet rset = pstmt.executeQuery();
		while (rset.next()) {
			History his = null;
			his = new History(
					rset.getInt("HIS_SEQ"),
					rset.getString("HACCNO"),
					rset.getString("BANKNAME"), 
					rset.getInt("DWCODE"),
					rset.getInt("PAYTYPE"),
					rset.getInt("PRICE"), 
					rset.getString("HDATE"),
					rset.getString("MEMO"),
					rset.getString("SPECIFICATION"), 
					rset.getInt("HMCODE"), 
					rset.getString("AID"),
					rset.getString("MCODENAME"));
			result.add(his);
		}
		close(rset);
		close(pstmt);
		return result;	
	}
	public ArrayList<Object> selectallhis(Connection con,String id) throws SQLException {
		ArrayList<Object> result = new ArrayList<>();
		//id에 해당하는 모든 계좌의 모든 내역 출력
		PreparedStatement pstmt = con.prepareStatement(Sql.selectAllHis);		
		pstmt.setString(1, id);	
		ResultSet rset = pstmt.executeQuery();
		
		while (rset.next()) {
			History his = null;
			his = new History(
					rset.getInt("HIS_SEQ"),
					rset.getString("HACCNO"),
					rset.getString("BANKNAME"), 
					rset.getInt("DWCODE"),
					rset.getInt("PAYTYPE"),
					rset.getInt("PRICE"), 
					rset.getString("HDATE"),
					rset.getString("MEMO"),
					rset.getString("SPECIFICATION"), 
					rset.getInt("HMCODE"), 
					rset.getString("AID"),
					rset.getString("MCODENAME"),
					rset.getString("LCODENAME"));
			result.add(his);
		}
		close(rset);
		close(pstmt);
		return result;	
	} 
	public ArrayList<Object> selectdwcodehis(Connection con,String id,int dwcode) throws SQLException {
		ArrayList<Object> result = new ArrayList<>();
	
		PreparedStatement pstmt = con.prepareStatement(Sql.selectDWCode);		
		pstmt.setString(1,id);
		pstmt.setInt(2, dwcode);	
		ResultSet rset = pstmt.executeQuery();
		
		while (rset.next()) {
			History his = null;
			his = new History(
					rset.getInt("HIS_SEQ"),
					rset.getString("HACCNO"),
					rset.getString("BANKNAME"), 
					rset.getInt("DWCODE"),
					rset.getInt("PAYTYPE"),
					rset.getInt("PRICE"), 
					rset.getString("HDATE"),
					rset.getString("MEMO"),
					rset.getString("SPECIFICATION"), 
					rset.getInt("HMCODE"), 
					rset.getString("AID"),
					rset.getString("MCODENAME"),
					rset.getString("LCODENAME"));
			result.add(his);
		}
		close(rset);
		close(pstmt);
		return result;	
	}

}
