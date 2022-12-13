package DkDesignManagement.Repository;


import DkDesignManagement.Entity.Comment;
import DkDesignManagement.Mapper.MapperComment;
import DkDesignManagement.Mapper.MapperViewCommentDto;
import DkDesignManagement.Model.ViewCommentDto;
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
        String sql = "select * from comment c where task_id = ? order by isPin desc, comment_time desc  ";

        return jdbcTemplate.query(sql, new MapperComment(), taskId);
    }

    public Comment getCommentById(int commentId) {
        String sql = "select * from comment c where id= ? ";

        try {
            Comment comment = jdbcTemplate.queryForObject(sql, new MapperComment(), commentId);
            return comment;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public int addComment(Comment comment) {
        String sql = "INSERT INTO dkmanagement.comment\n" +
                "(content, comment_time, task_id, acc_id ,isPin)\n" +
                "VALUES(:content, :comment_time, :task_id, :acc_id , :isPin );\n ";

        Map<String, Object> params = new HashMap<>();
        params.put("content", comment.getContent());
        params.put("comment_time", comment.getCommentTime());
        params.put("task_id", comment.getTaskId());
        params.put("acc_id", comment.getAccId());
        params.put("isPin", comment.isPin());

        GeneratedKeyHolder generatedKeyHolder = new GeneratedKeyHolder();
        namedParameterJdbcTemplate.update(sql, new MapSqlParameterSource(params), generatedKeyHolder);
        return generatedKeyHolder.getKey().intValue();
    }

    public int updateComment(Comment comment) {
        String sql = "UPDATE dkmanagement.comment\n" +
                "SET content=:content, comment_time=:comment_time, task_id=:task_id, acc_id=:acc_id, isPin=:isPin \n" +
                "WHERE id= :commentId;\n";

        Map<String, Object> params = new HashMap<>();
        params.put("content", comment.getContent());
        params.put("comment_time", comment.getCommentTime());
        params.put("task_id", comment.getTaskId());
        params.put("acc_id", comment.getAccId());
        params.put("isPin", comment.isPin());
        params.put("commentId", comment.getId());

        return namedParameterJdbcTemplate.update(sql, params);
    }

    public List<ViewCommentDto> getAllViewCommentByTaskId(int taskId) {
        List<ViewCommentDto> viewCommentDtos = new ArrayList<>();
        String sql = "select c.*, a.username, a.avatar_url from comment c \n" +
                "left join accounts a on a.id = c.acc_id\n" +
                "where task_id = ? order by isPin desc, comment_time desc  ";
        try {
            viewCommentDtos = jdbcTemplate.query(sql, new MapperViewCommentDto(), taskId);
            return viewCommentDtos;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
