package DkDesignManagement.Mapper;

import DkDesignManagement.Entity.Account;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MapperAccount implements RowMapper<Account> {
    @Override
    public Account mapRow(ResultSet resultSet, int i) throws SQLException {
        Account account = new Account();
        account.setId(resultSet.getInt("id"));
        account.setUsername(resultSet.getString("username"));
        account.setPassword(resultSet.getString("password"));
        account.setRole_id(resultSet.getInt("role_id"));
        account.setStatus(resultSet.getInt("status"));
        account.setAvatar_url(resultSet.getString("avatar_url"));
        return account;
    }
}