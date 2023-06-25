package command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Large_classDAO;
import dao.Medium_classDAO;
import dao.MemberDAO;
import dao.ProductDAO;
import dao.ReviewDAO;
import dto.Large_classDTO;
import dto.Medium_classDTO;
import dto.MemberDTO;
import dto.ProductDTO;
import dto.ReviewDTO;

public class MyStoreHandler implements CommandHandler {

   private MemberDAO memberDAO;
   private ProductDAO productDAO;
   private ReviewDAO reviewDAO;
   private Large_classDAO Large_classDAO;
   private Medium_classDAO Medium_classDAO;


   public MyStoreHandler() {
      memberDAO = new MemberDAO();
      productDAO = new ProductDAO();
      reviewDAO = new ReviewDAO();
      Large_classDAO = new Large_classDAO();
      Medium_classDAO = new Medium_classDAO();
   }

   @Override
   public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
      String member_id   ;

      if(req.getParameter("sell_id") !=  null) {
         String sell_id =req.getParameter("sell_id"); // 판매자 아이디  
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

         //등록한 상품 목록 
         ArrayList<ProductDTO> list = productDAO.getMyShopProductList(sell_id);
         req.setAttribute("list", list);
         System.out.println(list.toString());
         MemberDTO myData = memberDAO.getMemberInfo(sell_id);
         System.out.println(myData.toString());

         //상점후기
         ArrayList<ReviewDTO> reviewList = reviewDAO.getMyReviewListForMember(sell_id);
         req.setAttribute("reviewList", reviewList);
         System.out.println(reviewList.toString());

         // 찜 목록
         // getmember_id 가져오고 매개변수로 던져줘서 해당 아이디가 가진 목록 가져와서 객체에 담자    
         ArrayList<ProductDTO> loveProduct = memberDAO.getLoveListForMember(sell_id);

         // 사용자를 팔로우하는 수 
         int followCount = memberDAO.getFollowersCount(sell_id);

         // 사용자가 팔로잉 하는 수
         int followingCount = memberDAO.getFollowingCount(sell_id);
         
         //카테고리
         List<Large_classDTO> largeClasses = Large_classDAO.getAllLargeClasses();
         List<Medium_classDTO> mediumClasses = Medium_classDAO.getAllMediumClasses();
         req.setAttribute("largeClasses", largeClasses);
         req.setAttribute("mediumClasses", mediumClasses);
         req.setAttribute("followCount", followCount);
         req.setAttribute("loveProduct", loveProduct); 
         req.setAttribute("myShop", myData); // 상점 정보를 요청 속성에 추가


         System.out.println("됨됨됨");
         return "/WEB-INF/views/market_my_store.jsp"; // 예시로 "market_my_store.jsp"라는 View 이름을 반환합니다.
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


         //후기목록리스트
         ArrayList<ReviewDTO> reviewList = reviewDAO.getMyReviewListForMember(member_id);
         req.setAttribute("reviewList", reviewList);
         System.out.println("후기입니다.");
         System.out.println(reviewList.toString());
         
         
         
         //여기까지 오늘 코딩(6/16)

         // 찜 목록
         // getmember_id 가져오고 매개변수로 던져줘서 해당 아이디가 가진 목록 가져와서 객체에 담자    
         ArrayList<ProductDTO> loveProduct = memberDAO.getLoveListForMember(member_id);

         
         

         //      System.out.println(loveProduct.toString()); 


         // 사용자를 팔로우하는 수 
         int followCount = memberDAO.getFollowersCount(member_id);
         
         // 사용자를 팔로잉 하는 수
         int followingCount = memberDAO.getFollowingCount(member_id);


         // 사용자가 팔로잉 하는 목록 조회
         req.setAttribute("followCount", followCount);
         req.setAttribute("followingCount", followingCount);
         req.setAttribute("loveProduct", loveProduct); 
         req.setAttribute("myShop", myData); // 상점 정보를 요청 속성에 추가
         
         //카테고리
         List<Large_classDTO> largeClasses = Large_classDAO.getAllLargeClasses();
         List<Medium_classDTO> mediumClasses = Medium_classDAO.getAllMediumClasses();
         req.setAttribute("largeClasses", largeClasses);
         req.setAttribute("mediumClasses", mediumClasses);


         System.out.println("됨됨됨");
         return "/WEB-INF/views/market_my_store.jsp"; // 예시로 "market_my_store.jsp"라는 View 이름을 반환합니다.
      }






   }


}