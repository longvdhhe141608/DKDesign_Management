package DkDesignManagement.Mapper;

import DkDesignManagement.Entity.Task;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;


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

        task.setTaskId(rs.getInt("id"));
        task.setProjectId(rs.getInt("project_id"));
        task.setSectionId(rs.getInt("section_id"));
        task.setTaskfId(rs.getInt("task_id"));
        task.setCreatorId(rs.getInt("creator"));
        task.setAssignToId(rs.getInt("assignedto"));
        task.setRequirementId(rs.getInt("requirement_id"));
        task.setTaskName(rs.getString("task_name"));
        task.setStartDate(rs.getDate("starting_date"));
        task.setDeadline(rs.getDate("deadline"));
        task.setEndDate(rs.getDate("ended_date"));

        task.setFileNumber(rs.getInt("number_of_file"));
        task.setDescription(rs.getString("description"));
        task.setTaskStatus(rs.getInt("status"));

        return task;
    }
}
