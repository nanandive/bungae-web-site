package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dao.OrdersDAO;
import dao.ProductDAO;
import dto.MemberDTO;
import dto.ProductDTO;



public class OrdersHandler implements CommandHandler{
	private OrdersDAO ordersDAO;
	private MemberDAO memberDAO;
	private ProductDAO productDAO;
	public OrdersHandler() {
		ordersDAO = new OrdersDAO();
		memberDAO = new MemberDAO();
		productDAO = new ProductDAO();
	}
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		// 로그인한 id


		// 

		//		String member_id = req.getParameter("member_id"); //  이게 구매자 id 지은이 로그인 처리하면 세션 아이디
		HttpSession session = req.getSession();
		String data = (String) session.getAttribute("member_id");
		
		String member_id = data; // 구매자 아이디
		
		
		
		int product_id =  Integer.parseInt(req.getParameter("product_id")); // 이 상품 아이디를 가진 회원id 를 구해야하고 ---> 판매자 id // 상세페이지에서 넘어오는거받아야함  		  
		String payment_method = req.getParameter("payment-method"); 
		String delivery_method = req.getParameter("delivery-method");  // 
		int price = Integer.parseInt(req.getParameter("product-price")); // 상품 가격
		String member_address=  req.getParameter("member-address"); // 구매자 주소 
		//		  진행상태 --- 구매 완료 ------- 내가 설정하자		  
		//		  결제일 --- sysdate로






		System.out.println(member_id);
		System.out.println(product_id);
		System.out.println(payment_method);
		System.out.println(delivery_method);
		System.out.println(price);
		System.out.println(member_address);


		ordersDAO.createOrders(member_id, product_id , payment_method,delivery_method ,price , member_address); 
		// 주문 목록에 추가 완료한 경우
		// -> 상점 업데이트 하러가야함



		// 판매자 정보 가져올 객체
		ProductDTO sellProduct = productDAO.getProductInfo(product_id);
		
		System.out.println(sellProduct.toString());
		
		
		
		String sellMember_id= sellProduct.getMember_id();

		
//		System.out.println(sellMember_id);
		//판매횟수 증가 메소드
		memberDAO.sellUpdate(sellMember_id); // 판매자 ID 넘겨줌
		

		


		return "/WEB-INF/views/index.jsp";
	}


	

}
