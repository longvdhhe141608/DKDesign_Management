package DkDesignManagement.Repository;

import DkDesignManagement.Entity.Task;
import DkDesignManagement.Mapper.MapperTask;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TaskDAO {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Task> getAllTaskInPhase(int idPhase) {

        String sql = "SELECT * FROM dkmanagement.task\n" +
                "WHERE idPhase = ? ";

        List<Task> taskList = jdbcTemplate.query(sql, new MapperTask(), idPhase);
        return taskList;
    }

    public List<Task> getAllTaskInPhaseByAssignedUser(String username, int idPhase) {

        String sql = "SELECT * FROM dkmanagement.task\n" +
                "WHERE idPhase = ? AND AssignedTo= ?";

        List<Task> taskList = jdbcTemplate.query(sql, new MapperTask(), idPhase, username);
        return taskList;
    }
}
