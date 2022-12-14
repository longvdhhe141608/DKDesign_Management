package DkDesignManagement.Service;


import DkDesignManagement.Entity.Comment;
import DkDesignManagement.Model.CommentDto;
import DkDesignManagement.Model.ViewCommentDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CommentService {
    List<CommentDto> getAllCommentsByTaskId(int taskId);

    void addComment(Comment comment);

    Comment getCommentById(int id);

    void updatePinComment(int commentId);

    List<ViewCommentDto> getAllViewCommentByTaskId(int taskId);
}
