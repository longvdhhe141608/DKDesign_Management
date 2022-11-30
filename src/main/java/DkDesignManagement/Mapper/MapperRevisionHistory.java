package DkDesignManagement.Mapper;


import DkDesignManagement.Entity.RevisionHistory;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MapperRevisionHistory implements RowMapper<RevisionHistory> {
    @Override
    public RevisionHistory mapRow(ResultSet resultSet, int i) throws SQLException {
        RevisionHistory revisionHistory = new RevisionHistory();
        revisionHistory.setId(resultSet.getInt("id"));
        revisionHistory.setTable_id(resultSet.getInt("table_id"));
        revisionHistory.setRevision_no(resultSet.getInt("revision_no"));
        revisionHistory.setRevision_date(resultSet.getTimestamp("revision_date"));
        revisionHistory.setRevision_detail(resultSet.getString("revision_detail"));
        revisionHistory.setType(resultSet.getString("type"));
        return revisionHistory  ;
    }
}