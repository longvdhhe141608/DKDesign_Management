package DkDesignManagement.Mapper;


import DkDesignManagement.Entity.Requirement;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MapperRequirement implements RowMapper<Requirement> {
    @Override
    public Requirement mapRow(ResultSet resultSet, int i) throws SQLException {
        Requirement requirement = new Requirement();
        requirement.setId(resultSet.getInt("id"));
        requirement.setProject_id(resultSet.getInt("project_id"));
        requirement.setRequirement_name(resultSet.getString("requirement_name"));
        requirement.setRequirement_detail(resultSet.getString("requirement_detail"));
        requirement.setRequirement_date(resultSet.getDate("requirement_date"));
        requirement.setStatus(resultSet.getInt("status"));
        return requirement;
    }
}