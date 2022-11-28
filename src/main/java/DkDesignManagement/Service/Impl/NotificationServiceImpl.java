package DkDesignManagement.Service.Impl;


import DkDesignManagement.Entity.Notification;
import DkDesignManagement.Repository.NotificationDao;
import DkDesignManagement.Repository.ProjectDao;
import DkDesignManagement.Service.NotificationService;
import DkDesignManagement.model.NotificationDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;


@Service
public class NotificationServiceImpl implements NotificationService {

    @Autowired
    NotificationDao notificationDao;

    @Autowired
    ProjectDao projectDao;

    @Override
    public List<NotificationDto> getAllByAccountId(int accountId) {
        List<Notification> listNotification = notificationDao.getAllByAccountId(accountId);
        List<NotificationDto> listNotificationDto = listNotification.stream().map(NotificationDto::toNotificationDto).collect(Collectors.toList());

        for (NotificationDto notification : listNotificationDto) {
            notification.setProjectName(projectDao.getProject(notification.getProject_id()).getProjectName());
        }

        return listNotificationDto;
    }

    @Override
    public void addNotification(Notification notification) {
        notificationDao.addNotification(notification);
    }
}
