package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import net.sf.json.JSONObject;

public class LoginHandler implements CommandHandler {


	private MemberDAO memberDAO;
	public LoginHandler() {

		memberDAO = new MemberDAO();
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {

		// 아이디 비번 넘어오는 거 체크 
		//		System.out.println(req.getParameter("member_id"));
		//		System.out.println(req.getParameter("pwd"));

		//회원아이디를 가져옴
		String member_id = req.getParameter("member_id");
		String tel = req.getParameter("pwd");

		//회원아이디와 비밀번호를 호출하여 확인
		String check_id = memberDAO.loginMember(member_id, tel);

		
		boolean result = false;

		//회원아이디랑 내가 제출한 값이 같으면
		if (member_id.equals(check_id)) {
		    HttpSession session = req.getSession();
		    //세션에 회원 아이디를 저장함.
		    session.setAttribute("member_id", member_id);
		    result = true;
		}



		JSONObject json = new JSONObject();
		json.put("result", result);

		//생성된 json 객체를 문자열로 반환시킴
		//		String member_id = "홍찬기";
		return json.toString();

		//		System.out.println(req.getParameter("member_id"));





	}





}
