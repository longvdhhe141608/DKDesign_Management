package DkDesignManagement.Entity;

import lombok.*;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Member {
    private int memberId;
    private String memberName;
    private String memberRole;
    private String memberPhone;
    private String memberMail;
    private String memberAddress;
    private boolean memberStatus;

}
