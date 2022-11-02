package DkDesignManagement.Mapper;

import DkDesignManagement.Entity.Account;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MapperAccount implements RowMapper<Account> {
    @Override
    public Account mapRow(ResultSet resultSet, int i) throws SQLException {
        Account a = new Account();
        a.setId(resultSet.getInt("id"));
        a.setUsername(resultSet.getString("username"));
        a.setPassword(resultSet.getString("password"));
        a.setRole_id(resultSet.getInt("role_id"));
        a.setStatus(resultSet.getInt("status"));
        return a;
    }
}