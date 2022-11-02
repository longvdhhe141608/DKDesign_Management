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

    public boolean isExists(String username) {
        accountList = accountDao.getAllAccount();
        for (Account a : accountList) {
            if (a.getUsername().equals(username) == true){
                return false;
            }
        }
        return true;
    }

}
