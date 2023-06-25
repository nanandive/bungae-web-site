package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.CommandHandler;
import dao.MemberDAO;
import dao.ProductDAO;
import dto.MemberDTO;
import dto.ProductDTO;
import net.sf.json.JSONObject;

import java.util.ArrayList;

import javax.naming.NamingException;

public class IntroModifyHandler implements CommandHandler {

	private MemberDAO memberDAO;
//	private ProductDAO productDAO;
	
	
	public IntroModifyHandler() {
		memberDAO = new MemberDAO();
//		productDAO = new ProductDAO();
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
	    //String member_id = "상점1";
	    HttpSession session = req.getSession();
		String data = (String) session.getAttribute("member_id");
		
		String member_id = data;
	    String introduce =  req.getParameter("introduce");
	    
	    

	    
	    System.out.println("넘어온소개글" + introduce);
	    boolean result = memberDAO.updateIntroMyShop(introduce, member_id);

	    JSONObject json = new JSONObject();
	    json.put("result", result);  // { "result": "true"}

	    System.out.println( ">>>> " +  json.toString()  );
	    return json.toString();	
	}



}
