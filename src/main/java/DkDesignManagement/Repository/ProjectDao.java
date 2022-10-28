package DkDesignManagement.Repository;

import DkDesignManagement.Entity.Category;
import DkDesignManagement.Entity.Project;
import DkDesignManagement.Mapper.MapperProject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class ProjectDao {
    @Autowired
    JdbcTemplate jdbcTemplate;

    public Project getProject(int id) {
        String sql = "Select * from `dkmanagement`.`project` where idProject = ?";
        Project p = new Project();
        p = jdbcTemplate.queryForObject(sql, new MapperProject(), id);
        return p;
    }

    public List<Project> getAllProject(String acc) {
        String sql = "select `project`.`project_Name`, `category`.`Category_Name`, `project`.`Start_Date`, `project`.`Ended_Date`, `project`.`Status` from project " +
                "join `project_participation` on `project`.`idProject` = `project_participation`.`idProject` " +
                "join `accounts` on `project_participation`.`username` = `accounts`.`username` " +
                "join category on project.`Type`= category.`idCategory` " +
                "where `accounts`.`Username` = ?";
        List<Project> projectList = new ArrayList<>();
        projectList = jdbcTemplate.query(sql, new MapperProject(), acc);
        return projectList;
    }

    public List<Project> getAllProjectByYear(String acc, int year) {
        String sql = "select `project`.`project_Name`, `category`.`Category_Name`, `project`.`Start_Date`, `project`.`Ended_Date`, `project`.`Status` from project " +
                "join `project_participation` on `project`.`idProject` = `project_participation`.`idProject` " +
                "join `accounts` on `project_participation`.`username` = `accounts`.`username` " +
                "join category on project.`Type`= category.`idCategory` " +
                "where `accounts`.`Username` = ? && YEAR(`project`.`Start_Date`) = ?";
        List<Project> projectList = new ArrayList<>();
        projectList = jdbcTemplate.query(sql, new MapperProject(), acc, year);
        return projectList;
    }

    public List<Project> getAllProjectByString(String acc, String s) {
        String sql = "select DISTINCT `project`.`project_Name`, `category`.`Category_Name`, `project`.`Start_Date`, `project`.`Ended_Date`, `project`.`Status` from project " +
                "join `project_participation` on `project`.`idProject` = `project_participation`.`idProject` " +
                "join `accounts` on `project_participation`.`username` = `accounts`.`username` " +
                "join category on project.`Type`= category.`idCategory` " +
                "where `accounts`.`Username` = ? " +
                "&& `project`.`Project_Name` like '%" + s + "%' or `category`.`Category_Name` like '%" + s + "%'";
        List<Project> projectList = new ArrayList<>();
        projectList = jdbcTemplate.query(sql, new MapperProject(), acc);
        return projectList;
    }

    public int addNewProject(String acc, int cate, String pn, String sd, String cl, String status) {
        status = "Đang thực hiện";
        String sql = "insert into `dkmanagement`.`project` (`Project_Name`, `Start_Date`, `Closure_Date`,`Ended_Date`, " +
                "`Creator`, `Type`, `Customer's name`, `Customer's address`, `Customer's phone number`, `Detail`, `Status`) " +
                "values(N'" + pn + "', '" + sd + "','" + cl + "',null, " + acc + ", ?, null, null, null, null, N'" + status + "');";
        int p = 0;
        p = jdbcTemplate.update(sql);
        return p;
    }
}
