package DkDesignManagement.Mapper;

import DkDesignManagement.Entity.Member;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MapperMember implements RowMapper<Member> {
    @Override
    public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
        Member member = new Member();
        member.setMemberId(rs.getInt("id"));
        member.setMemberName(rs.getString("name"));
        member.setMemberDob(rs.getDate("dob"));
        member.setMemberGender(rs.getInt("gender"));
        member.setMemberCode(rs.getString("username"));
        member.setMemberRole(rs.getInt("role_id"));
        member.setMemberPhone(rs.getString("phone"));
        member.setMemberMail(rs.getString("email"));
        member.setMemberAddress(rs.getString("address"));
        member.setMemberStatus(rs.getInt("status"));
        member.setMemberCccd(rs.getString("cccd"));
        return member;
    }
}
