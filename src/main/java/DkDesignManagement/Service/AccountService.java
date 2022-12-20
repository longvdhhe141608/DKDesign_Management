package DkDesignManagement.Service;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Repository.AccountDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public interface AccountService {
    @Autowired
    AccountDao accountDao = new AccountDao();

    public Account getAccount(String username);

    Account getAccountByAccountId(int accountId);

    public boolean isExisted(String username);

    List<Account> getAccountsByProjectId(int projectId);

    List<String> getUsernameList();

    List<Account> getAllAccount();

    int addNewAccount(String username, String password, int role);

    int updateAvatar(int id, String avatar);

    int changePassword(int aid, String newPass);
}
