package DkDesignManagement.Repository;

import DkDesignManagement.Entity.Member;
import DkDesignManagement.Mapper.MapperMember;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MemberDAO {
    @Autowired
    JdbcTemplate jdbcTemplate;

    public List<Member> getMemberInProject(int projectId){
        String sql = "SELECT `employees`.`Name`, `project_participation`.`Role in project`, `employees`.`Phone number`, `employees`.`Mail`, `accounts`.`Status`\n" +
                "FROM employees JOIN accounts ON employees.Username = accounts.Username\n" +
                "JOIN project_participation ON project_participation.Username = accounts.Username\n" +
                "WHERE project_participation.idProject = ?";
        List<Member> memberList = new ArrayList<Member>();

        memberList = jdbcTemplate.query(sql,new MapperMember(), projectId);
        return memberList;
    }
}
