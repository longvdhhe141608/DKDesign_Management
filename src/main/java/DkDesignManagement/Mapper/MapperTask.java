package DkDesignManagement.Mapper;

import DkDesignManagement.Entity.Task;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;


public class MapperTask implements RowMapper<Task> {
    /**
     * @param rs
     * @param rowNum
     * @return
     * @throws SQLException
     */
    @Override
    public Task mapRow(ResultSet rs, int rowNum) throws SQLException {
        Task task = new Task();
         task.setIdTask(rs.getInt("id"));
         task.setIdPhase(rs.getInt("big_task_id"));
         task.setIdTask_f(rs.getInt("task_id"));
         task.setTaskName(rs.getString("task_name"));
         task.setTaskStatus(rs.getBoolean("task_status"));
         task.setStartDate(rs.getDate("starting_date"));
        task.setDeadline(rs.getDate("deadline"));
         task.setEndDate(rs.getDate("ended_date"));
         task.setGallery(rs.getString("gallery"));
         task.setDescription(rs.getString("description"));
         task.setCreator(rs.getString("creator"));
         task.setAssignTo(rs.getString("assignedto"));
         task.setProjectName(rs.getString("projectname"));
         return task;
    }
}
