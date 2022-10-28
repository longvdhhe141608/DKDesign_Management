package DkDesignManagement.Mapper;

import DkDesignManagement.Entity.Member;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MapperMember implements RowMapper<Member> {
    @Override
    public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
        Member member = new Member();
        member.setMemberName(rs.getString("Name"));
        member.setMemberRole(rs.getInt("Role in project"));
        member.setMemberPhone(rs.getString("Phone number"));
        member.setMemberMail(rs.getString("mail"));
        member.setMemberAddress(rs.getString("Name"));
        member.setMemberStatus(rs.getString("Status"));
        return member;
    }
}
