package command;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.MemberDAO;
import dao.ProductDAO;
import dto.ProductDTO;

public class RegisterHandler implements CommandHandler {
    private MemberDAO memberDAO;
    private ProductDAO productDAO;
    private ServletContext context;

    public RegisterHandler() {
        memberDAO = new MemberDAO();
        productDAO = new ProductDAO();
    }

    public RegisterHandler(ServletContext context) {
        memberDAO = new MemberDAO();
        productDAO = new ProductDAO();
        this.context = context;
    }

    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
    	
    	String member_id   ;
    	HttpSession session = req.getSession();
		String data = (String) session.getAttribute("member_id");
		
		member_id = data;
    	
    	
		ArrayList<ProductDTO> loveProduct = memberDAO.getLoveListForMember(member_id);
		Enumeration<String> parameterNames = req.getParameterNames();
		List<String> parameterValues = new ArrayList<>();

		while (parameterNames.hasMoreElements()) {
			String paramName = parameterNames.nextElement();
			String paramValue = req.getParameter(paramName);
			parameterValues.add(paramValue);
		}

		String [] parameterArray = parameterValues.toArray(new String[0]);
		System.out.println(Arrays.toString(parameterArray));

			if(parameterArray.length!=0) {
				 productDAO.createProduct(parameterArray);
			}
			
			int product_id = productDAO.getProductID();  // 생성된 상품 아이디
			
	
			System.out.println("생성된 상품아이디값" + product_id);
					
			System.out.println("호출됨");
			req.setAttribute("member_id", req.getParameter("member_id"));
			req.setAttribute("loveProduct", loveProduct);
			
			return "goods_product_detail.do?product_id=" + product_id; 
	
		}
	}
