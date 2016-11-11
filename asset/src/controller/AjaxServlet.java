package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import cate.biz.CateBiz;
import model.vo.lCode;
import model.vo.mCode;

@WebServlet({ "/AjaxServlet", "/ajaxs" })
public class AjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    CateBiz biz;
    public AjaxServlet() {
        super();
        biz = new CateBiz();
    }

	@SuppressWarnings("unchecked")
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String act = request.getParameter("act");
		String slvalue = request.getParameter("lcode");
		if(act.equals("slcode")){
			ArrayList<Object> list = null;
			try {
				list = biz.get();
			} catch (Exception e) {
				e.printStackTrace();
			}
			response.setContentType("text/html;charset=euc-kr");
			PrintWriter out = response.getWriter();
			
			JSONArray arr = new JSONArray();
			for(Object obj : list){
				lCode lcode = (lCode)obj;
				JSONObject jo = new JSONObject();
				jo.put("lcode", lcode.getlCode());
				jo.put("lcodename",lcode.getlCodeName());
				//JSON ��ü���� JSONArray �� �߰��Ѵ�.
				arr.add(jo);
			}
			out.print(arr.toJSONString());
			out.close();
		}else if(act.equals("smcode")){
			ArrayList<Object> list = null;
			try {
				list = biz.getlist(slvalue);
			} catch (Exception e) {
				e.printStackTrace();
			}

			response.setContentType("text/html;charset=euc-kr");
			PrintWriter out = response.getWriter();
			
			JSONArray arr = new JSONArray();
			for(Object obj : list){
				mCode mcode = (mCode)obj;
				JSONObject jo = new JSONObject();
				jo.put("mcode", mcode.getMcode());
				jo.put("mcodename",mcode.getmCodeName());
				jo.put("mlcode", mcode.getLcode());
				//JSON ��ü���� JSONArray �� �߰��Ѵ�.
				arr.add(jo);
			}
			
			out.print(arr.toJSONString());
			out.close();
		}
	}
}
