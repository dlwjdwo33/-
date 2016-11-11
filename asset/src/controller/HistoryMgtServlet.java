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
			
			Account acc = null; // 선택된 계좌 받는 Account 변수
			int balanceOfAccount; // 잔액 받기위한 변수
			try {
				biz.register(his);
				request.setAttribute("his", his);
				request.setAttribute("center", "hisRegister");
				request.setAttribute("nav", "nav");
			} catch (Exception e) {
				request.setAttribute("msg", e.getMessage());
				e.printStackTrace();
			}
			// 지정된 계좌의 계좌정보 불러오고 잔액 조정
			try {
				acc = abiz.getAccInfo(accNo);
				if (dwcode == 1) { // 입금의 경우 price 증가
					balanceOfAccount = acc.getBalance() + price;
				} else { // 출금의 경우 price 감소
					balanceOfAccount = acc.getBalance() - price;
				}
				// 잔액 부분 업데이트
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
			} // 계좌번호별 히스토리 조회//전체his출력화면으로.
			
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
		} else if (act.equals("historysearchdate")) {// 날짜별 조회
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
			// id에 딸린 계좌번호를 전부 가져옴.
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
			// 한번 조회 이후, 다시 계좌번호를 출력 가능하게 함.
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

		} else if (act.equals("hsa")) {// 계좌번호별로 히스토리 조회
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
		} else if (act.equals("hsdcode")) {//입/출금 조회
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
		// next로 변경
		rd = request.getRequestDispatcher(next);
		rd.forward(request, response);
	}

}
