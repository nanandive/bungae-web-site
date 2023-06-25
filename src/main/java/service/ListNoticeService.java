package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import dao.NoticeDAO;
import dto.NoticeDTO;
import jdbc.connection.ConnectionProvider;

public class ListNoticeService {

	private NoticeDAO noticeDao = new NoticeDAO();

	public List<NoticeDTO> getAllNotices() {
		try (Connection conn = ConnectionProvider.getConnection()) {
			return noticeDao.selectAll(conn);
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		}
	}

	public List<NoticeDTO> getNoticeList() {
		return getAllNotices();
	}

	public List<NoticeDTO> selectPolicy() {
		try (Connection conn = ConnectionProvider.getConnection()) {
			return noticeDao.selectPolicy(conn);
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		}
	}

	public List<NoticeDTO> selectPrevent() {
		try (Connection conn = ConnectionProvider.getConnection()) {
			return noticeDao.selectPrevent(conn);
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		}
	}
}