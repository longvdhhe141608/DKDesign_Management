package DkDesignManagement.Repository;

import DkDesignManagement.Entity.Member;
import DkDesignManagement.Mapper.MapperMember;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class MemberDAO {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Member> getMemberInProject(int projectId) {
        List<Member> memberList = new ArrayList<Member>();
        String sql = "SELECT `employees`.id,`employees`.name as emp_name, \n" +
                "`roles`.name as role, \n" +
                "`employees`.`phone`, \n" +
                "`employees`.`email`,\n" +
                "`employees`.`address`,\n" +
                "`project_participation`.`status`\n" +
                "FROM employees JOIN project_participation ON project_participation.account_id = employees.id_acc\n" +
                "                JOIN `roles` ON roles.id = project_participation.role_id\n" +
                "WHERE project_participation.project_id = ?";

        memberList = jdbcTemplate.query(sql, new MapperMember(), projectId);
        return memberList;
    }

    public void updateStatusMemberInProject(int projectID, int memberID, int status) {
        String sql = "UPDATE `dkmanagement`.`project_participation` " +
                "SET `status` = ? " +
                "WHERE (`project_id` = ?) and (`account_id` = ?)";
        jdbcTemplate.update(sql, status, projectID, memberID);

    }

    public List<Member> getAllMember() {
        String sql = "SELECT `employees`.id,`employees`.name as emp_name,\n" +
                "                `roles`.name as role,\n" +
                "                `employees`.`phone`, \n" +
                "                `employees`.`email`,\n" +
                "                `employees`.`address`,\n" +
                "                `accounts`.`status`\n" +
                "FROM employees join accounts on employees.id_acc = accounts.id \n" +
                "join roles on roles.id=accounts.role_id";

        List<Member> memberList = jdbcTemplate.query(sql, new MapperMember());
        return memberList;
    }

    public int addNewMember(String name, int acc_id){
        String sql = "INSERT INTO `dkmanagement`.`employees` (`name`,  `id_acc`) " +
                "VALUES (?, ?)";
        int action = jdbcTemplate.update(sql,name,acc_id);
        return action;
    }

}
