package DkDesignManagement.Service;

import DkDesignManagement.Entity.Account;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface AccountService {
    public Account getAccount();

    public boolean isExisted(String username);

    List<Account> getAccounts();

    List<Account> getAccountsByProject(int projectId);
}
