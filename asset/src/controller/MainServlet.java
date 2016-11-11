package controller;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({ "/MainServlet", "/main" })
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getParameter("cmd");
		RequestDispatcher rd =null;

		String next = "main.jsp";

		if(cmd==null || cmd.equals("")){	
			request.setAttribute("footer", "footer"); 
		}else if(cmd.equals("page")){ 			// 단순 화면 이동
			String page = request.getParameter("page");
			request.setAttribute("center", page+".jsp"); 
			build(request,page);			
		}else if(cmd.equals("impl")){// 서버에서 데이터를 조회하는 업무 필요
			String impl = request.getParameter("impl");
			next = impl;      
		}	
		 rd = request.getRequestDispatcher(next);   
	     rd.forward(request, response);
	}
	private void build(HttpServletRequest request, String page) {
		// page에 따라 화면을 만든다.//return type을 void가 아닌 String next 으로 설정 
 
		if(page.equals("login")){
		         request.setAttribute("center", "login"); 
		      }

		  else if(page.equals("join")){
		         request.setAttribute("center", "join"); 
		      }
		  else if(page.equals("myinfo")){
	       	   request.setAttribute("nav", "nav");
			  request.setAttribute("center", "myinfo");
		      }
		  else if(page.equals("accreg")){
	       	   request.setAttribute("nav", "nav");
			  	request.setAttribute("center", "accountreg");
		      }
		  else if(page.equals("myinfoup")){

	       	   request.setAttribute("nav", "nav");
			  	request.setAttribute("center", "myinfoupdate");
		      }
		  else if(page.equals("accmgt")){
	       	   request.setAttribute("nav", "nav");
	       	   request.setAttribute("center", "accmgt");
	       	   request.setAttribute("footer", "foot");
			      }
		  else if(page.equals("register")){
			  	request.setAttribute("center", "hisregister");
		      }
		  else if(page.equals("accNoSearch")){
	       	   request.setAttribute("nav", "nav");
	       	   request.setAttribute("center", "accNoSearch");
	       	   request.setAttribute("footer", "foot");
	       	   String id = request.getParameter("id");
	       	   System.out.println(id);
			      }
		  else if(page.equals("accup")){
			  	request.setAttribute("center", "accountupdate");
		      }	
		  else if(page.equals("cate")){
			  request.setAttribute("center", "cate");
			  request.setAttribute("nav", "nav");
	      }	
		  else if(page.equals("label")){
			  request.setAttribute("center", "label");
			  request.setAttribute("nav", "nav");
	      }	
		  else if(page.equals("cardcash")){
				request.setAttribute("nav", "nav");
				request.setAttribute("center", "cardcash");
			  }
		  else if(page.equals("hisRegister")){
			request.setAttribute("nav", "nav");
			request.setAttribute("center", "hisRegister");
		  }
		  else if(page.equals("manual")){
				request.setAttribute("nav", "nav");
				request.setAttribute("center", "manual");
		  }
	}
	

}
