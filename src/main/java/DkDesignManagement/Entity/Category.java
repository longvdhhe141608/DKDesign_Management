package DkDesignManagement.Entity;

import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Category {
    private int id;
    private String category_name;
}
