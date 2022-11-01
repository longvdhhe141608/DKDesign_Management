package DkDesignManagement.Mapper;

import DkDesignManagement.Entity.Account;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MapperAccount implements RowMapper<Account> {
    @Override
    public Account mapRow(ResultSet resultSet, int i) throws SQLException {
        Account a = new Account();
        a.setIdAcc(resultSet.getInt("idAcc"));
        a.setNameAcc(resultSet.getString("Username"));
        a.setPassAcc(resultSet.getString("Password"));
        a.setRoleInWeb(resultSet.getInt("RoleInWebsite"));
        a.setStatus(resultSet.getInt("Status"));
        return a;
    }
}