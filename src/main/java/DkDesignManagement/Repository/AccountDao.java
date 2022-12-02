package DkDesignManagement.Repository;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Mapper.MapperAccount;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
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

    public Account getAccountById(int id) {
        String sql = "Select * from `dkmanagement`.`accounts` where id = ?";

        try {
            Account account = jdbcTemplate.queryForObject(sql, new MapperAccount(), id);
            return account;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Account> getAllAccount() {
        String sql = "SELECT * FROM `dkmanagement`.`accounts`";
        List<Account> accountList;
        accountList = jdbcTemplate.query(sql, new MapperAccount());
        return accountList;
    }

    public List<Account> getAllAccountByProject(int projectId) {
        String sql = "select a.* from project_participation pp ,accounts a \n" +
                "where pp.account_id  = a.id \n" +
                "and pp.project_id = ? ";
        List<Account> accountList;
        accountList = jdbcTemplate.query(sql, new MapperAccount(),projectId);
        return accountList;
    }

    public int addNewAccount(String username, String password, int role) {
        String sql = "insert into `dkmanagement`.`accounts`(Username, `Password`, `role_id`, `Status`, `avatar_url`) " + "values ('" + username + "', '" + password + "', '" + role + "', 1, 'https://ssl.gstatic.com/accounts/ui/avatar_2x.png')";
        int check = 0;
        check = jdbcTemplate.update(sql);
        return check;
    }

    public int updateAccountStatus(String acc, int role, int status) {
        String sql = "update `dkmanagement`.`accounts` set `role_id` = " + role + ", `status` = " + status + " " + "where `accounts`.`Username` = '" + acc + "';";
        int check = 0;
        check = jdbcTemplate.update(sql);
        return check;
    }

    public int updateAvatar(int id, String avatar){
        String sql = "UPDATE `dkmanagement`.`accounts` " +
                "SET `avatar_url` = ? WHERE (`id` = ?)";

        int check = jdbcTemplate.update(sql,avatar,id);
        return check;
    }

    public List<String> getAllUsername() {
        String sql = "SELECT `username` FROM `dkmanagement`.`accounts`";
        List<String> usernameList;
        usernameList = jdbcTemplate.query(sql, new RowMapper<String>() {
            @Override
            public String mapRow(ResultSet rs, int rowNum) throws SQLException {
                return rs.getString("username");
            }
        });
        return usernameList;
    }
}
