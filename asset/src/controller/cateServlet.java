package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cate.biz.CateBiz;

@WebServlet({ "/cateServlet", "/cate" })
public class cateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CateBiz biz=null;
	RequestDispatcher rd = null;
    public cateServlet() {
    	super();
    	biz = new CateBiz();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String act = request.getParameter("act");	
		if(act.equals("slcode")){
			ArrayList<Object> lCatelist = new ArrayList<>();
			try {				
				lCatelist = biz.get();
				request.setAttribute("lcatelist",lCatelist);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(act.equals("smcode")){
			String selectedValue = request.getParameter("lcode");
			ArrayList<Object> mCatelist = new ArrayList<>();
			try {
				mCatelist = biz.getlist(selectedValue);
				request.setAttribute("mcatelist", mCatelist);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//rd = request.getRequestDispatcher();
		//rd.forward(request, response);
		//GoNext.goNext(request, response, "cateshow.jsp");
		
	}
}
