package DkDesignManagement.Mapper;

import DkDesignManagement.Entity.Requirement;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MapperRequirement implements RowMapper<Requirement> {

    @Override
    public Requirement mapRow(ResultSet rs, int rowNum) throws SQLException {

        Requirement r = Requirement.builder()
                .id(rs.getInt("id"))
                .requirementName(rs.getString("requirement_name"))
                .requirementDate(rs.getDate("requirement_date"))
                .requirementDetail(rs.getString("requirement_detail"))
                .projectID(rs.getInt("project_id"))
                .status(rs.getInt("status"))
                .build();

        return r;
    }
}
