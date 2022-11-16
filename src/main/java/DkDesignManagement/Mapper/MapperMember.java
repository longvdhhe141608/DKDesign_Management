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
        member.setMemberName(rs.getString("emp_name"));
        member.setMemberRole(rs.getString("role"));
        member.setMemberPhone(rs.getString("phone"));
        member.setMemberMail(rs.getString("email"));
        member.setMemberAddress(rs.getString("address"));
        member.setMemberStatus(rs.getBoolean("status"));
        return member;
    }
}
