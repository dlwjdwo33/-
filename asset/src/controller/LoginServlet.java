package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.account.AccountBiz;
import model.cust.CustBiz;

import model.vo.Customer;

@WebServlet({ "/LoginServlet", "/login" })
public class LoginServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
   CustBiz biz;
   AccountBiz abiz;

    public LoginServlet() {
        biz = new CustBiz();
        abiz = new AccountBiz();
    }
   
   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String act = request.getParameter("act");
		RequestDispatcher rd = null;
		String cid="";//������� id�� ���Ͽ� �������� ���� Ȯ�� ����, ��ü
        int cnt=0;
		String next = "main.jsp";
      if(act.equals("in")){
         String id = request.getParameter("id");
         String pwd = request.getParameter("pwd");
         Customer cust = null;
         try {
            cust = (Customer) biz.get(id);
         } catch (Exception e) {
             e.printStackTrace();
         }
        if(cust != null && pwd.equals(cust.getPwd())){//login ����
           HttpSession session = request.getSession();
           cid=cust.getId();
           try{
        	   cnt=(int) abiz.check(cid);
           }catch(Exception e){
        	   e.printStackTrace();
           }
           if(cnt==0){
        	   request.setAttribute("nav", "nav");
        	   request.setAttribute("center", "manual");
        	   request.setAttribute("footer", "foot");
        	 //�α��� ok, ���� x. mypage���� ����϶�� �ȳ��� ��� jsp �ʿ�.
           }
           else{
        	   //�α��� ok, ���� o ���.  center, center.jsp

        	   request.setAttribute("nav", "nav");
        	   request.setAttribute("center", "manual");
           }
           session.setAttribute("logincust", cust);
  
        }else{//login ����
           request.setAttribute("center", "loginfail");
        }         
      }else{//logout ���
         HttpSession session = request.getSession();
         if(session != null){
            session.invalidate();
         }
      }
	rd = request.getRequestDispatcher(next); // login ���� Ȯ���ϰ� main���� ���ư�.
	rd.forward(request, response);				   // �ٽ� main �ǵ��ư�
   }
}