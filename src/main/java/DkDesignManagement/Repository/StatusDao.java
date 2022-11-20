package DkDesignManagement.Repository;

import DkDesignManagement.Entity.Status;
import DkDesignManagement.Mapper.MapperStatus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class StatusDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Status> getAllStatus() {
        List<Status> statusList = new ArrayList<>();
        String sql = "SELECT * FROM dkmanagement.status;";

        try {
            statusList = jdbcTemplate.query(sql, new MapperStatus());
            return statusList;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
