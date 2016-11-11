package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.account.AccountBiz;
import model.vo.Account;

@WebServlet({ "/AccountMgtServlet", "/accmgt" })
public class AccountMgtServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AccountBiz biz;
	public AccountMgtServlet(){
		biz = new AccountBiz();
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String act = request.getParameter("act"); 
		RequestDispatcher rd = null;
		String next = "main.jsp";
		if(act.equals("arg")){//등록
			String accNo = request.getParameter("accNo");
			String bankName = request.getParameter("bankName");
			bankName = new String(bankName.getBytes("8859_1"),"KSC5601");
	        int balance = Integer.parseInt(request.getParameter("balance"));
			String aid=request.getParameter("aid");

			Account acc = new Account(accNo, bankName, balance, aid);
			System.out.println(acc);
			  try{
		        	biz.register(acc);
		        	request.setAttribute("acc", acc);	
		        	request.setAttribute("nav","nav");
		        	request.setAttribute("center","accmgt");
		        	next="main?cmd=impl&impl=accmgt&act=aselall&id="+aid;
		        }catch (Exception e){
		        	request.setAttribute("msg", e.getMessage());
		        	e.printStackTrace();
		        }
		}
		
		else if(act.equals("adel")){//삭제
			String accNo = request.getParameter("test");
			String id = request.getParameter("id");
			try {
				biz.remove(accNo);
				next="main?cmd=impl&impl=accmgt&act=aselall&id="+id;
		    	//삭제하고 나서 전체 조회.  
				} catch (Exception e) {
				System.out.println();
				e.printStackTrace();
			}
		}
		else if(act.equals("aselall")){
			String aid = request.getParameter("id");
			ArrayList<Object> acclist = null;
			try {
				acclist = biz.get(aid);
				request.setAttribute("acclist", acclist);
				request.setAttribute("center", "accmgt");
				request.setAttribute("nav", "nav");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		rd = request.getRequestDispatcher(next); //next로처리할거해봐야지.
		rd.forward(request, response);
	}

}
