package DkDesignManagement.Repository;

import DkDesignManagement.Entity.Project;
import DkDesignManagement.Entity.ProjectParticipation;
import DkDesignManagement.Mapper.MapperMemberActive;
import DkDesignManagement.Mapper.MapperProjectParticipation;
import DkDesignManagement.model.MemberActiveDto;
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
public class ProjectParticipationDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    public int addProjectParticipation(ProjectParticipation project) {
        String sql = "INSERT INTO dkmanagement.project_participation\n" +
                "(project_id, account_id, role_id, status)\n" +
                "VALUES(:project_id, :account_id, :role_id, :status);";

        Map<String, Object> params = new HashMap<>();
        params.put("project_id", project.getProjectId());
        params.put("account_id", project.getAccountId());
        params.put("role_id", project.getRoleId());
        params.put("status", project.isStatus());


        return namedParameterJdbcTemplate.update(sql, params);
    }

    public List<MemberActiveDto> getAllMember(int projectID, int indexPage, String roleID, String textSearch) {
        List<MemberActiveDto> activeDtoList = new ArrayList<>();
        String sql = "SELECT e.name, r.name as roleName, e.phone, e.phone, e.email, e.address FROM dkmanagement.project_participation pp \n" +
                "join project p on pp.project_id = p.id\n" +
                "join accounts a on a.id = pp.account_id\n" +
                "join roles r on r.id = pp.role_id\n" +
                "join employees e on a.id = e.id_acc where pp.project_id = ? ";

        if (!ObjectUtils.isEmpty(roleID) && !roleID.equals("default")) {
            sql += " and r.id = " + roleID + " ";
        }

        if (!ObjectUtils.isEmpty(textSearch)) {
            sql += " and e.name like '%" + textSearch + "%' ";
        }

        sql += " limit ?, 10";

        try {
            activeDtoList = jdbcTemplate.query(sql, new MapperMemberActive(), projectID, indexPage);
            return activeDtoList;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public int totalAllMember(int projectID, String roleID, String textSearch) {
        int totalPage = 0;
        List<MemberActiveDto> activeDtoList = new ArrayList<>();
        String sql = "SELECT e.name, r.name as roleName, e.phone, e.phone, e.email, e.address FROM dkmanagement.project_participation pp \n" +
                "join project p on pp.project_id = p.id\n" +
                "join accounts a on a.id = pp.account_id\n" +
                "join roles r on r.id = pp.role_id\n" +
                "join employees e on a.id = e.id_acc where pp.project_id = ? ";

        if (!ObjectUtils.isEmpty(roleID) && !roleID.equals("default")) {
            sql += " and r.id = " + roleID + " ";
        }

        if (!ObjectUtils.isEmpty(textSearch)) {
            sql += " and e.name like '%" + textSearch + "%' ";
        }

        try {
            activeDtoList = jdbcTemplate.query(sql, new MapperMemberActive(), projectID);
            totalPage = activeDtoList.size();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return totalPage;
    }

    public ProjectParticipation getProjectParticipants(int projectID,int accountId) {
        ProjectParticipation projectParticipation = null;
        String sql = "select * from project_participation pp where pp.project_id = ? and pp.account_id = ?";

        try {
            projectParticipation = jdbcTemplate.queryForObject(sql, new MapperProjectParticipation(), projectID, accountId);
            return projectParticipation;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}
