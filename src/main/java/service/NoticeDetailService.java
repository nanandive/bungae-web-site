package service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import dao.NoticeDAO;
import dto.NoticeDTO;
import jdbc.connection.ConnectionProvider;

public class NoticeDetailService {

	private NoticeDAO noticeDao = new NoticeDAO();

	public NoticeDTO getNoticeDetail(int noticeId) {
		try (Connection conn = ConnectionProvider.getConnection()) {
			return noticeDao.selectById(conn, noticeId);
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		}
	}
}