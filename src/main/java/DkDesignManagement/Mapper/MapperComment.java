package DkDesignManagement.Mapper;

import DkDesignManagement.Entity.Comment;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MapperComment implements RowMapper<Comment> {
    @Override
    public Comment mapRow(ResultSet resultSet, int i) throws SQLException {
        Comment comment = new Comment();
        comment.setId(resultSet.getInt("id"));
        comment.setContent(resultSet.getString("content"));
        comment.setCommentTime(resultSet.getTimestamp("comment_time"));
        comment.setTaskId(resultSet.getInt("task_id"));
        comment.setAccId(resultSet.getInt("acc_id"));
        comment.setPin(resultSet.getBoolean("isPin"));
        return comment;
    }
}