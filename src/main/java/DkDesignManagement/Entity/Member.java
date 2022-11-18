package DkDesignManagement.Entity;

import lombok.*;

import java.util.Date;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Member {
    private int memberId;
    private String memberName;
    private String memberCode;
    private int memberGender;
    private Date memberDob;
    private int memberRole;
    private String memberPhone;
    private String memberMail;
    private String memberAddress;
    private int memberStatus;
    private String memberCccd;
}
