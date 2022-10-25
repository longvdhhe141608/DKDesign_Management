package com.dkdesignmanagement.Service.Impl;

import com.dkdesignmanagement.Entity.Account;
import com.dkdesignmanagement.Exception.NotFoundException;
import com.dkdesignmanagement.Respository.AccountDao;
import com.dkdesignmanagement.Service.IAccountService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.security.auth.login.AccountNotFoundException;
import java.util.List;
import java.util.Objects;

public class AccountServiceImpl implements IAccountService {
    @Autowired
    private AccountDao dao;


    @Override
    public List<Account> getAllAccount() {
        List<Account> accounts = dao.getAll();

        if(Objects.isNull(accounts)){
            throw new NotFoundException("Không có dữ liệu.");
        } else {
            return accounts;
        }
    }
}
