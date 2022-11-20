package DkDesignManagement.Entity;

import lombok.*;

@Builder
@NoArgsConstructor
@Data
@AllArgsConstructor
@Getter
@Setter
public class Status {

    private int id;
    private String statusAccount;
    private String statusProject;
    private String statusRequirement;
    private String statusTask;
}
