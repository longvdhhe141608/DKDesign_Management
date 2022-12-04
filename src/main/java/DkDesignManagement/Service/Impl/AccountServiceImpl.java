package DkDesignManagement.Service.Impl;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Repository.AccountDao;
import DkDesignManagement.Service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
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
            if (a.getUsername().equals(username) == true) {
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

    /**
     * @return
     */
    @Override
    public HashMap<String, Integer> getAccountList() {
        List<Account> accountList = accountDao.getAllAccount();
        HashMap<String, Integer> accountMap = new HashMap<>();
//        for (Account account : accountList
//        ) {
//            String username = String.valueOf(account.getUsername().split("\s"));
//            String postNumb = account.getUsername().concat(username);
//            if (ObjectUtils.isEmpty(postNumb)) {
//                postNumb = "0";
//            }
//            int postNumber = Integer.parseInt(postNumb);
//            accountMap.put(account.getUsername(), postNumber);
//        }
        return accountMap;
    }

    @Override
    public List<String> getUsernameList() {
        return accountDao.getAllUsername();
    }

    /**
     * @return
     */
    @Override
    public List<Account> getAllAccount() {
        return accountDao.getAllAccount();
    }

    /**
     * @param username
     * @param password
     * @param role
     */
    @Override
    public void addNewAccount(String username, String password, int role) {
        accountDao.addNewAccount(username, password, role);
    }

    /**
     * @param id
     * @param avatar
     */
    @Override
    public int updateAvatar(int id, String avatar) {
        return accountDao.updateAvatar(id, avatar);
    }
}
