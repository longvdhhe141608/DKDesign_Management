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
         task.setIdTask(rs.getInt("idTask"));
         task.setIdPhase(rs.getInt("idPhase"));
         task.setIdTask_f(rs.getInt("idTask_f"));
         task.setTaskName(rs.getString("TaskName"));
         task.setTaskStatus(rs.getBoolean("TaskStatus"));
         task.setDeadline(rs.getDate("Deadline"));
         task.setStartDate(rs.getDate("Starting_Date"));
         task.setEndDate(rs.getDate("Ended_Date"));
         task.setGallery(rs.getString("Gallery"));
         task.setDescription(rs.getString("Description"));
         task.setCreator(rs.getString("Creator"));
         task.setAssignTo(rs.getString("AssignedTo"));
         task.setProjectName(rs.getString("ProjectName"));
         return task;
    }
}
