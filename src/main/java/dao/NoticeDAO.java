package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.NoticeDTO;

public class NoticeDAO {

	public List<NoticeDTO> selectAll(Connection conn) throws SQLException {
		String sql = "SELECT * FROM Notice WHERE notice_type = '일반' ORDER BY notice_date DESC";
		ResultSet rs = null;
		PreparedStatement pstmt = conn.prepareStatement(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<NoticeDTO> noticeList = new ArrayList<>();
			while (rs.next()) {
				NoticeDTO notice = new NoticeDTO();
				notice.setNotice_id(rs.getInt("notice_id"));
				notice.setAdmin_id(rs.getInt("admin_id"));
				notice.setNotice_title(rs.getString("notice_title"));
				notice.setNotice_content(rs.getString("notice_content"));
				notice.setNotice_date(rs.getDate("notice_date"));
				notice.setNotice_type(rs.getString("notice_type"));

				noticeList.add(notice);
			}
			return noticeList;
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// 예외 처리
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// 예외 처리
				}
			}
		}
	}

	public List<NoticeDTO> selectPolicy(Connection conn) throws SQLException {
		ResultSet rs = null;
		String sql = "SELECT * FROM Notice where notice_type = '정책변경' ORDER BY notice_date DESC";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<NoticeDTO> noticeList = new ArrayList<>();
			while (rs.next()) {
				NoticeDTO notice = new NoticeDTO();
				notice.setNotice_id(rs.getInt("notice_id"));
				notice.setAdmin_id(rs.getInt("admin_id"));
				notice.setNotice_title(rs.getString("notice_title"));
				notice.setNotice_content(rs.getString("notice_content"));
				notice.setNotice_date(rs.getDate("notice_date"));
				notice.setNotice_type(rs.getString("notice_type"));

				noticeList.add(notice);
			}
			return noticeList;
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// 예외 처리
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// 예외 처리
				}
			}
		}
	}

	public List<NoticeDTO> selectPrevent(Connection conn) throws SQLException {
		ResultSet rs = null;
		String sql = "SELECT * FROM Notice where notice_type = '사기예방' ORDER BY notice_date DESC";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<NoticeDTO> noticeList = new ArrayList<>();
			while (rs.next()) {
				NoticeDTO notice = new NoticeDTO();
				notice.setNotice_id(rs.getInt("notice_id"));
				notice.setAdmin_id(rs.getInt("admin_id"));
				notice.setNotice_title(rs.getString("notice_title"));
				notice.setNotice_content(rs.getString("notice_content"));
				notice.setNotice_date(rs.getDate("notice_date"));
				notice.setNotice_type(rs.getString("notice_type"));

				noticeList.add(notice);
			}
			return noticeList;
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// 예외 처리
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// 예외 처리
				}
			}
		}
	}

	public NoticeDTO selectById(Connection conn, int noticeId) throws SQLException {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement("SELECT * FROM Notice WHERE notice_id = ?");
			pstmt.setInt(1, noticeId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				NoticeDTO notice = new NoticeDTO();
				notice.setNotice_id(rs.getInt("notice_id"));
				notice.setAdmin_id(rs.getInt("admin_id"));
				notice.setNotice_title(rs.getString("notice_title"));
				notice.setNotice_content(rs.getString("notice_content"));
				notice.setNotice_date(rs.getDate("notice_date"));
				notice.setNotice_type(rs.getString("notice_type"));

				return notice;
			}
			return null;
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// 예외 처리
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// 예외 처리
				}
			}
		}
	}
}