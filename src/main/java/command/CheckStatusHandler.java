package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProductDAO;
import dto.LoveDTO;
import net.sf.json.JSONObject;


public class CheckStatusHandler implements CommandHandler{

	
	private ProductDAO productDAO;
	
	public CheckStatusHandler () {
		productDAO = new ProductDAO();
	}
	
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {

		HttpSession session = req.getSession();
		String member_id = (String) session.getAttribute("member_id");
//		System.out.println(member_id); 로그인한 아이디

		int product_id = Integer.parseInt( req.getParameter("product_id")); // 상세페이지에서 넘어온 상품 아이디
//		System.out.println("넘어오는 상품 아이디 값 : " + req.getParameter("product_id"));
		
		
		
		
		
		boolean lovecheck = productDAO.getLoveCheck(member_id , product_id);
		
		
	
		
		// 참이라면 찜함
		
		
		JSONObject json = new JSONObject();
		json.put("lovecheck", lovecheck);
		return json.toString();
		
	}

}
