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

    // Lay ra toan bo big_task trong project
    public List<Task> getAllBigTaskInProject(int project_id) {

        String sql = "SELECT *,(SELECT project_name FROM project WHERE id = ?) as projectname FROM big_task where big_task.project_id = ?";

        List<Task> taskList = jdbcTemplate.query(sql, new MapperTask(),project_id, project_id);
        return taskList;
    }

    //Lay ra toan bo task cua mot account
    public List<Task> getAllTaskInPhaseByAssignedUser(int acc_id) {

        String sql = "SELECT *,task.big_task_id as task_in_phase,\n" +
                "                (SELECT project.project_name from project where project.id = (SELECT big_task.project_id from big_task where big_task.id = task_in_phase)) as projectname\n" +
                "                FROM task where task.assigned_to = ?";

        List<Task> taskList = jdbcTemplate.query(sql, new MapperTask(), acc_id);
        return taskList;
    }

    // Lay ra task trong 1 big task
    public List<Task> getAllTaskInBigTask(int big_task_id) {

        String sql = "SELECT *,(SELECT project_name FROM project WHERE id = (SELECT big_task.project_id from big_task where big_task.id = ?)) as projectname FROM task where big_task_id = ? and task_id is null";

        List<Task> taskList = jdbcTemplate.query(sql, new MapperTask(),big_task_id, big_task_id);
        return taskList;
    }

    // lay ra sub task trong 1 task
    public List<Task> getAllSubTaskInTask(int big_task_id, int task_id) {

        String sql = "SELECT *,(SELECT project_name FROM project WHERE id = (SELECT big_task.project_id from big_task where big_task.id = ?)) as projectname FROM task where big_task_id = ? and task_id = ?";

        List<Task> taskList = jdbcTemplate.query(sql, new MapperTask(), big_task_id, big_task_id,task_id);
        return taskList;
    }
}
