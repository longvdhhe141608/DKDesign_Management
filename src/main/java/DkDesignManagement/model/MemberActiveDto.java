package DkDesignManagement.model;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MemberActiveDto {

    private String employeeName;
    private String roleName;
    private String mobile;
    private String email;
    private String address;
}
