package DkDesignManagement.model;

import DkDesignManagement.Entity.Member;
import DkDesignManagement.Entity.Requirement;
import lombok.*;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MemberPageResponse {

    private List<Member> memberList;
    int endPage;

}
