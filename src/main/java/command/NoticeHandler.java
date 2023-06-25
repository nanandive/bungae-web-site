package command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.NoticeDTO;
import command.CommandHandler;
import service.ListNoticeService;
import service.NoticeDetailService;

public class NoticeHandler implements CommandHandler {
	private ListNoticeService listNoticeService = new ListNoticeService();
	private NoticeDetailService noticeDetailService = new NoticeDetailService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String noticeIdParam = request.getParameter("id");

		if (noticeIdParam == null) {
			List<NoticeDTO> noticeList = listNoticeService.getAllNotices();
			List<NoticeDTO> policyList = listNoticeService.selectPolicy();
			List<NoticeDTO> preventList = listNoticeService.selectPrevent();
			request.setAttribute("noticeList", noticeList);
			System.out.println(noticeList.toString());
			request.setAttribute("policyList", policyList);
			request.setAttribute("preventList", preventList);
			return "/WEB-INF/views/customer_notice.jsp";
		} else {
			int noticeId = Integer.parseInt(noticeIdParam);
			NoticeDTO noticeDetail = noticeDetailService.getNoticeDetail(noticeId);
			request.setAttribute("noticeDetail", noticeDetail);

			return "/WEB-INF/views/customer_notice_detail.jsp";
		}
	}
}