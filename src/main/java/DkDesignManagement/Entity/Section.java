package DkDesignManagement.Entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@Data
@AllArgsConstructor
public class Section {
    private int sectionId;
    private String sectionName;
    private String description;
    private int projectId;
    private int creator;

}
