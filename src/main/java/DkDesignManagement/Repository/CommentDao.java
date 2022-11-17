package DkDesignManagement.Repository;


import DkDesignManagement.Entity.Comment;
import DkDesignManagement.Entity.Task;
import DkDesignManagement.Mapper.MapperComment;
import DkDesignManagement.Mapper.MapperTask;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class CommentDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Comment> getAllComments() {
        String sql = "select * from comment c ";

        return jdbcTemplate.query(sql, new MapperComment());
    }

    public List<Comment> getAllCommentsByTaskId(int taskId) {
        String sql = "select * from comment c where task_id = ? ";

        return jdbcTemplate.query(sql, new MapperComment(),taskId);
    }

}
