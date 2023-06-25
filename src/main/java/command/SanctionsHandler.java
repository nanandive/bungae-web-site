package command;

import java.util.List;

import javax.naming.NamingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import dao.ProductDAO;
import dto.MemberDTO;
import command.CommandHandler;

public class SanctionsHandler implements CommandHandler{

	private MemberDAO memberDAO;

	public SanctionsHandler() throws NamingException {
		memberDAO = new MemberDAO();
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession();
		String data = (String) session.getAttribute("member_id");
		
		String member_id = data;
		
		List<MemberDTO> allmembers = memberDAO.getAllMember(member_id);
		
		req.setAttribute("allmembers", allmembers);
		
		System.out.println(allmembers.toString());

		return "/WEB-INF/views/customer_sanctions_details.jsp";
	}

}
