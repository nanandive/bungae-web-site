package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.FrequentlyDTO;
import dto.NoticeDTO;
import jdbc.connection.ConnectionProvider;

public class FrequentlyDAO {
	public List<FrequentlyDTO> selectAll(Connection conn) throws SQLException {
	    ResultSet rs = null;
	    String sql = "SELECT * FROM Frequently_asked where freq_type = '회원/계정'";
	    PreparedStatement pstmt = conn.prepareStatement(sql);
	    try {
	        pstmt = conn.prepareStatement(sql);
	        rs = pstmt.executeQuery();
	        List<FrequentlyDTO> askedList = new ArrayList<>();
	        while (rs.next()) {
	            FrequentlyDTO frequently = new FrequentlyDTO();
	            frequently.setFreq_id(rs.getInt("freq_id"));
	            frequently.setFreq_type(rs.getString("freq_type"));
	            frequently.setFreq_title(rs.getString("freq_title"));
	            frequently.setFreq_content(rs.getString("freq_content"));
	            
	            askedList.add(frequently);
	        }
	        
	        return askedList;
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
	
	public List<FrequentlyDTO> selectPolicy(Connection conn) throws SQLException {
	    ResultSet rs = null;
	    String sql = "SELECT * FROM Frequently_asked where freq_type = '거래분쟁/운영정책'";
	    PreparedStatement pstmt = conn.prepareStatement(sql);
	    try {
	        pstmt = conn.prepareStatement(sql);
	        rs = pstmt.executeQuery();
	        List<FrequentlyDTO> askedList = new ArrayList<>();
	        while (rs.next()) {
	            FrequentlyDTO frequently = new FrequentlyDTO();
	            frequently.setFreq_id(rs.getInt("freq_id"));
	            frequently.setFreq_type(rs.getString("freq_type"));
	            frequently.setFreq_title(rs.getString("freq_title"));
	            frequently.setFreq_content(rs.getString("freq_content"));
	            
	            askedList.add(frequently);
	        }
	        
	        return askedList;
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
	
	public List<FrequentlyDTO> selectSafety(Connection conn) throws SQLException {
		ResultSet rs = null;
		String sql = "SELECT * FROM Frequently_asked where freq_type = '번개페이 안전결제'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<FrequentlyDTO> askedList = new ArrayList<>();
			while (rs.next()) {
				FrequentlyDTO frequently = new FrequentlyDTO();
				frequently.setFreq_id(rs.getInt("freq_id"));
				frequently.setFreq_type(rs.getString("freq_type"));
				frequently.setFreq_title(rs.getString("freq_title"));
				frequently.setFreq_content(rs.getString("freq_content"));
				
				askedList.add(frequently);
			}
			
			return askedList;
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
	
	public List<FrequentlyDTO> selectCare(Connection conn) throws SQLException {
		ResultSet rs = null;
		String sql = "SELECT * FROM Frequently_asked where freq_type = '번개케어'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<FrequentlyDTO> askedList = new ArrayList<>();
			while (rs.next()) {
				FrequentlyDTO frequently = new FrequentlyDTO();
				frequently.setFreq_id(rs.getInt("freq_id"));
				frequently.setFreq_type(rs.getString("freq_type"));
				frequently.setFreq_title(rs.getString("freq_title"));
				frequently.setFreq_content(rs.getString("freq_content"));
				
				askedList.add(frequently);
			}
			
			return askedList;
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
	
	public List<FrequentlyDTO> selectAd(Connection conn) throws SQLException {
		ResultSet rs = null;
		String sql = "SELECT * FROM Frequently_asked where freq_type = '프로상점/판매광고' ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<FrequentlyDTO> askedList = new ArrayList<>();
			while (rs.next()) {
				FrequentlyDTO frequently = new FrequentlyDTO();
				frequently.setFreq_id(rs.getInt("freq_id"));
				frequently.setFreq_type(rs.getString("freq_type"));
				frequently.setFreq_title(rs.getString("freq_title"));
				frequently.setFreq_content(rs.getString("freq_content"));
				
				askedList.add(frequently);
			}
			
			return askedList;
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
	
	public List<FrequentlyDTO> selectEtc(Connection conn) throws SQLException {
		ResultSet rs = null;
		String sql = "SELECT * FROM Frequently_asked where freq_type = '기타 이용안내' ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<FrequentlyDTO> askedList = new ArrayList<>();
			while (rs.next()) {
				FrequentlyDTO frequently = new FrequentlyDTO();
				frequently.setFreq_id(rs.getInt("freq_id"));
				frequently.setFreq_type(rs.getString("freq_type"));
				frequently.setFreq_title(rs.getString("freq_title"));
				frequently.setFreq_content(rs.getString("freq_content"));
				
				askedList.add(frequently);
			}
			
			return askedList;
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

	  public FrequentlyDTO selectById(Connection conn, int freqId) throws SQLException {
	        ResultSet rs = null;
	        PreparedStatement pstmt = null;

	        try {
	        	pstmt = conn.prepareStatement( "SELECT * FROM Frequently_asked WHERE freq_id = ?");
	        	pstmt.setInt(1, freqId);
	            rs = pstmt.executeQuery();
	            if (rs.next()) {
	            	FrequentlyDTO frequently = new FrequentlyDTO();
	            	frequently.setFreq_id(rs.getInt("freq_id"));
	            	frequently.setFreq_type(rs.getString("freq_type"));
	                frequently.setFreq_title(rs.getString("freq_title"));
	            	frequently.setFreq_content(rs.getString("freq_content"));
	            	
	                return frequently;
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