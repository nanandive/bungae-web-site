package command;

import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dao.ProductDAO;
import dao.StoreDAO;
import dto.ProductDTO;
import dto.StoreDTO;


public class ManageHandler implements CommandHandler {

	private StoreDAO StoreDAO;
	private ProductDAO productDAO;
	 private MemberDAO memberDAO;

	public ManageHandler() {
		try {
			StoreDAO = new StoreDAO();
			productDAO = new ProductDAO();
			memberDAO = new MemberDAO();
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String member_id = null;
	    // 1. Get the parameter value
	    //String id = "상점2";
		
		HttpSession session = req.getSession();
		String data = (String) session.getAttribute("member_id");
		
		member_id = data;

	    // 2. Retrieve the product based on the parameter value
	    List<StoreDTO> stores = StoreDAO.getProductOne(member_id);

	    // 3. Get the love count for each product
	    List<Integer> loveCounts = new ArrayList<>();

	    for (StoreDTO store : stores) {
	        int productId = store.getProduct_id();
	        int loveCount = StoreDAO.getLoveCount(productId);
	        loveCounts.add(loveCount);
	    }
	    
	    ArrayList<ProductDTO> loveProduct = memberDAO.getLoveListForMember(member_id);

	    // 4. Set the attributes for passing the values to the view
	    req.setAttribute("stores", stores);
	    req.setAttribute("loveCounts", loveCounts);
	    req.setAttribute("loveProduct", loveProduct);

	    System.out.println(stores.toString());
	    return "/WEB-INF/views/market_manage.jsp";
	}
}