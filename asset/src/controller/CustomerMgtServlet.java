package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.cust.CustBiz;
import model.vo.Customer;

@WebServlet({ "/CustomerMgtServlet", "/custmgt" })
public class CustomerMgtServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	CustBiz biz;
	public CustomerMgtServlet(){
		biz=new CustBiz();
	}	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String act = request.getParameter("act"); 
		RequestDispatcher rd = null;
		String next="main.jsp";
		if(act.equals("crg")){    //rg = register
			String id = request.getParameter("id");
	        String pwd = request.getParameter("pwd");
	        String name = request.getParameter("name");
	        name = new String(name.getBytes("8859_1"),"KSC5601");
	        int gender = Integer.parseInt((request.getParameter("gender")));
	        int age = Integer.parseInt((request.getParameter("age")));
	        String location = request.getParameter("location");

	        Customer cust = new Customer(id, pwd, name, gender, age, location);
	        try{
	        	biz.register(cust);
	        	request.setAttribute("UserCust", cust);	//alert 환영합니다. 뿌릴것.
	        	request.setAttribute("center", "login");
	        	request.setAttribute("footer", "footer");
	        	
	        }catch (Exception e){
	        	request.setAttribute("msg", e.getMessage());
	           	e.printStackTrace();
	        }
			rd = request.getRequestDispatcher(next); 
			rd.forward(request, response);	
		}else if(act.equals("cup")){
			String id = request.getParameter("id");
	        String pwd = request.getParameter("pwd");
	        String name = request.getParameter("name");
	        name = new String(name.getBytes("8859_1"),"KSC5601");
	        int gender = Integer.parseInt((request.getParameter("gender")));
	        int age = Integer.parseInt((request.getParameter("age")));
	        String location = request.getParameter("location");
	        Customer a = new Customer(id, pwd, name, gender, age, location);
	        		
	        try{
	    	   biz.modify(a);
	    	   
	    	   next="main?cmd=page&page=myinfo&id="+id;
	       }catch(Exception e){
	        	request.setAttribute("msg", e.getMessage());
	        	e.printStackTrace();	    	   
	       }
			rd = request.getRequestDispatcher(next); 
			rd.forward(request, response);	
		}else if(act.equals("cdel")){
			String id = request.getParameter("id");
			try {
				biz.remove(id);
				next="login.jsp";//로그인 이전 화면으로 이동
				} catch (Exception e) {
				e.printStackTrace();
			}
		rd = request.getRequestDispatcher(next); 
		rd.forward(request, response);			

		}
	}
}
