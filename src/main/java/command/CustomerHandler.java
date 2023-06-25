package command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dao.ProductDAO;
import dao.ReviewDAO;
import dto.MemberDTO;
import dto.ProductDTO;
import dto.ReviewDTO;

public class CustomerHandler implements CommandHandler{

	private MemberDAO memberDAO;
	private ProductDAO productDAO;
	

	public CustomerHandler() {
		memberDAO = new MemberDAO();
		productDAO = new ProductDAO();
	}
	
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String member_id   ;

		if(req.getParameter("sell_id") !=  null) {
			String sell_id =req.getParameter("sell_id"); // 판매자 아이디  
			//System.out.println("세션아이디:" + data); 
			// 사용자 아이디


			//String member_id  = "상점1"; /// 지은이가 로그인하면 로그인한 member_id 담자 


			//		System.out.println(req.getParameter("intro")); 넘어오는값 확인한거 
			HttpSession session = req.getSession();
			String data = (String) session.getAttribute("member_id");
			
			member_id = data;
			
			String key = member_id + "_" + sell_id;
			if (session.getAttribute(key) == null) {
				// 방문수 증가 로직 적용
				memberDAO.increaseVisitCount(sell_id);

				// 세션에 방문 기록 저장
				session.setAttribute(key, true);
			}


		


			return "/WEB-INF/views/customer_service.jsp"; // 예시로 "market_my_store.jsp"라는 View 이름을 반환합니다.
		}
		
		
		
		else {

			HttpSession session = req.getSession();
			String data = (String) session.getAttribute("member_id");
			member_id = data;





			ArrayList<ProductDTO> list = productDAO.getMyShopProductList(member_id);

			req.setAttribute("list", list);


			System.out.println(list.toString());

			MemberDTO myData = memberDAO.getMemberInfo(member_id);



			System.out.println(myData.toString());

			
			
			//여기까지 오늘 코딩(6/16)

			
			req.setAttribute("myShop", myData); // 상점 정보를 요청 속성에 추가


			return "/WEB-INF/views/customer_service.jsp"; // 예시로 "market_my_store.jsp"라는 View 이름을 반환합니다.
		}
	}

}
