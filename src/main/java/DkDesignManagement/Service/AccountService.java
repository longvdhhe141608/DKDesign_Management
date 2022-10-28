package DkDesignManagement.Service;

import DkDesignManagement.Entity.Account;
import org.springframework.stereotype.Service;

@Service
public interface AccountService {
    public Account getAccount();

    public boolean isUser(String passAcc, String acc);
    public boolean isExists(String username);
}
