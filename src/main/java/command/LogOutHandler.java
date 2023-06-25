package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;
public class LogOutHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		 HttpSession session = req.getSession(false); 
		 
		 System.out.println("넘어옴");
		 boolean result = false; //
		 if(session != null) {
			 session.invalidate(); //세션값 초기화
			 System.out.println("세션 삭제완료!");
			 result = true;
		 } 
		 
		return null;
		
	}

}