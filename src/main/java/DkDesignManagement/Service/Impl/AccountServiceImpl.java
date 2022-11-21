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
    public Account getAccount(String username) {
        return accountDao.getAccount(username);
    }

    public boolean isExisted(String username) {
        accountList = accountDao.getAllAccount();
        for (Account a : accountList) {
            if (a.getUsername().equals(username) == true){
                return true;
            }
        }
        return false;
    }

    @Override
    public List<Account> getAccounts() {
        return accountDao.getAllAccount();
    }

    @Override
    public List<Account> getAccountsByProjectId(int projectId) {
        return accountDao.getAllAccountByProject(projectId);
    }
}
