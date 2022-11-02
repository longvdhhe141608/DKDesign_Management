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

        String sql = "SELECT *,task.phase_id as task_in_phase,\n" +
                "(SELECT project.project_name from project where project.id = (SELECT `phase`.project_id from `phase` where phase.id = task_in_phase)) as projectname\n" +
                "FROM task where task.asignedto = 3;";

        List<Task> taskList = jdbcTemplate.query(sql, new MapperTask(), idPhase, idPhase);
        return taskList;
    }

    public List<Task> getAllTaskInPhaseByAssignedUser(int acc_id) {

        String sql = "SELECT *,task.phase_id as task_in_phase,\n" +
                "(SELECT project.project_name from project where project.id = (SELECT `phase`.project_id from `phase` where phase.id = task_in_phase)) as projectname\n" +
                "FROM task where task.asignedto = ?";

        List<Task> taskList = jdbcTemplate.query(sql, new MapperTask(), acc_id);
        return taskList;
    }
}
