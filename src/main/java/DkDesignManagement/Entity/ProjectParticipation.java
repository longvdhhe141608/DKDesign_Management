package DkDesignManagement.Entity;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Builder
@NoArgsConstructor
@Data
@AllArgsConstructor
public class ProjectParticipation {

    private int projectId;
    private int accountId;
    private int roleId;
    private int status;


}
