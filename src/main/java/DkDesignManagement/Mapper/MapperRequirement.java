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
        requirement.setProjectId(resultSet.getInt("project_id"));
        requirement.setRequirementName(resultSet.getString("requirement_name"));
        requirement.setRequirementDetail(resultSet.getString("requirement_detail"));
        requirement.setRequirementDate(resultSet.getDate("requirement_date"));
        requirement.setStatus(resultSet.getInt("status"));
        requirement.setStatusName(resultSet.getString("status_requirement"));
        return requirement;
    }
}