package DkDesignManagement.Entity;

import lombok.*;

@Builder
@NoArgsConstructor
@Data
@AllArgsConstructor
@Getter
@Setter
public class Section {
    private int sectionId;
    private String sectionName;
    private String description;
    private int projectId;
    private int creator;
    private int status;
}
