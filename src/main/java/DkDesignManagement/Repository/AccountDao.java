package DkDesignManagement.Repository;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Mapper.MapperAccount;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class AccountDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public Account getAccount(String user) {
        String sql = "Select * from `dkmanagement`.`accounts` where username = ?";

        try {
            Account account = jdbcTemplate.queryForObject(sql, new MapperAccount(), user);
            return account;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    public List<Account> getAllAccount() {
        String sql = "SELECT * FROM `dkmanagement`.`accounts`";
        List<Account> accountList = new ArrayList<>();
        accountList = jdbcTemplate.query(sql, new MapperAccount());
        return accountList;
    }

    public int addNewAccount(String username, String password, int role) {
        String sql = "insert into `dkmanagement`.`accounts`(Username, `Password`, `role_id`, `Status`) " + "values ('" + username + "', '" + password + "', '" + role + "', 1)";
        int check = 0;
        check = jdbcTemplate.update(sql);
        return check;
    }

    public int updateAccount(String acc, int role, int status) {
        String sql = "update `dkmanagement`.`accounts` set `role_id` = " + role + ", `Status` = " + status + " " + "where `accounts`.`Username` = '" + acc + "';";
        int check = 0;
        check = jdbcTemplate.update(sql);
        return check;
    }

//    public static void main(String[] args) {
//        AccountDao accountDao = new AccountDao();
//        accountDao.Login("long","123456");
//    }
}
