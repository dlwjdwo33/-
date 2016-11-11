package model.account;

import java.sql.Connection;
import java.util.ArrayList;

import model.frame.Biz;
import model.vo.Account;

public class AccountBiz extends Biz {
	AccountDao dao;
	public AccountBiz(){
		dao = new AccountDao();
	}
	
	public Object check(Object obj) throws Exception {
		Object result = null;
		Connection con = getConnection();
		try{
			result = dao.confirm(con, obj);
		}catch(Exception e){
			throw e;
		}finally{
			close(con);
		}
		return result;
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
	public ArrayList<Object> get(Object obj) throws Exception {
		ArrayList<Object> result = null;
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
	   //0318 accno 전달 시 account 객체 반환하는 biz 생성
	   public Account getAccInfo(String accno) throws Exception{
	      Account acc = null;
	      Connection con = getConnection();
	      try{
	         acc = dao.selectAccount(con,accno);
	      }catch(Exception e){
	         throw e;
	      }finally{
	         close(con);   
	      }
	      return acc;
	   }
	   
	   // 전달된 계좌번호에 해당하는 balance 조정 (update)
	   public void updateBalance(String accno, int adjustedBalance) throws Exception{
	      Connection con = getConnection();
	      try {
	         dao.updateBalance(con,accno,adjustedBalance);
	      }catch(Exception e){
	         throw e;
	      }finally{
	         close(con);   
	      }
	      
	   }
	
}
