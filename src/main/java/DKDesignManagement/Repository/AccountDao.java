package DkDesignManagement.Repository;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Mapper.MapperAccount;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AccountDao {
    @Autowired
    JdbcTemplate jdbcTemplate;

    public Account getAccount(String user) {
        String sql = "Select * from `dkmanagement`.`accounts` where Username = ?";
        Account a = new Account();
        a = jdbcTemplate.queryForObject(sql, new MapperAccount(), user);
        return a;
    }

    public Account Login(String user, String pass) {
        Account a = getAccount(user);
        if (a.getPassAcc() == pass) {
            return a;
        } else return null;
    }
}
