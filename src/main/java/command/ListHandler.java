package command;

import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dao.ProductDAO;
import dto.ProductDTO;
import dao.Medium_classDAO;
import dao.Large_classDAO;
import dto.Large_classDTO;
import dto.Medium_classDTO;
import java.util.List;

public class ListHandler implements CommandHandler{

	private ProductDAO productDAO;
	private MemberDAO memberDAO;
	private Large_classDAO Large_classDAO;
	private Medium_classDAO Medium_classDAO;
	
	public ListHandler() {
		productDAO = new ProductDAO();
		memberDAO = new MemberDAO();
		Large_classDAO = new Large_classDAO();
	      Medium_classDAO = new Medium_classDAO();
	}



	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ArrayList<ProductDTO> list= null;
		String member_id   ; 

		HttpSession session = req.getSession();
		String data = (String) session.getAttribute("member_id");
		
		member_id = data;
    	
    	
		ArrayList<ProductDTO> loveProduct = memberDAO.getLoveListForMember(member_id);
		
		String small_id = req.getParameter("small_id");
		String medium_id =req.getParameter("medium_id");
		String large_id = req.getParameter("large_id");

		ArrayList check = new ArrayList();

		if(large_id != null) {
			check.add(large_id);
		}

		if(medium_id != null) {
			check.add(medium_id);
		}

		if(small_id != null) {
			check.add(small_id);
		}


		if( check.size() == 1) { 
			// System.out.println("1");
			// 대분류만 선택하는 경우 

			list = productDAO.getOneCategoryProductList( Integer.parseInt(large_id));

		} else if ( check.size() == 2){
			// System.out.println("2");
			// 대분류 =? 중분류 =? 까지 선택하는 경우
			list = productDAO.getTwoCategoryProductList( Integer.parseInt(large_id),
					Integer.parseInt(medium_id));
				
		} else {
			// System.out.println("3");
			// 대분류 =? 중분류 =? 소분류 = ? 선택하는 경우
			list = productDAO.getThreeCategoryProductList( Integer.parseInt(large_id),
					Integer.parseInt(medium_id),
					Integer.parseInt(small_id)

					);

		} 

		// 카테고리
	      List<Large_classDTO> largeClasses = Large_classDAO.getAllLargeClasses();
	      List<Medium_classDTO> mediumClasses = Medium_classDAO.getAllMediumClasses();
	      req.setAttribute("largeClasses", largeClasses);
	      req.setAttribute("mediumClasses", mediumClasses);
	      req.setAttribute("list", list);
	      req.setAttribute("loveProduct", loveProduct);

		return "/WEB-INF/views/market_category_list.jsp";
	}

}
