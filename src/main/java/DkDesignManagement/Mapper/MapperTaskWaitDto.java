package DkDesignManagement.Mapper;

import DkDesignManagement.model.TaskWaitDto;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MapperTaskWaitDto implements RowMapper<TaskWaitDto> {

    @Override
    public TaskWaitDto mapRow(ResultSet rs, int rowNum) throws SQLException {
        TaskWaitDto dto = TaskWaitDto.builder()
                .taskName(rs.getString("task_name"))
                .username(rs.getString("username"))
                .endDate(rs.getDate("deadline"))
                .startDate(rs.getDate("starting_date"))
                .numberOfFile(rs.getInt("number_of_file"))
                .status(rs.getInt("status"))
                .statusTask(rs.getString("status_task"))
                .description(rs.getString("description"))
                .build();
        return dto;
    }
}
