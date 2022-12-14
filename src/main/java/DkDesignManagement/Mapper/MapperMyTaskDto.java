package DkDesignManagement.Mapper;

import DkDesignManagement.Model.MyTaskDto;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MapperMyTaskDto implements RowMapper<MyTaskDto> {

    @Override
    public MyTaskDto mapRow(ResultSet rs, int rowNum) throws SQLException {

        MyTaskDto dto = MyTaskDto.builder()
                .subTaskID(rs.getInt("id"))
                .taskID(rs.getInt("task_id"))
                .projectID(rs.getInt("project_id"))
                .projectName(rs.getString("project_name"))
                .status(rs.getInt("status"))
                .statusName(rs.getString("status_task"))
                .startDate(rs.getDate("starting_date"))
                .deadline(rs.getDate("deadline"))
                .endDate(rs.getDate("ended_date"))
                .subTaskName(rs.getString("task_name"))
                .sectionID(rs.getInt("section_id"))
                .build();
        return dto;
    }
}
