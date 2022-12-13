package DkDesignManagement.Model;

import DkDesignManagement.Entity.Member;
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
