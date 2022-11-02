package DkDesignManagement.Repository;

import DkDesignManagement.Entity.Member;
import DkDesignManagement.Mapper.MapperMember;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class MemberDAO {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Member> getMemberInProject(int projectId){
        String sql = "SELECT `employees`.`Name`, `role`.`roleName`, `employees`.`Phone`, `employees`.`Mail`,`employees`.`Address`, `accounts`.`Status`\n" +
                "FROM employees JOIN accounts ON employees.Username = accounts.Username\n" +
                "JOIN project_participation ON project_participation.Username = accounts.Username\n" +
                "JOIN `role` ON `role`.idRole = project_participation.RoleInProject\n" +
                "WHERE project_participation.idProject = ?";
        List<Member> memberList =  jdbcTemplate.query(sql, new MapperMember(), projectId);
        return memberList;
    }
}
