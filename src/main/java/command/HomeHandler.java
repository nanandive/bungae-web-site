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
import dao.Small_classDAO;
import dto.Large_classDTO;
import dto.Medium_classDTO;
import dto.ProductDTO;
import dto.Small_classDTO;


public class HomeHandler implements CommandHandler {
   private ProductDAO productDAO;
      private Large_classDAO Large_classDAO;
      private Medium_classDAO Medium_classDAO;
      private Small_classDAO Small_classDAO;
      private MemberDAO memberDAO;
     

   
   public HomeHandler() {
         productDAO = new ProductDAO();
         Large_classDAO = new Large_classDAO();
         Medium_classDAO = new Medium_classDAO();
         Small_classDAO = new Small_classDAO();
         memberDAO = new MemberDAO();


   }

    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
    	String member_id   ; 
    	
    	//TODO: HomeHandler의 처리 로직을 구현하세요.
        // 예시: 필요한 데이터를 설정하고, 어떤 JSP를 표시할지 결정합니다.
        
    	
    	HttpSession session = req.getSession();
		String data = (String) session.getAttribute("member_id");
		
		member_id = data;
    	
    	
		ArrayList<ProductDTO> loveProduct = memberDAO.getLoveListForMember(member_id);
    	
        // 데이터 설정 예시
      
       
        List<ProductDTO> allProducts = productDAO.getAllProductList();
        List<Large_classDTO> largeClasses = Large_classDAO.getAllLargeClasses();
        List<Medium_classDTO> mediumClasses = Medium_classDAO.getAllMediumClasses();
        List<Small_classDTO> smallClasses = Small_classDAO.getAllSmallClasses();

        // 2. Set the attribute for passing the values to the view
        req.setAttribute("allProducts", allProducts);
        req.setAttribute("largeClasses", largeClasses);
        req.setAttribute("mediumClasses", mediumClasses);
        req.setAttribute("smallClasses", smallClasses);
        req.setAttribute("loveProduct", loveProduct);

       System.out.println("홈화면 이동 성공");
        // JSP를 표시할 경로를 반환합니다.
        return "/WEB-INF/views/index.jsp";
    }

}