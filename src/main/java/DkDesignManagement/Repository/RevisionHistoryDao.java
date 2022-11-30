package DkDesignManagement.Repository;


import DkDesignManagement.Entity.Comment;
import DkDesignManagement.Entity.RevisionHistory;
import DkDesignManagement.Mapper.MapperComment;
import DkDesignManagement.Mapper.MapperRevisionHistory;
import DkDesignManagement.Mapper.MapperViewCommentDto;
import DkDesignManagement.model.ViewCommentDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class RevisionHistoryDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    public List<RevisionHistory> getAlLRevisionHistory() {
        String sql = "select * from revision_history";

        return jdbcTemplate.query(sql, new MapperRevisionHistory());
    }

    public List<RevisionHistory> getAlLRevisionHistoryOfTable(int tableId, String type) {
        String sql = "select * from revision_history rh where table_id  = ? and `type` = ? order by rh.revision_no desc ";

        return jdbcTemplate.query(sql, new MapperRevisionHistory(), tableId, type);
    }


    public int addHistory(RevisionHistory revisionHistory) {
        String sql = "INSERT INTO dkmanagement.revision_history\n" +
                "(table_id, revision_no, revision_date, revision_detail, `type`)\n" +
                "VALUES(:table_id, :revision_no, :revision_date, :revision_detail, :type );\n";

        Map<String, Object> params = new HashMap<>();
        params.put("table_id", revisionHistory.getTable_id());
        params.put("revision_no", revisionHistory.getRevision_no());
        params.put("revision_date", revisionHistory.getRevision_date());
        params.put("revision_detail", revisionHistory.getRevision_detail());
        params.put("type", revisionHistory.getType());

        GeneratedKeyHolder generatedKeyHolder = new GeneratedKeyHolder();
        namedParameterJdbcTemplate.update(sql, new MapSqlParameterSource(params), generatedKeyHolder);
        return generatedKeyHolder.getKey().intValue();
    }

}
