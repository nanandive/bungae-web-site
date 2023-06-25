package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProductDAO;
import net.sf.json.JSONObject;

public class LoveUpdateHandler implements CommandHandler{

	private ProductDAO productDAO;
	
	
	public LoveUpdateHandler() {
		productDAO = new ProductDAO(); 
	}
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
	
		
		HttpSession session = req.getSession();
		String member_id = (String) session.getAttribute("member_id"); // 로그인한 아이디
		
		// 넘어온 상품 아이디 확인
//		System.out.println( "넘어온 아이디 확인 : " + req.getParameter("product_id"));
		
		int product_id = Integer.parseInt(req.getParameter("product_id"));
		
		String lovecheck = req.getParameter("lovecheck");
	
		String love_count = req.getParameter("love_count");
		
		
		int lovecount = Integer.parseInt(love_count);
		
		// 넘어온 상품 찜 여부 
		System.out.println("넘어온 찜 여부: "+ req.getParameter("lovecheck"));
		
		if(lovecheck.equals("true")) { // 넘어온게 참이라면 -1 update 해줘야함
			
			productDAO.deleteLove(member_id, product_id);
			lovecount = productDAO.getLoveCount(product_id) -1; 
			
			
		} else { // 넘어온게 거짓이라면 +1 업데이트
			
			productDAO.createLove(member_id, product_id);
			lovecount = productDAO.getLoveCount(product_id) +1; 
			
			
		}
		
		
//		
//		String result  =  "됐다 "; 
		
		
//	    System.out.println("해당상품 찜 개수 : " + lovecount);
		
		JSONObject json = new JSONObject();
		json.put("lovecount", lovecount);
		return json.toString();
	}

}
