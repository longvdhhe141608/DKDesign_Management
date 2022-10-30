package DkDesignManagement.Entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Member {

    private String memberName;
    private int memberRole;
    private String memberPhone;
    private String memberMail;
    private String memberAddress;
    private String memberStatus;

}
