package dao;

import dto.Small_classDTO;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

public class Small_classDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public List<Small_classDTO> getAllSmallClasses() throws NamingException {
		List<Small_classDTO> smallClasses = new ArrayList<>();
		String sql = "SELECT small_id, small_name FROM small_class ORDER BY small_id";

		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int small_id = rs.getInt("small_id");
				String small_name = rs.getString("small_name");

				Small_classDTO smallClass = new Small_classDTO(small_id, small_name);
				smallClasses.add(smallClass);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}

		return smallClasses;
	}
}
