package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dao.ProductDAO;
import dto.MemberDTO;
import dto.ProductDTO;

public class PaymentHandler implements CommandHandler {


	private ProductDAO productDAO;
	private MemberDAO memberDAO;
	public PaymentHandler() {
		productDAO = new ProductDAO();
		memberDAO = new MemberDAO();
	}







	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession();
		String data = (String) session.getAttribute("member_id");
		String member_id = data;
		int product_id = Integer.parseInt(req.getParameter("product_id"));	

		ProductDTO product = productDAO.getProductInfo(product_id);
		MemberDTO member = memberDAO.getMemberInfo(member_id);

		System.out.println(member.toString());
		System.out.println(product.toString());
		req.setAttribute("member", member); // 로그인한 회원 정보
		req.setAttribute("product", product); /// 선택한 상품 정보


		if(member_id == null) {
			return "login.jsp";
		}else {

		}
		return "/WEB-INF/views/goods_payment.jsp";




	}



}














