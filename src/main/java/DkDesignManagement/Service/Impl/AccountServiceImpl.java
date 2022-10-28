package DkDesignManagement.Service.Impl;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Repository.AccountDao;
import DkDesignManagement.Service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class AccountServiceImpl implements AccountService {
    @Autowired
    private AccountDao accountDao;
    private List<Account> accountList = new ArrayList<>();

    @Override
    public Account getAccount() {
        return null;
    }

    public boolean isUser(String username, String password) {
        Account account = accountDao.getAccount(username);
        if (account != null && account.getPassAcc().equals(password)) {
            return true;
        }
        return false;
    }

    public boolean isExists(String username) {
        for (Account a : accountList) {
            if (a.getNameAcc().equals(username) == true){
                return false;
            }
        }
        return true;
    }

    public AccountDao getAccountDao() {
        return accountDao;
    }

    public void setAccountDao(AccountDao accountDao) {
        this.accountDao = accountDao;
    }
}
