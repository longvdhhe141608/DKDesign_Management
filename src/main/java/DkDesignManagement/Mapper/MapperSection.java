package DkDesignManagement.Mapper;

import DkDesignManagement.Entity.Section;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MapperSection implements RowMapper<Section> {

    @Override
    public Section mapRow(ResultSet rs, int rowNum) throws SQLException {

        Section section = Section.builder()
                .id(rs.getInt("id"))
                .sectionName(rs.getString("section_name"))
                .description(rs.getString("description"))
                .projectID(rs.getLong("project_id"))
                .creator(rs.getLong("creator"))
                .build();

        return section;
    }
}
