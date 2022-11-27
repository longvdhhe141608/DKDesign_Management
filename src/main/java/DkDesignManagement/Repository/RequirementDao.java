package DkDesignManagement.Repository;


import DkDesignManagement.Entity.Requirement;

import DkDesignManagement.Entity.Task;
import DkDesignManagement.Mapper.MapperRequirement;

import DkDesignManagement.Mapper.MapperTask;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class RequirementDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    public List<Requirement> getAll() {
        String sql = "select * from requirement";

        return jdbcTemplate.query(sql, new MapperRequirement());
    }

    public Requirement getRequirementById(int requirementId) {

        Requirement requirement = new Requirement();
        String sql = "select * from requirement r where r.id  = ? ";

        try {
            requirement = jdbcTemplate.queryForObject(sql, new MapperRequirement(), requirementId);
            return requirement;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
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

    public int countTaskNoDone(int requirementId) {
        String sql = "select count(1) from task t where requirement_id = ? and status !=4 and status!=5 and task_id is not NULL";
        return jdbcTemplate.queryForObject(sql, Integer.class, requirementId);
    }

    public int updateRequirement(Requirement requirement) {
        String sql = "UPDATE dkmanagement.requirement\n" +
                "SET project_id=:project_id , requirement_name=:requirement_name, requirement_detail=:requirement_detail" +
                ", requirement_date=:requirement_date, status=:status\n" +
                "WHERE id=:id;\n";

        Map<String, Object> params = new HashMap<>();
        params.put("project_id", requirement.getProjectId());
        params.put("requirement_name", requirement.getRequirementName());
        params.put("requirement_detail", requirement.getRequirementDetail());
        params.put("requirement_date", requirement.getRequirementDate());
        params.put("status", requirement.getStatus());
        params.put("id", requirement.getId());

        return namedParameterJdbcTemplate.update(sql, params);
    }

    //    Hàm tạo một requirement mới
    public int insertRequirement(Requirement requirement) {
        int check = 0;
        String sql = "insert into `dkmanagement`.`requirement`(`project_id`,`requirement_name`, `requirement_detail`, `requirement_date`, `status`) \n" +
                "values (?,?,?,?,?)";
        try {
            check = jdbcTemplate.update(sql, requirement.getProjectId(), requirement.getRequirementName(),
                    requirement.getRequirementDetail(), requirement.getRequirementDate(), requirement.getStatus());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    //Xóa một requirement trên màn hình
    public int deleteRequirement(Requirement requirement) {
        int check = 0;
        String sql = "update `dkmanagement`.`requirement` set `status` = ? " +
                "where `requirement`.`id` = ?";
        try {
            check = jdbcTemplate.update(sql, 3, requirement.getId());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }
}
