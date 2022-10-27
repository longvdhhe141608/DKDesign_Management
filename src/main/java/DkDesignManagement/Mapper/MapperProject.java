package DkDesignManagement.Mapper;

import DkDesignManagement.Entity.Project;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MapperProject implements RowMapper<Project> {
    @Override
    public Project mapRow(ResultSet resultSet, int i) throws SQLException {
        Project p = new Project();
        p.setIdProject(resultSet.getInt("idProject"));
        p.setNameProject(resultSet.getString("Project_Name"));
        p.setStartDate(resultSet.getDate("Start_Date"));
        p.setClosureDate(resultSet.getInt("Closure_Date"));
        p.setEndedDate(resultSet.getDate("Ended_Date"));
        p.setCreator(resultSet.getString("Creator"));
        p.setType(resultSet.getInt("Type"));
        p.setCusName(resultSet.getString("Customer's name"));
        p.setCusAddress(resultSet.getString("Customer's address"));
        p.setCusPhone(resultSet.getString("Customer's phone number"));
        p.setDetail(resultSet.getString("Detail"));
        p.setStatus(resultSet.getString("Status"));
        return p;
    }
}
