package DkDesignManagement.Mapper;

import DkDesignManagement.model.MemberActiveDto;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MapperMemberActive implements RowMapper<MemberActiveDto> {

    @Override
    public MemberActiveDto mapRow(ResultSet rs, int rowNum) throws SQLException {
        MemberActiveDto dto = MemberActiveDto.builder()
                .employeeName(rs.getString("name"))
                .address(rs.getString("address"))
                .mobile(rs.getString("phone"))
                .email(rs.getString("email"))
                .roleName(rs.getString("roleName"))
                .build();
        return dto;
    }
}
