package DkDesignManagement.Mapper;

import DkDesignManagement.Entity.Section;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MapperSection implements RowMapper<Section> {
    /**
     * @param rs: resultSet
     * @return
     * @throws SQLException
     */
    @Override
    public Section mapRow(ResultSet rs, int rowNum) throws SQLException {
        Section section = new Section();

        section.setSectionId(rs.getInt("id"));
        section.setSectionName(rs.getString("section_name"));
        section.setDescription(rs.getString("description"));
        section.setProjectId(rs.getInt("project_id"));
        section.setCreator(rs.getInt("creator"));
        section.setStatus(rs.getInt("status"));

        return section;
    }
}
