package DkDesignManagement.Service;


import DkDesignManagement.Entity.Notification;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public interface NotificationService {

    List<Notification> getAllByAccountId(int accountId);

    void addNotification(Notification notification);
}
