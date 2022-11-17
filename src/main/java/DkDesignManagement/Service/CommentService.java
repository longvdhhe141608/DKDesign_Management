package DkDesignManagement.Service;


import DkDesignManagement.Entity.Comment;
import DkDesignManagement.model.CommentDto;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CommentService {
     List<CommentDto> getAllCommentsByTaskId(int taskId);

     void addComment(Comment comment);

}
