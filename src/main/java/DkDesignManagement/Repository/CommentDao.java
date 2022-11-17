package DkDesignManagement.Repository;


import DkDesignManagement.Entity.Comment;
import DkDesignManagement.Entity.Project;
import DkDesignManagement.Entity.Task;
import DkDesignManagement.Mapper.MapperComment;
import DkDesignManagement.Mapper.MapperTask;
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
public class CommentDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    public List<Comment> getAllComments() {
        String sql = "select * from comment c ";

        return jdbcTemplate.query(sql, new MapperComment());
    }

    public List<Comment> getAllCommentsByTaskId(int taskId) {
        String sql = "select * from comment c where task_id = ? ";

        return jdbcTemplate.query(sql, new MapperComment(),taskId);
    }

    public int addComment(Comment comment) {
        String sql = "INSERT INTO dkmanagement.comment\n" +
                "(content, comment_time, task_id, acc_id)\n" +
                "VALUES(:content, :comment_time, :task_id, :acc_id );\n ";

        Map<String, Object> params = new HashMap<>();
        params.put("content", comment.getContent());
        params.put("comment_time", comment.getCommentTime());
        params.put("task_id", comment.getTaskId());
        params.put("acc_id", comment.getAccId());

        GeneratedKeyHolder generatedKeyHolder = new GeneratedKeyHolder();
        namedParameterJdbcTemplate.update(sql, new MapSqlParameterSource(params), generatedKeyHolder);
        return generatedKeyHolder.getKey().intValue();
    }

}
