package DkDesignManagement.Service;

import DkDesignManagement.Entity.Member;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface MemberService {

    void addMemberToProject(int projectId, int memberId);

    List<Member> searchMemberInProject(int projectid, int role, String name);

    List<Member> getMemberInProject(int id);

    int getAccountIdByUsername(String username);

    void updateStatusMemberInProject(int id, int memberId, int status);

    List<Member> getAllMember();

    List<Member> getAllMemberInSearch(int role, String name);

    void addNewMember(String name, String mail, int id);

    void updateMemberStatus(int status, String username);
}
