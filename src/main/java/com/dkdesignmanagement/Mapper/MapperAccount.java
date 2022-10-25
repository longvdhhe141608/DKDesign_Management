package com.dkdesignmanagement.Mapper;

import com.dkdesignmanagement.Entity.Account;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MapperAccount implements RowMapper<Account> {
    @Override
    public Account mapRow(ResultSet rs, int rowNum) throws SQLException {
        Account account = new Account();
        account.setIdAcc(rs.getInt("idAcc"));
        account.setAccName(rs.getString("Username"));
        account.setAccPass(rs.getString("Password"));
        account.setRoleInWeb(rs.getInt(4));
        account.setAccStatus(rs.getBoolean(5));
        return account;
    }
}
