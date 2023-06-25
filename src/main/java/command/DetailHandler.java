package command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dao.ProductDAO;
import dao.ReviewDAO;
import dao.Medium_classDAO;
import dao.Large_classDAO;
import dto.Large_classDTO;
import dto.Medium_classDTO;
import dto.MemberDTO;
import dto.ProductDTO;
import dto.ReviewDTO;
import java.util.List;


public class DetailHandler implements CommandHandler {

	private ProductDAO productDAO;
	
	private MemberDAO memberDAO;
	
	private ReviewDAO reviewDAO;
	
	private Large_classDAO Large_classDAO;
	private Medium_classDAO Medium_classDAO;

	public DetailHandler() {
		productDAO = new ProductDAO();
		memberDAO = new MemberDAO();
		reviewDAO = new ReviewDAO();
		Large_classDAO = new Large_classDAO();
	      Medium_classDAO = new Medium_classDAO();
	}



	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {

		HttpSession session = req.getSession();
		String user = (String) session.getAttribute("member_id");

		String key = user + "_" +   req.getParameter("product_id");

		System.out.println("구매자 아이디 " + user);
		System.out.println(key);
		//전달된 상품 아이디를 가져옴
		System.out.println("판매상품아아디 : " + req.getParameter("product_id"));
		//전달된 회원 아이디를 가져옴
		System.out.println("판매자멤버아아디 : " + req.getParameter("member_id"));

		// 상품아이디 넘어왔는지 확인
		int product_id = Integer.parseInt( req.getParameter("product_id")) ;
		String member_id = req.getParameter("member_id");
		
		 if (session.getAttribute(key) == null) {
	            // 조회수 증가 로직 적용
	            productDAO.increaseViews(product_id);

	            // 세션에 조회 기록 저장
	            session.setAttribute(key, true);
	        }

		//상품의 상세 정보를 가져옴
		ProductDTO list = productDAO.getdetailProduct(product_id, member_id);
		
		MemberDTO sell_member = memberDAO.getMemberInfo(member_id); // 판매자 상점 정보
		
		ArrayList<ProductDTO> sell_list = productDAO.getMyShopProductList(member_id);  // 판매자 상점 목록 메소드
		
		// 판매자 팔로우 수 
		int sell_count = memberDAO.getFollowersCount(member_id);
		
		
		
		// 디테일 화면 갈 때 찍을 상품찜개수
		
		int love_count = productDAO.getLoveCount(product_id); // 상품찜개수
		boolean lovecheck = productDAO.getLoveCheck(user , product_id); // 로그인한 사람이 판매 상품 찜 했는지 여부 
		
		boolean followcheck = memberDAO.getFollowCheck(member_id, user); // 로그인한 사람이 판매자를 팔로잉 하는 지 여부 체크 
		
		System.out.println(lovecheck);
		
		/* System.out.println(list.getView_count()); */
		
		
		//여기서 부터 내가 코딩(6/16)
		ArrayList<ReviewDTO> reviewList = reviewDAO.getMyReviewListForMember(member_id);
		req.setAttribute("reviewList", reviewList);
		System.out.println("후기입니다.");
		System.out.println(reviewList.toString());
		
		int reviewListLength = reviewList.size();

		

		ArrayList<ProductDTO> loveProduct = memberDAO.getLoveListForMember(user);
		req.setAttribute("loveProduct", loveProduct);
		
		//list 변수에 접근할 수 있도록 설정한다.
		req.setAttribute("list", list);
		
		
		
		System.out.println("팔로잉 여부 : "+ followcheck);
		
		/* System.out.println("판매상품정보 : " + list.toString()); */
		System.out.println("판매자상점정보 : " + sell_member.toString());

		// 카테고리
		List<Large_classDTO> largeClasses = Large_classDAO.getAllLargeClasses();
		List<Medium_classDTO> mediumClasses = Medium_classDAO.getAllMediumClasses();
		
		
		
		// 로그인 상태인지 확인
		//HttpSession session = req.getSession(false);
		boolean isLoggedIn = session != null && session.getAttribute("member_id") != null;

		req.setAttribute("largeClasses", largeClasses);
		req.setAttribute("mediumClasses", mediumClasses);
		req.setAttribute("member_id", member_id); //판매자 아이디 
		req.setAttribute("product_id", product_id); // 판매 상품 아이디
		req.setAttribute("reviewListLength", reviewListLength);//후기
		req.setAttribute("sell_member", sell_member); // 판매자 
		req.setAttribute("sell_list", sell_list); // 판매자
		req.setAttribute("sell_count", sell_count); // 판매자 팔로우 수
		req.setAttribute("love_count", love_count); // 상품 찜 개수 
		req.setAttribute("lovecheck", lovecheck); //찜여부
		req.setAttribute("followcheck",followcheck ); //팔로우여부
		// JSTL을 활용하여 로그인 상태에 따른 바로구매 링크를 처리
		req.setAttribute("isLoggedIn", isLoggedIn);
		req.setAttribute("product_id", product_id);
		req.setAttribute("member_id", member_id);
		
		

		

		return "/WEB-INF/views/goods_product_detail.jsp";
	}

}
