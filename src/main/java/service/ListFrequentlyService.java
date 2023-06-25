package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import dao.FrequentlyDAO;
import dto.FrequentlyDTO;
import jdbc.connection.ConnectionProvider;

public class ListFrequentlyService {
	
    private FrequentlyDAO frequentlyDao = new FrequentlyDAO();
    
    public List<FrequentlyDTO> getAllFrequentlyAsked() {
        try (Connection conn = ConnectionProvider.getConnection()) {
            return frequentlyDao.selectAll(conn);
        } catch (SQLException | NamingException e) {
            throw new RuntimeException(e);
        }
    }
    
    public List<FrequentlyDTO> getFrequentlyAskedList() {
        return getAllFrequentlyAsked();
    }

	public List<FrequentlyDTO> selectPolicy() {
	    try (Connection conn = ConnectionProvider.getConnection()) {
            return frequentlyDao.selectPolicy(conn);
        } catch (SQLException | NamingException e) {
            throw new RuntimeException(e);
        }
}

	public List<FrequentlyDTO> selectSafety() {
		   try (Connection conn = ConnectionProvider.getConnection()) {
	            return frequentlyDao.selectSafety(conn);
	        } catch (SQLException | NamingException e) {
	            throw new RuntimeException(e);
	        }
}
	public List<FrequentlyDTO> selectCare() {
		try (Connection conn = ConnectionProvider.getConnection()) {
			return frequentlyDao.selectCare(conn);
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		}
	}
	public List<FrequentlyDTO>selectAd() {
		try (Connection conn = ConnectionProvider.getConnection()) {
			return frequentlyDao.selectAd(conn);
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		}
	}
	public List<FrequentlyDTO>selectEtc() {
		try (Connection conn = ConnectionProvider.getConnection()) {
			return frequentlyDao.selectEtc(conn);
		} catch (SQLException | NamingException e) {
			throw new RuntimeException(e);
		}
	}
}