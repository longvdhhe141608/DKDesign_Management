package DkDesignManagement.Mapper;

import DkDesignManagement.Entity.BigTask;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;


public class MapperBigTask implements RowMapper<BigTask> {
    /**
     * @param rs
     * @param rowNum
     * @return
     * @throws SQLException
     */
    @Override
    public BigTask mapRow(ResultSet rs, int rowNum) throws SQLException {
        BigTask task = new BigTask();
        task.setId(rs.getInt("id"));
        task.setStart_date(rs.getDate("start_date"));
        task.setDeadline(rs.getDate("deadline"));
        task.setDescription(rs.getString("description"));
        task.setProject_id(rs.getInt("project_id"));
        task.setCreator(rs.getInt("creator"));
        task.setAssigned_to(rs.getInt("assigned_to"));

        return task;
    }
}
