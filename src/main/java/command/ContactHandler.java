package command;

import java.util.Date;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.InquiryDAO;
import dto.InquiryDTO;
import command.CommandHandler;

public class ContactHandler implements CommandHandler {

	private InquiryDAO inquiryDAO;


	public ContactHandler() throws NamingException {

		inquiryDAO = new InquiryDAO();
	}


	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {

		// contact.jsp에서 입력한 값들을 변수에 저장 
		String type =req.getParameter("type"); 
		String inquiry_ct = req.getParameter("inquiry_ct"); 
		String detail_type = req.getParameter("detail_type");

		// 콘솔 창에 찍어보기
		System.out.println(type+inquiry_ct+detail_type);
		//System.out.println(inquiry_ct);
		//System.out.println(detail_type);

		// 변수에 저장한 값들 dao에 있는 insertInquiry 메서드 매개변수로 값으로 주기 
		inquiryDAO.insertInquiry(type, inquiry_ct, detail_type);

		//return "/customer_service.jsp";
		return "/WEB-INF/views/customer_service.jsp";
		
	}
}
