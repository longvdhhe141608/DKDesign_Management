package DkDesignManagement.Repository;

import DkDesignManagement.Entity.Member;
import DkDesignManagement.Mapper.MapperMember;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberDAO {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Member> getMemberInProject(int projectId) {
        String sql = "SELECT `employees`.name as emp_name, `roles`.name as role, `employees`.`phone`, `employees`.`email`,`employees`.`address`, `project_participation`.`status`\n" +
                "FROM employees JOIN project_participation ON project_participation.account_id = employees.id_acc\n" +
                "JOIN `roles` ON roles.id = project_participation.role_id\n" +
                "WHERE project_participation.project_id = ?";
        List<Member> memberList = jdbcTemplate.query(sql, new MapperMember(), projectId);
        return memberList;
    }

    public void blockMemberInProject(int projectID, int memberID) {
        String sql = "UPDATE `dkmanagement`.`project_participation` " +
                "SET `status` = 0 " +
                "WHERE (`project_id` = ?) and (`account_id` = ?)";
        jdbcTemplate.update(sql, projectID, memberID);

    }

    public void unblockMemberInProject(int projectID, int memberID) {
        String sql = "UPDATE `dkmanagement`.`project_participation` " +
                "SET `status` = 1 " +
                "WHERE (`project_id` = ?) and (`account_id` = ?)";
        jdbcTemplate.update(sql, projectID, memberID);

    }
}
