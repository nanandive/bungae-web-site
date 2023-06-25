package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import dto.Large_classDTO;
import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;

public class Large_classDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public List<Large_classDTO> getAllLargeClasses() throws NamingException {
        List<Large_classDTO> largeClasses = new ArrayList<>();
        String sql = "SELECT large_id, large_name FROM large_class ORDER BY large_id";

        try {
            conn = ConnectionProvider.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int large_id = rs.getInt("large_id");
                String large_name = rs.getString("large_name");

                Large_classDTO largeClass = new Large_classDTO(large_id, large_name);
                largeClasses.add(largeClass);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
            JdbcUtil.close(conn);
        }

        return largeClasses;
    }
}
