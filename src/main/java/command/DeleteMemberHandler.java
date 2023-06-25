package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;

public class DeleteMemberHandler implements CommandHandler {
    private MemberDAO memberDAO;

    public DeleteMemberHandler() {
        memberDAO = new MemberDAO();
    }

    @Override
    public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
        HttpSession session = req.getSession();
        String member_id = (String) session.getAttribute("member_id");

        if (member_id == null) {
            // 로그인되어 있지 않은 상태로 접근한 경우 처리
            // 예를 들어 로그인 페이지로 이동하거나 오류 메시지를 표시할 수 있습니다.
            return "redirect:/login";
        }

        boolean success = memberDAO.deleteMember(member_id);

        if (success) {
            // 회원 탈퇴 성공한 경우 세션을 무효화하고 로그인 페이지로 이동시킵니다.
            session.invalidate();
            return "index.do";
        } else {
            // 회원 탈퇴 실패한 경우 처리
            // 예를 들어 오류 메시지를 표시하거나 이전 페이지로 이동시킬 수 있습니다.
            return "login.jsp";
        }
    }
}

