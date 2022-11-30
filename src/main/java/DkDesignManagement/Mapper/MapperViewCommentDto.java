package DkDesignManagement.Mapper;

import DkDesignManagement.model.ViewCommentDto;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MapperViewCommentDto implements RowMapper<ViewCommentDto> {

    @Override
    public ViewCommentDto mapRow(ResultSet rs, int rowNum) throws SQLException {
        ViewCommentDto dto = ViewCommentDto.builder()
                .id(rs.getInt("id"))
                .content(rs.getString("content"))
                .commentTime(rs.getDate("comment_time"))
                .taskId(rs.getInt("task_id"))
                .accId(rs.getInt("acc_id"))
                .isPin(rs.getBoolean("isPin"))
                .accountName(rs.getString("username"))
                .avatarUrl(rs.getString("avatar_url"))
                .build();
        return dto;
    }
}
