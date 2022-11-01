package DkDesignManagement.Service;

import DkDesignManagement.Entity.Account;
import org.springframework.stereotype.Service;

@Service
public interface AccountService {
    public Account getAccount();

    public boolean isExists(String username);
}
