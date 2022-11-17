package DkDesignManagement.model;

import DkDesignManagement.Entity.Comment;
import DkDesignManagement.utils.DateUtils;
import lombok.*;

import java.util.Date;


@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class CommentDto {
    private int id ;
    private String content ;
    private Date commentTime;
    private int taskId ;
    private int accId;
    //model new
    private String accountName ;
    private String dateCountDown;

    public static CommentDto toCommentDto(Comment comment){
        return CommentDto.builder()
                .id(comment.getId())
                .content(comment.getContent())
                .commentTime(comment.getCommentTime())
                .taskId(comment.getTaskId())
                .accId(comment.getAccId())
                .dateCountDown(DateUtils.getDateString(comment.getCommentTime()))
                .build();
    }
}
