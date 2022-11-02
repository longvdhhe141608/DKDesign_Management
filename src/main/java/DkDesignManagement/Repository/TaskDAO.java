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

        String sql = "SELECT \n" +
                "    idTask,\n" +
                "    idPhase,\n" +
                "    idTask_f,\n" +
                "    TaskName,\n" +
                "    TaskStatus,\n" +
                "    Starting_Date,\n" +
                "    Deadline,\n" +
                "    Ended_Date,\n" +
                "    Gallery,\n" +
                "    Description,\n" +
                "    Creator,\n" +
                "    AssignedTo,\n" +
                "    (SELECT \n" +
                "            project.Project_Name\n" +
                "        FROM\n" +
                "            project\n" +
                "        WHERE\n" +
                "            project.idProject = (SELECT \n" +
                "                    idProject\n" +
                "                FROM\n" +
                "                    phase\n" +
                "                WHERE\n" +
                "                    idPhase = ?)) AS ProjectName\n" +
                "FROM\n" +
                "    dkmanagement.task\n" +
                "WHERE\n" +
                "    idPhase = ?";

        List<Task> taskList = jdbcTemplate.query(sql, new MapperTask(), idPhase, idPhase);
        return taskList;
    }

    public List<Task> getAllTaskInPhaseByAssignedUser(String username, int idPhase) {

        String sql = "SELECT \n" +
                "    idTask,\n" +
                "    idPhase,\n" +
                "    idTask_f,\n" +
                "    TaskName,\n" +
                "    TaskStatus,\n" +
                "    Starting_Date,\n" +
                "    Deadline,\n" +
                "    Ended_Date,\n" +
                "    Gallery,\n" +
                "    Description,\n" +
                "    Creator,\n" +
                "    AssignedTo,\n" +
                "    (SELECT \n" +
                "            project.Project_Name\n" +
                "        FROM\n" +
                "            project\n" +
                "        WHERE\n" +
                "            project.idProject = (SELECT \n" +
                "                    idProject\n" +
                "                FROM\n" +
                "                    phase\n" +
                "                WHERE\n" +
                "                    idPhase = ?)) AS ProjectName\n" +
                "FROM\n" +
                "    dkmanagement.task\n" +
                "WHERE\n" +
                "    idPhase = ? AND AssignedTo = ?;";

        List<Task> taskList = jdbcTemplate.query(sql, new MapperTask(), idPhase, idPhase, username);
        return taskList;
    }
}
