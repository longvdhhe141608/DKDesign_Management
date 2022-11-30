package DkDesignManagement.Service.Impl;


import DkDesignManagement.Entity.Comment;
import DkDesignManagement.Repository.AccountDao;
import DkDesignManagement.Repository.CommentDao;
import DkDesignManagement.Service.CommentService;
import DkDesignManagement.model.CommentDto;
import DkDesignManagement.model.ViewCommentDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    CommentDao commentDao;

    @Autowired
    AccountDao accountDao;

    @Override
    public List<CommentDto> getAllCommentsByTaskId(int taskId) {
        List<Comment> listComments = commentDao.getAllCommentsByTaskId(taskId);
        //java 8
        List<CommentDto> listCommentDto = listComments.stream().map(CommentDto::toCommentDto).collect(Collectors.toList());
        listCommentDto.forEach(n -> n.setAccountName(accountDao.getAccountById(n.getAccId()).getUsername()));
        return listCommentDto;
    }

    @Override
    public void addComment(Comment comment) {
        commentDao.addComment(comment);
    }

    @Override
    public Comment getCommentById(int id) {
        return commentDao.getCommentById(id);
    }

    @Override
    public void updatePinComment(int commentId) {
        Comment comment = commentDao.getCommentById(commentId);
        if(comment.isPin()){
            comment.setPin(false);
        }else{
            comment.setPin(true);
        }

        commentDao.updateComment(comment);
    }

    @Override
    public List<ViewCommentDto> getAllViewCommentByTaskId(int taskId) {
        List<ViewCommentDto> viewCommentDtos = commentDao.getAllViewCommentByTaskId(taskId);
        return viewCommentDtos;
    }
}
