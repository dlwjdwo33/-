package cate.biz;

import java.sql.Connection;
import java.util.ArrayList;

import cate.dao.CateDao;
import model.frame.Biz;

public class CateBiz extends Biz {
	CateDao dao = null;
	public CateBiz(){
		dao = new CateDao();
	}
	@Override
	public void register(Object obj) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modify(Object obj) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remove(Object obj) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Object get(Object obj) throws Exception {
		return null;
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

	public ArrayList<Object> getlist(Object obj) throws Exception {
		ArrayList<Object> result = null;
		Connection con = getConnection();
		try{
			result = dao.selectcatelist(con,obj);
		}catch(Exception e){
			throw e;
		}finally{
			close(con);	
		}
		return result;
	}

}
