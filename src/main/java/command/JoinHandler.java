package command;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.MemberDAO;
import dao.ProductDAO;





public class JoinHandler implements CommandHandler {

	private MemberDAO memberDAO;
	private ProductDAO productDAO;


	public JoinHandler() {
		memberDAO = new MemberDAO();
		productDAO = new ProductDAO();
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		
		
		
		
		
		
		
		Enumeration<String> parameterNames = req.getParameterNames();
		List<String> parameterValues = new ArrayList<>();

		while (parameterNames.hasMoreElements()) {
		    String paramName = parameterNames.nextElement();
		    String paramValue = req.getParameter(paramName);
		    if (paramValue != null) {
		        parameterValues.add(paramValue);
		    }
		}

		String[] parameterArray = parameterValues.toArray(new String[0]);

		System.out.println(Arrays.toString(parameterArray));

		memberDAO.insertMember(parameterArray);

//		if(parameterArray.length!=0) {
//
//	
//		}
		
		
		// 회원가입 성공 알림창 띄우기(6/15추가)
        //req.setAttribute("message", "회원가입이 성공적으로 완료되었습니다.");
		
		return "login.jsp"; 

	}
}
