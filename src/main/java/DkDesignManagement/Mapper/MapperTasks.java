package DkDesignManagement.Mapper;

import DkDesignManagement.Entity.Tasks;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MapperTasks implements RowMapper<Tasks> {

    @Override
    public Tasks mapRow(ResultSet rs, int rowNum) throws SQLException {
        Tasks tasks = Tasks.builder()
                .id(rs.getInt("id"))
                .projectID(rs.getInt("project_id"))
                .sectionID(rs.getInt("section_id"))
                .taskID(rs.getInt("task_id"))
                .creator(rs.getInt("creator"))
                .assignedTo(rs.getInt("assignedto"))
                .requirementID(rs.getInt("requirement_id"))
                .taskName(rs.getString("task_name"))
                .startingDate(rs.getDate("starting_date"))
                .deadline(rs.getDate("deadline"))
                .endedDate(rs.getDate("ended_date"))
                .numberOfFile(rs.getInt("number_of_file"))
                .description(rs.getString("description"))
                .status(rs.getInt("status"))
                .nameEmployee(rs.getString("username"))
                .nameRequirement(rs.getString("requirement_name"))
                .build();
        return tasks;
    }
}
