package service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import dao.FrequentlyDAO;
import dto.FrequentlyDTO;
import jdbc.connection.ConnectionProvider;

public class FrequentlyDetailService {

    private FrequentlyDAO frequentlyDao = new FrequentlyDAO();

    public FrequentlyDTO getFrequentlyDetail(int freqId) {
        try (Connection conn = ConnectionProvider.getConnection()) {
            return frequentlyDao.selectById(conn, freqId);
        } catch (SQLException | NamingException e) {
            throw new RuntimeException(e);
        }
    }
}