package DkDesignManagement.Mapper;

import DkDesignManagement.Entity.Project;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MapperProject implements RowMapper<Project> {
    @Override
    public Project mapRow(ResultSet resultSet, int i) throws SQLException {
        Project p = new Project();
        p.setId(resultSet.getInt("id"));
        p.setProject_name(resultSet.getString("project_name"));
        p.setStart_date(resultSet.getDate("start_date"));
        p.setClosure_date(resultSet.getDate("closure_date"));
        p.setEnd_date(resultSet.getDate("ended_date"));
        p.setCreator(resultSet.getInt("creator"));
        p.setType(resultSet.getInt("type"));
        p.setCusName(resultSet.getString("customer_name"));
        p.setCusAddress(resultSet.getString("customer_address"));
        p.setCusPhone(resultSet.getString("customer_phone"));
        p.setDetail(resultSet.getString("detail"));
        p.setStatus(resultSet.getInt("status"));
        return p;
    }
}
