package DkDesignManagement.Service;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.RevisionHistory;
import DkDesignManagement.Repository.AccountDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public interface HistoryService {

    List<RevisionHistory> getAlLRevisionHistoryOfTable(int tableId, String type);

    Integer getLastRevisionNoHistoryOfTable(int tableId, String type);

    void addHistory(RevisionHistory history);
}
