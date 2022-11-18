package DkDesignManagement.Repository;

import DkDesignManagement.Entity.Member;
import DkDesignManagement.Mapper.MapperMember;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Date;
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

    /*
     * load out all member information except admin
     */
    public List<Member> getAllMember() {
        String sql = "SELECT `employees`.`id`,\n" +
                "`employees`.`name`,\n" +
                "`accounts`.`username`,\n" +
                "`accounts`.`role_id`,\n" +
                "`employees`.`phone`,\n" +
                "`employees`.`email`,\n" +
                "`employees`.`address`,\n" +
                "`accounts`.`status`,\n" +
                "`employees`.`dob`,\n" +
                "`employees`.`gender`,\n" +
                "`employees`.`cccd`\n" +
                "FROM `employees` JOIN `accounts` ON `employees`.`id_acc` = `accounts`.`id`\n" +
                "WHERE `accounts`.`role_id` <>1";

        List<Member> memberList = jdbcTemplate.query(sql, new MapperMember());
        return memberList;
    }

    /*
     * get member information by memberId (account_id in dao)
     */
    public Member getMemberByMemberId(int id) {
        String sql = "SELECT `employees`.`id`,\n" +
                "`employees`.`name`,\n" +
                "`accounts`.`username`,\n" +
                "`accounts`.`role_id`,\n" +
                "`employees`.`phone`,\n" +
                "`employees`.`email`,\n" +
                "`employees`.`address`,\n" +
                "`accounts`.`status`,\n" +
                "`employees`.`dob`,\n" +
                "`employees`.`gender`,\n" +
                "`employees`.`cccd`\n" +
                "FROM `employees` JOIN `accounts` ON `employees`.`id_acc` = `accounts`.`id`\n" +
                "WHERE `employees`.`id` = ?";
        Member member = jdbcTemplate.queryForObject(sql, new MapperMember(), id);
        return member;
    }

    public int addNewMember(String name, String email, int acc_id) {
        String sql = "INSERT INTO `dkmanagement`.`employees` (`name`,`email`, `id_acc`) " +
                "VALUES (?,?,?)";
        return jdbcTemplate.update(sql, name, email, acc_id);
    }

    public int updateMemberInfo(int id, String name, int gender, Date dob, String phone, String mail, String address,String cccd) {
        String sql = "UPDATE `dkmanagement`.`employees` " +
                "SET `name` = ?, " +
                "`address` = ?, " +
                "`gender` = ?, " +
                "`dob` = ?, " +
                "`cccd` = ?, " +
                "`email` = ?, " +
                "`phone` = ? " +
                "WHERE (`id` = ?)";


        int query = jdbcTemplate.update(sql, name, address, gender, dob, cccd, mail, phone, id);
        return query;
    }

    public int updateMemberRole(int role, String username){
        String sql = "UPDATE `dkmanagement`.`accounts` " +
                "SET `role_id` = ?" +
                "WHERE (`username` = ?)";
        int query = jdbcTemplate.update(sql, role,username);
        return query;
    }
    public int updateMemberStatus(int status, String username) {
        String sql = "UPDATE `dkmanagement`.`accounts` " +
                "SET `status` = ?" +
                "WHERE (`username` = ?)";
        int query = jdbcTemplate.update(sql, status, username);
        return query;
    }
}
