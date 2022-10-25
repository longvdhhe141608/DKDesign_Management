package DKDesignManagement.Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import DKDesignManagement.Entity.Test;
import org.springframework.jdbc.core.RowMapper;


public class MapperTest implements RowMapper<Test>{

	public Test mapRow(ResultSet rs, int rowNum) throws SQLException {
		Test d = new Test();
		d.setId(rs.getInt("id"));
		d.setName(rs.getString("name"));
		d.setTestcol(rs.getString("testcol"));
		return d;
	}

}
