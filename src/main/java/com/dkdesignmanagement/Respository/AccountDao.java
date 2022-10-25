package com.dkdesignmanagement.Respository;

import com.dkdesignmanagement.Entity.Account;
import com.dkdesignmanagement.Mapper.MapperAccount;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class AccountDao {
    @Autowired
    JdbcTemplate jdbcTemplate;

    public List<Account> getAll() {
        String sql = "SELECT * FROM `dkmanagement`.`accounts`";
        List<Account> list = new ArrayList<Account>();
        list = jdbcTemplate.query(sql, new MapperAccount());
        return list;
    }

    public Account getOne(String user) {
        String sql = "SELECT * FROM `dkmanagement`.`accounts` WHERE Username= ?";
        Account a = new Account();
        a = jdbcTemplate.queryForObject(sql, new MapperAccount(), user);
        return a;
    }
}
