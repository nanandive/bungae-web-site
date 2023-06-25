package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import net.sf.json.JSONObject;

public class IdCheckHandler implements CommandHandler {

	
	private MemberDAO memberDAO;
	public IdCheckHandler() {
	
		memberDAO = new MemberDAO();
	}
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		// id 넘어오는 거 체크
		
		String member_id =req.getParameter("member_id");
//		String member_id = "홍찬기";
		
//		System.out.println(req.getParameter("member_id"));
		
		
		
		
		boolean result = false;
		
		if ( memberDAO.getMemberInfo(member_id)  == null) {
			System.out.println("중복아이디 없음");
			
			result = true;
			// 아이디 사용가능  == true
			
		} else {
			System.out.println("중복아이디 있음");
		}
		
	
		
		
		
//		System.out.println("넘어옴"); 
		
		
	 
	    JSONObject json = new JSONObject();
	    json.put("result", result);  // { "result": "true"}

	    System.out.println( ">>>> " +  json.toString()  );
	    return json.toString();	
		
			
	}

	
	
	
	
}
