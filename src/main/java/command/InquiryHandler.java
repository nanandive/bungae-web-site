package command;

import java.util.List;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.InquiryDAO;
import dto.InquiryDTO;
import command.CommandHandler;

public class InquiryHandler implements CommandHandler {
	

	private InquiryDAO inquiryDAO;


	public InquiryHandler() throws NamingException {
	    inquiryDAO = new InquiryDAO();
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
	    List<InquiryDTO> inquiryone = inquiryDAO.getAllInquiries();
	    
	    req.setAttribute("inquiryone", inquiryone);
	    
	    System.out.println(inquiryone.toString());
	    
	    return "/WEB-INF/views/customer_inquiry.jsp";
	}


}
