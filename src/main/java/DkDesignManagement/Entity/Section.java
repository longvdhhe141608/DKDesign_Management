package DkDesignManagement.Entity;

import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Section {

    private int id;
    private String sectionName;
    private String description;
    private Long projectID;
    private Long creator;
}
