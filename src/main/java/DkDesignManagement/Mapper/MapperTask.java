package DkDesignManagement.Mapper;

import DkDesignManagement.Entity.Task;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.math.BigDecimal;
import java.math.BigInteger;
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

        task.setTaskId(rs.getInt("id"));
        task.setProjectId(rs.getInt("project_id"));
        task.setSectionId(rs.getInt("section_id"));
        BigDecimal decimalTaskId = rs.getBigDecimal("task_id");
        BigInteger taskfId = (decimalTaskId == null ? null : decimalTaskId.toBigInteger());
        task.setTaskfId(taskfId);
        task.setCreatorId(rs.getInt("creator"));
        task.setAssignToId(rs.getInt("assignedto"));
        BigDecimal decimalRequirementId = rs.getBigDecimal("requirement_id");
        BigInteger requirementId = (decimalRequirementId == null ? null : decimalRequirementId.toBigInteger());
        task.setRequirementId(requirementId);
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
