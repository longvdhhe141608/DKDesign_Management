package DkDesignManagement.Mapper;

import DkDesignManagement.Entity.Status;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MapperStatus implements RowMapper<Status> {

    @Override
    public Status mapRow(ResultSet rs, int rowNum) throws SQLException {

        Status status = Status.builder()
                .id(rs.getInt("id"))
                .statusAccount(rs.getString("status_account"))
                .statusProject(rs.getString("status_project"))
                .statusRequirement(rs.getString("status_requirement"))
                .statusTask(rs.getString("status_task"))
                .build();
        return status;
    }
}
