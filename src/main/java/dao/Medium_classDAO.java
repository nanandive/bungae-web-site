package dao;

import dto.Medium_classDTO;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

public class Medium_classDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public List<Medium_classDTO> getAllMediumClasses() throws NamingException {
		List<Medium_classDTO> mediumClasses = new ArrayList<>();
		String sql = "SELECT medium_id, medium_name FROM medium_class ORDER BY medium_id";

		try {
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int medium_id = rs.getInt("medium_id");
				String medium_name = rs.getString("medium_name");

				Medium_classDTO mediumClass = new Medium_classDTO(medium_id, medium_name);
				mediumClasses.add(mediumClass);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(conn);
		}

		return mediumClasses;
	}
}
