package DkDesignManagement.Service.Impl;


import DkDesignManagement.Entity.Notification;
import DkDesignManagement.Repository.NotificationDao;
import DkDesignManagement.Service.NotificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class NotificationServiceImpl implements NotificationService {

    @Autowired
    NotificationDao notificationDao;

    @Override
    public List<Notification> getAllByAccountId(int accountId) {
        return notificationDao.getAllByAccountId(accountId);
    }

    @Override
    public void addNotification(Notification notification) {
        notificationDao.addNotification(notification);
    }
}
