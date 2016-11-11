package cate.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.frame.Dao;
import model.frame.Sql;
import model.vo.lCode;
import model.vo.mCode;

public class CateDao extends Dao {

	@Override
	public void insert(Connection con, Object obj) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(Connection con, Object obj) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Connection con, Object obj) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public Object select(Connection con, Object obj) throws Exception {
		ArrayList<Object> result = new ArrayList<>();
		mCode selectedLcode = (mCode)obj;
		PreparedStatement pstmt = 
				con.prepareStatement(Sql.selectMcategory);
		pstmt.setInt(1, selectedLcode.getLcode());
		ResultSet rset = pstmt.executeQuery();
		while(rset.next()){
			mCode mcd = null;
			mcd = new mCode(
					rset.getInt("MCODE"),
					rset.getString("MCODENAME"),
					rset.getInt("MLCODE")
					);
			result.add(mcd);
		}
		close(rset);
		close(pstmt);
			
		return result;
	}

	@Override
	public ArrayList<Object> select(Connection con) throws Exception {
		ArrayList<Object> result = new ArrayList<>();
		PreparedStatement pstmt = 
				con.prepareStatement(Sql.selectLcategory);
		ResultSet rset = pstmt.executeQuery();
		while(rset.next()){
			lCode lcd = null;
			lcd = new lCode(
					rset.getInt("LCODE"),
					rset.getString("LCODENAME")
					);
			result.add(lcd);
		}
		close(rset);
		close(pstmt);
		return result;
	}
	
	public ArrayList<Object> selectcatelist(Connection con, Object obj) throws Exception {
		ArrayList<Object> result = new ArrayList<>();
		
		String sltdvalue = (String) obj;
		
		PreparedStatement pstmt = 
				con.prepareStatement(Sql.selectMcategory);
		pstmt.setString(1, sltdvalue);
		ResultSet rset = pstmt.executeQuery();
		while(rset.next()){
			mCode mcd = null;
			mcd = new mCode(
					rset.getInt("MCODE"),
					rset.getString("MCODENAME"),
					rset.getInt("MLCODE")
					);
			result.add(mcd);
		}
		close(rset);
		close(pstmt);
			
		return result;
	}




}
