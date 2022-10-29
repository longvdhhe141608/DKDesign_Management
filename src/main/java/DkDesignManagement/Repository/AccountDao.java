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
        String sql = "Select * from `dkmanagement`.`accounts` where Username = ?";
        Account a = new Account();
        a = jdbcTemplate.queryForObject(sql, new MapperAccount(), user);
        return a;
    }

    public Account Login(String user, String pass) {
        Account a = getAccount(user);
        if (a.getPassAcc() == pass) {
            System.out.println("Login thanh cong: " + user);
            return a;
        } else {
            System.out.println("fail");
            return null;
        }
    }

    public List<Account> getAllAccount() {
        String sql = "SELECT * FROM `dkmanagement`.`accounts`";
        List<Account> accountList = new ArrayList<>();
        accountList = jdbcTemplate.query(sql, new MapperAccount());
        return accountList;
    }

    public int addNewAccount(String username, String password, int role) {
        String sql = "insert into `dkmanagement`.`accounts`(Username, `Password`, `Role in website`, `Status`) " +
                "values ('" + username + "', '" + password + "', '" + role + "', 1)";
        int check = 0;
        check = jdbcTemplate.update(sql);
        return check;
    }

    public int updateAccount(String acc, int role, int status) {
        String sql = "update `dkmanagement`.`accounts` set `Role in website` = " + role + ", `Status` = " + status + " " +
                "where `accounts`.`Username` = '" + acc + "';";
        int check = 0;
        check = jdbcTemplate.update(sql);
        return check;
    }

//    public static void main(String[] args) {
//        AccountDao accountDao = new AccountDao();
//        accountDao.Login("long","123456");
//    }
}
