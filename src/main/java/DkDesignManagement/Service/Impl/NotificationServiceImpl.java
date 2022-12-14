package DkDesignManagement.Service.Impl;


import DkDesignManagement.Entity.Notification;
import DkDesignManagement.Repository.NotificationDao;
import DkDesignManagement.Repository.ProjectDao;
import DkDesignManagement.Service.NotificationService;
import DkDesignManagement.Model.NotificationDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

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
    public NotificationDto getNotification(int accountId, String message, String url) {
        Notification notification = notificationDao.getNotification(accountId, message, url);
        if (!ObjectUtils.isEmpty(notification)) {
            return NotificationDto.toNotificationDto(notification);
        }
        return null;
    }

    @Override
    public int addNotification(Notification notification) {
       return notificationDao.addNotification(notification);
    }
}
