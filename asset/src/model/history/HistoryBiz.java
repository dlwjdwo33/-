package model.history;

import java.sql.Connection;
import java.util.ArrayList;

import model.frame.Biz;


public class HistoryBiz extends Biz {
	HistoryDao dao;

	public HistoryBiz() {
		dao = new HistoryDao();
	}

	@Override
	public void register(Object obj) throws Exception {
		Connection con = getConnection();
		try {
			dao.insert(con, obj);
			con.commit();
		} catch (Exception e) {
			con.rollback();
			throw e;
		} finally {
			close(con);
		}
	}

	@Override
	public void modify(Object obj) throws Exception {
		Connection con = getConnection();
		try {
			dao.update(con, obj);
			con.commit();
		} catch (Exception e) {
			con.rollback();
			throw e;
		} finally {
			close(con);
		}
	}

	@Override
	public void remove(Object obj) throws Exception {
		Connection con = getConnection();
		try {
			dao.delete(con, obj);
			con.commit();
		} catch (Exception e) {
			con.rollback();
			throw e;
		} finally {
			close(con);
		}
	}

	@Override
	public Object get(Object obj) throws Exception {
		Object result = null;
		Connection con = getConnection();
		try {
			result = dao.select(con, obj);
		} catch (Exception e) {
			throw e;
		} finally {
			close(con);
		}
		return result;
	}

	@Override
	public ArrayList<Object> get() throws Exception {
		ArrayList<Object> result = null;
		Connection con = getConnection();
		try {
			result = dao.select(con);
		} catch (Exception e) {
			throw e;
		} finally {
			close(con);
		}
		return result;
	}

	public ArrayList<Object> getAcc(String id) throws Exception {
		ArrayList<Object> result = null;
		Connection con = getConnection();
		try {
			result = dao.selectAcc(con, id);
		} catch (Exception e) {
			throw e;
		} finally {
			close(con);
		}
		return result;
	}

	public ArrayList<Object> getlist(Object obj, String id) throws Exception {
		ArrayList<Object> result = null;
		Connection con = getConnection();
		try {
			result = dao.selectlist(con, obj, id);
		} catch (Exception e) {
			throw e;
		} finally {
			close(con);
		}
		return result;
	}

	public ArrayList<Object> getacchis(String accno) throws Exception {
		ArrayList<Object> result = null;
		Connection con = getConnection();
		try {
			result = dao.selectacchis(con, accno);
		} catch (Exception e) {
			throw e;
		} finally {
			close(con);
		}
		return result;
	}

	public ArrayList<Object> getallhis(String id) throws Exception {
		ArrayList<Object> result = null;
		Connection con = getConnection();
		try {
			result = dao.selectallhis(con, id);
		} catch (Exception e) {
			throw e;
		} finally {
			close(con);
		}
		return result;
	}

	public ArrayList<Object> gethisdwcode(String id, int dwcode) throws Exception {
		ArrayList<Object> result = null;
		Connection con = getConnection();
		try {
			result = dao.selectdwcodehis(con, id, dwcode);
		} catch (Exception e) {
			throw e;
		} finally {
			close(con);
		}
		return result;
	}

	

}
