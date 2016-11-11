package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import model.account.AccountBiz;
import model.history.HistoryBiz;
import model.vo.Account;
import model.vo.History;
import model.vo.SelectedDate;

@WebServlet({ "/HistoryMgtServlet", "/hismgt" })
public class HistoryMgtServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	HistoryBiz biz;
	AccountBiz abiz;
	Logger logger = Logger.getLogger(HistoryMgtServlet.class);
    
	public HistoryMgtServlet() {
		biz = new HistoryBiz();
		abiz = new AccountBiz();
	}
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String act = request.getParameter("act");
		RequestDispatcher rd = null;

		String next = "main.jsp";
		if (act.equals("hrg")) {
			String id = request.getParameter("id");
			String accNo = request.getParameter("accNO");
			int dwcode = Integer.parseInt(request.getParameter("dwcode"));
			int payment = Integer.parseInt(request.getParameter("payment"));
			int price = Integer.parseInt(request.getParameter("price"));
			String date = request.getParameter("date");
			String memo = request.getParameter("memo");
			memo = new String(memo.getBytes("8859_1"),"KSC5601");
			String useloc = request.getParameter("useloc");
			useloc = new String(useloc.getBytes("8859_1"),"KSC5601");
			int mcode = Integer.parseInt(request.getParameter("mcd"));
			int lcode = Integer.parseInt(request.getParameter("lcd"));
			
			//History his = new History(accNo, dwcode, payment, price, date, memo, useloc, mcode, lcode);
			History his = new History(accNo, dwcode, payment, price, date, memo, useloc, mcode, lcode);
			
			logger.debug("," + accNo + "," + dwcode + "," + payment + "," + price + "," + date + "," + mcode
                    + "," + lcode);
			
			Account acc = null; // ���õ� ���� �޴� Account ����
			int balanceOfAccount; // �ܾ� �ޱ����� ����
			try {
				biz.register(his);
				request.setAttribute("his", his);
				request.setAttribute("center", "hisRegister");
				request.setAttribute("nav", "nav");
			} catch (Exception e) {
				request.setAttribute("msg", e.getMessage());
				e.printStackTrace();
			}
			// ������ ������ �������� �ҷ����� �ܾ� ����
			try {
				acc = abiz.getAccInfo(accNo);
				if (dwcode == 1) { // �Ա��� ��� price ����
					balanceOfAccount = acc.getBalance() + price;
				} else { // ����� ��� price ����
					balanceOfAccount = acc.getBalance() - price;
				}
				// �ܾ� �κ� ������Ʈ
				abiz.updateBalance(accNo, balanceOfAccount);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			next = "main?cmd=impl&impl=hismgt&act=sacid1&id=" + id;

		} else if (act.equals("hdel")) {
			int seq = Integer.parseInt(request.getParameter("seq"));
			String hid = request.getParameter("id");
			
			try {
				biz.remove(seq);
			} catch (Exception e) {
				e.printStackTrace();
			} // ���¹�ȣ�� �����丮 ��ȸ//��ühis���ȭ������.
			
			request.setAttribute("center", "allHistory");
			request.setAttribute("nav", "nav");
			next="main?cmd=impl&impl=hismgt&act=hselall&id="+hid; 
		} else if (act.equals("hselall")) {
			ArrayList<Object> hisalllist = null;
			String id = request.getParameter("id");
			try {
				hisalllist = biz.getallhis(id);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("hisalllist", hisalllist);
			request.setAttribute("center", "allHistory");
			request.setAttribute("nav", "nav");
		} else if (act.equals("historysearchdate")) {// ��¥�� ��ȸ
			ArrayList<Object> hislist = null;
			String StartDate = request.getParameter("sd");
			String EndDate = request.getParameter("ed");
			String id = request.getParameter("id");

			SelectedDate std = new SelectedDate(StartDate, EndDate);
			try {
				hislist = biz.getlist(std, id);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("hislist", hislist);
			request.setAttribute("center", "datesearch");
			request.setAttribute("nav", "nav");

		} else if (act.equals("sacid")) {
			// id�� ���� ���¹�ȣ�� ���� ������.
			ArrayList<Object> acclist = null;
			String id = request.getParameter("id");
			try {
				acclist = biz.getAcc(id);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("acclist", acclist);
			request.setAttribute("id", id);
			request.setAttribute("center", "accNoSearch");
			request.setAttribute("nav", "nav");
		} else if (act.equals("sacid1")) {
			// �ѹ� ��ȸ ����, �ٽ� ���¹�ȣ�� ��� �����ϰ� ��.
			ArrayList<Object> acclist = null;
			String id = request.getParameter("id");
			try {
				acclist = biz.getAcc(id);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("acclist", acclist);
			request.setAttribute("center", "hisRegister");
			request.setAttribute("nav", "nav");

		} else if (act.equals("hsa")) {// ���¹�ȣ���� �����丮 ��ȸ
			ArrayList<Object> acchislist = null;
			ArrayList<Object> acclist = null;

			String accno = request.getParameter("accNo");
			String id = request.getParameter("id");

			try {
				acchislist = biz.getacchis(accno);
				acclist = biz.getAcc(id);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("acclist", acclist);
			request.setAttribute("acchislist", acchislist);
			request.setAttribute("center", "accNoSearch");
			request.setAttribute("nav", "nav");
		} else if (act.equals("hsdcode")) {//��/��� ��ȸ
			ArrayList<Object> dwhislist = null;
			String id = request.getParameter("id");
			int dwcode = Integer.parseInt(request.getParameter("dwcode"));
			try {
				dwhislist = biz.gethisdwcode(id, dwcode);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("dwhislist", dwhislist);
			request.setAttribute("nav", "nav");
			if (dwcode == 1) {
				request.setAttribute("center", "deposithistory");
			} else {
				request.setAttribute("center", "withdrawhistory");
			}
		}
		// next�� ����
		rd = request.getRequestDispatcher(next);
		rd.forward(request, response);
	}

}
