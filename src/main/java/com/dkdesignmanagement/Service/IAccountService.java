package com.dkdesignmanagement.Service;

import com.dkdesignmanagement.Entity.Account;
import org.springframework.stereotype.Service;

import javax.security.auth.login.AccountNotFoundException;
import java.util.List;

@Service
public interface IAccountService {
    List<Account> getAllAccount() throws AccountNotFoundException;
}
