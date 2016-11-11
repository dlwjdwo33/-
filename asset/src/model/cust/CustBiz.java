package model.cust;

import java.sql.Connection;
import java.util.ArrayList;

import model.frame.Biz;

public class CustBiz extends Biz {
	CustDao dao;
		
	public CustBiz(){
		dao = new CustDao();
	}
	
	@Override
	public void register(Object obj) throws Exception {
		Connection con = getConnection();
		try{
			dao.insert(con, obj);		
			con.commit();
		}catch(Exception e){
			con.rollback();
			throw e;
		}finally{
			close(con);
		}
	}

	@Override
	public void modify(Object obj) throws Exception {
		Connection con = getConnection();
		try{
			dao.update(con, obj);
			con.commit();
		}catch(Exception e){
			con.rollback();
			throw e;
		}finally{
			close(con);
		}
	}
	@Override
	public void remove(Object obj) throws Exception {
		Connection con = getConnection();
		try{
			dao.delete(con, obj);
			con.commit();
		}catch(Exception e){
			con.rollback();
			throw e;
		}finally{
			close(con);
		}
	}
	@Override
	public Object get(Object obj) throws Exception {
		Object result = null;
		Connection con = getConnection();
		try{
			result = dao.select(con, obj);
		}catch(Exception e){
			throw e;
		}finally{
			close(con);
		}
		return result;
	}

	@Override
	public ArrayList<Object> get() throws Exception {
		ArrayList<Object> result = null;
		Connection con = getConnection();
		try{
			result = dao.select(con);
		}catch(Exception e){
			throw e;
		}finally{
			close(con);	
		}
		return result;
	}

}
