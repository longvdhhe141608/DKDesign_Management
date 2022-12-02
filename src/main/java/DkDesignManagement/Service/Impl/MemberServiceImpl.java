package DkDesignManagement.Service.Impl;

import DkDesignManagement.Entity.Member;
import DkDesignManagement.Repository.MemberDao;
import DkDesignManagement.Service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberServiceImpl implements MemberService {
    @Autowired
    private MemberDao memberDao;

    /**
     * @param projectId
     * @param memberId
     */
    @Override
    public void addMemberToProject(int projectId, int memberId) {
        memberDao.addMemberToProject(projectId, memberId);
    }

    /**
     * @param projectid
     * @param role
     * @param name
     * @return
     */
    @Override
    public List<Member> searchMemberInProject(int projectid, int role, String name) {
        return memberDao.searchMemberInProject(projectid, role, name);
    }

    /**
     * @param id
     * @return
     */
    @Override
    public List<Member> getMemberInProject(int projectId) {
        return memberDao.getMemberInProject(projectId);
    }

    /**
     * @param username
     * @return
     */
    @Override
    public int getAccountIdByUsername(String username) {
        return memberDao.getAccountIdByUsername(username);
    }

    /**
     * @param id
     * @param memberId
     * @param status
     */
    @Override
    public void updateStatusMemberInProject(int id, int memberId, int status) {
        memberDao.updateStatusMemberInProject(id, memberId, status);
    }
}
