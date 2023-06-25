package command;

import java.util.List;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.InquiryDAO;
import dto.InquiryDTO;
import command.CommandHandler;

public class InquiryAnswerHandler implements CommandHandler{

	private InquiryDAO inquiryDAO;


	public InquiryAnswerHandler() throws NamingException {
		inquiryDAO = new InquiryDAO();
	}


	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		int id = Integer.parseInt(req.getParameter("id"));

		List<InquiryDTO> selectinquiry = inquiryDAO.Inquires(id);

		req.setAttribute("selectinquiry", selectinquiry);

		System.out.println(selectinquiry.toString());

		return "/WEB-INF/views/inquiry_answer.jsp";
	}

}
