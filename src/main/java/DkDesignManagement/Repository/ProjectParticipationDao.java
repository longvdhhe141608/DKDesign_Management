package DkDesignManagement.Repository;

import DkDesignManagement.Entity.Project;
import DkDesignManagement.Entity.ProjectParticipation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
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
}
