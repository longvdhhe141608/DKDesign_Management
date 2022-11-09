package DkDesignManagement.Repository;


import DkDesignManagement.Entity.Project;
import DkDesignManagement.Mapper.MapperProject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.stereotype.Repository;
import org.springframework.util.ObjectUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ProjectDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    public Project getProject(int id) {
        String sql = "Select * from `dkmanagement`.`project` where id = ?";
        Project p = new Project();
        p = jdbcTemplate.queryForObject(sql, new MapperProject(), id);
        return p;
    }

    public List<Project> getProjectByAcc(int id) {
        String sql = "select `project`.* from project \n" +
                "join `project_participation` on `project`.`id` = `project_participation`.`project_id` \n" +
                "join `accounts` on `project_participation`.`account_id` = `accounts`.`id` \n" +
                "where `accounts`.`id` = ? and `project`.`status` = 2\n" +
                "GROUP BY `project`.`id` \n" +
                "order by `project`.`id` desc \n";
        List<Project> projectList = new ArrayList<>();
        projectList = jdbcTemplate.query(sql, new MapperProject(), id);
        return projectList;
    }

    public List<Project> getAllProjectByAcc(int id, String textSearch,String option) {
        String sql = "select\n" +
                "\t`project` .*\n" +
                "from\n" +
                "\tproject\n" +
                "join `project_participation` on\n" +
                "\t`project`.`id` = `project_participation`.`project_id`\n" +
                "join `accounts` on\n" +
                "\t`project_participation`.`account_id` = `accounts`.`id`\n" +
                "where\n" +
                "\t`accounts`.`id` = " + id + " \n";

        if (!ObjectUtils.isEmpty(textSearch)) {
            if(option.equals("name")){
                sql += " and project.project_name like '%" + textSearch + "%' \n";
            }else{
                sql += " and project.start_date  >= '"+textSearch+"' ";
            }

        }
        sql += " group by \n" +
                "\t`project`.`id`\n" +
                "order by\n" +
                "\t`project`.`id` desc";
        List<Project> projectList = new ArrayList<>();
        projectList = jdbcTemplate.query(sql, new MapperProject());
        return projectList;
    }

    public List<Project> getAllProjectByYear(String acc, int year) {
//        String sql = "select `project`.`project_Name`, `category`.`Category_Name`, `project`.`Start_Date`, `project`.`Ended_Date`, `project`.`Status` from project " +
//                "join `project_participation` on `project`.`id` = `project_participation`.`project_id` " +
//                "join `accounts` on `project_participation`.`account_id` = `accounts`.`id` " +
//                "join category on project.`Type`= category.`id` " +
//                "where `accounts`.`Username` = ? && YEAR(`project`.`Start_Date`) = ?";
        List<Project> projectList = new ArrayList<>();
//        projectList = jdbcTemplate.query(sql, new MapperProject(), acc, year);
        return projectList;
    }

    public List<Project> getAllProjectByString(String acc, String s) {
//        String sql = "select DISTINCT `project`.`project_Name`, `category`.`Category_Name`, `project`.`Start_Date`, `project`.`Ended_Date`, `project`.`Status` from project " +
//                "join `project_participation` on `project`.`id` = `project_participation`.`project_id` " +
//                "join `accounts` on `project_participation`.`account_id` = `accounts`.`id` " +
//                "join category on project.`Type`= category.`id` " +
//                "where `accounts`.`Username` = ? " +
//                "&& `project`.`Project_Name` like '%" + s + "%' or `category`.`Category_Name` like '%" + s + "%'";
        List<Project> projectList = new ArrayList<>();
//        projectList = jdbcTemplate.query(sql, new MapperProject(), acc);
        return projectList;
    }


    public int addNewProject(Project project) {
        String sql = "INSERT INTO dkmanagement.project\n" +
                "(project_name, start_date, closure_date, ended_date, creator, `type`, customer_name, customer_address, customer_phone, detail, status,construction_area)\n" +
                "VALUES(:name, :start_date, :closure_date, :ended_date, :creator, :type, :customer_name " +
                " , :customer_address , :customer_phone , :detail , :status , :construction_area);\n";


        Map<String, Object> params = new HashMap<>();
        params.put("name", project.getProject_name());
        params.put("start_date", project.getStart_date());
        params.put("closure_date", project.getClosure_date());
        params.put("ended_date", project.getEnd_date());
        params.put("creator", project.getCreator());
        params.put("type", project.getType());
        params.put("customer_name", project.getCusName());
        params.put("customer_address", project.getCusAddress());
        params.put("customer_phone", project.getCusPhone());
        params.put("detail", project.getDetail());
        params.put("status", project.getStatus());
        params.put("construction_area", project.getConstruction_area());


        GeneratedKeyHolder generatedKeyHolder = new GeneratedKeyHolder();
        namedParameterJdbcTemplate.update(sql, new MapSqlParameterSource(params), generatedKeyHolder);
        return generatedKeyHolder.getKey().intValue();
    }
}
