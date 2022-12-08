package DkDesignManagement.Service;

import DkDesignManagement.Entity.Member;
import DkDesignManagement.model.MemberPageResponse;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public interface MemberService {

    void addMemberToProject(int projectId, int memberId);

    List<Member> searchMemberInProject(int projectId, int role, String name);

    MemberPageResponse getMemberInProject(int indexPage,int projectId);

    int getAccountIdByUsername(String username);

    void updateStatusMemberInProject(int id, int memberId, int status);

    List<Member> getAllMember();

    List<Member> getAllMemberInSearch(int role, String name);

    void addNewMember(String name, String mail, int id);

    void updateMemberStatus(int status, String username);

    Member getMemberByMemberId(int id);

    void updateMemberRole(int role, String username);

    int updateMemberInfo(int id, String name, int gender, Date dob, String phone, String mail, String address, String cccd);
}
