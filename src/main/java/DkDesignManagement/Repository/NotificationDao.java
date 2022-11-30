package DkDesignManagement.Repository;


import DkDesignManagement.Entity.Comment;
import DkDesignManagement.Entity.Notification;
import DkDesignManagement.Mapper.MapperComment;
import DkDesignManagement.Mapper.MapperNotification;
import DkDesignManagement.Mapper.MapperTask;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class NotificationDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    public List<Notification> getAll() {
        String sql = "select * from notification n  ";

        return jdbcTemplate.query(sql, new MapperNotification());
    }

    public List<Notification> getAllByAccountId(int accountId) {
        String sql = "select * from notification n where account_id  =? order by `date` desc ";

        return jdbcTemplate.query(sql, new MapperNotification(), accountId);
    }

    public int addNotification(Notification notification) {
        String sql = "INSERT INTO dkmanagement.notification\n" +
                "(`date`, detail, account_id, url , project_id)\n" +
                "VALUES(:date, :detail, :account_id, :url ,:project_id);\n";

        Map<String, Object> params = new HashMap<>();
        params.put("date", notification.getDate());
        params.put("detail", notification.getDetail());
        params.put("account_id", notification.getAccount_id());
        params.put("url", notification.getUrl());
        params.put("project_id", notification.getProject_id());


        GeneratedKeyHolder generatedKeyHolder = new GeneratedKeyHolder();
        namedParameterJdbcTemplate.update(sql, new MapSqlParameterSource(params), generatedKeyHolder);
        return generatedKeyHolder.getKey().intValue();
    }

    public Notification getNotification(int accountId, String message, String url) {
        String sql = "select * from notification n\n" +
                "where n.detail = ? \n" +
                "and n.url = ? \n" +
                "and n.account_id = ? ";

        try {
            return jdbcTemplate.queryForObject(sql, new MapperNotification(), message, url, accountId);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return null;
    }
}
