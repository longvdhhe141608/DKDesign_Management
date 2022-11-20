package DkDesignManagement.Mapper;

import DkDesignManagement.Entity.Roles;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MapperRole implements RowMapper<Roles> {

    @Override
    public Roles mapRow(ResultSet rs, int rowNum) throws SQLException {
        Roles roles = Roles.builder()
                .id(rs.getInt("id"))
                .name(rs.getString("name"))
                .build();
        return roles;
    }
}
