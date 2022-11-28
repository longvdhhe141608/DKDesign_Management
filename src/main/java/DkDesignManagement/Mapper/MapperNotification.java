package DkDesignManagement.Mapper;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.Notification;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MapperNotification implements RowMapper<Notification> {
    @Override
    public Notification mapRow(ResultSet resultSet, int i) throws SQLException {
        Notification notification = new Notification();
        notification.setId(resultSet.getInt("id"));
        notification.setDate(resultSet.getTimestamp("date"));
        notification.setDetail(resultSet.getString("detail"));
        notification.setAccount_id(resultSet.getInt("account_id"));
        notification.setUrl(resultSet.getString("url"));
        notification.setProject_id(resultSet.getInt("project_id"));
        return notification;
    }
}