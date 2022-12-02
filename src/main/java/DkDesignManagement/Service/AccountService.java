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

    public boolean isExisted(String username);

    List<Account> getAccounts();

    List<Account> getAccountsByProjectId(int projectId);

    HashMap<String,Integer> getAccountList();

    List<String> getUsernameList();

    List<Account> getAllAccount();

    void addNewAccount(String username, String password, int role);
}
