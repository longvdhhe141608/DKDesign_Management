package DkDesignManagement.Entity;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ImageAndFile {

    private int id;
    private int projectId;
    private int taskId;
    private int poster;
    private String fileUrl;
    private Date posterDate;
}
