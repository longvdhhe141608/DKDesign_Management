package DkDesignManagement.Repository;


import DkDesignManagement.Entity.Requirement;

import DkDesignManagement.Mapper.MapperRequirement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;


import java.util.ArrayList;
import java.util.List;

@Repository
public class RequirementDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Requirement> getAll() {
        String sql = "select * from requirement";

        return jdbcTemplate.query(sql, new MapperRequirement());
    }

    public List<Requirement> getAllRequirementByProjectID(int projectID) {

        List<Requirement> requirements = new ArrayList<>();
        String sql = "SELECT * FROM dkmanagement.requirement where project_id= ?;";

        try {
            requirements = jdbcTemplate.query(sql, new MapperRequirement(), projectID);
            return requirements;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Requirement> getPaginationRequirementByProjectID(int projectID, int indexPage) {

        List<Requirement> requirements = new ArrayList<>();
        String sql = "SELECT * FROM dkmanagement.requirement where project_id= ? ORDER BY id DESC LIMIT " + indexPage + ", 10;";

        try {
            requirements = jdbcTemplate.query(sql, new MapperRequirement(), projectID);
            return requirements;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
