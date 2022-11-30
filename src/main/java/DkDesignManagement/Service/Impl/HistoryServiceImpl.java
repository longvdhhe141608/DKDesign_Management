package DkDesignManagement.Service.Impl;

import DkDesignManagement.Entity.RevisionHistory;
import DkDesignManagement.Repository.RevisionHistoryDao;
import DkDesignManagement.Service.HistoryService;
import DkDesignManagement.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;

import java.util.List;

@Service
public class HistoryServiceImpl implements HistoryService {

    @Autowired
    RevisionHistoryDao revisionHistoryDao;

    @Override
    public List<RevisionHistory> getAlLRevisionHistoryOfTable(int tableId, String type) {
        List<RevisionHistory> listHistory = revisionHistoryDao.getAlLRevisionHistoryOfTable(tableId, type);
        for (RevisionHistory history : listHistory) {
            history.setDateString(DateUtils.getDateString(history.getRevision_date()));
        }
        return listHistory;
    }

    @Override
    public Integer getLastRevisionNoHistoryOfTable(int tableId, String type) {
        List<RevisionHistory> listHistory = revisionHistoryDao.getAlLRevisionHistoryOfTable(tableId, type);
        if (!ObjectUtils.isEmpty(listHistory)) {
            RevisionHistory revisionHistory = listHistory.stream().findFirst().orElse(null);
            if (!ObjectUtils.isEmpty(revisionHistory)) {
                return revisionHistory.getRevision_no();
            }
        }
        return null;
    }

    @Transactional
    @Override
    public void addHistory(RevisionHistory history) {
        revisionHistoryDao.addHistory(history);
    }
}
