package DkDesignManagement.Mapper;


import DkDesignManagement.Entity.ProjectParticipation;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MapperProjectParticipation implements RowMapper<ProjectParticipation> {

    @Override
    public ProjectParticipation mapRow(ResultSet resultSet, int i) throws SQLException {
        ProjectParticipation p = new ProjectParticipation();
        p.setProjectId(resultSet.getInt("project_id"));
        p.setAccountId(resultSet.getInt("account_id"));
        p.setRoleId(resultSet.getInt("role_id"));
        p.setStatus(resultSet.getBoolean("status"));

        return p;
    }

}
