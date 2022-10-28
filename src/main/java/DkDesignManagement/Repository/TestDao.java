package DkDesignManagement.Repository;

import java.util.ArrayList;
import java.util.List;

import DkDesignManagement.Entity.Test;
import DkDesignManagement.Mapper.MapperTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class TestDao {

	@Autowired
	JdbcTemplate jdbcTemplate;

	public int add(Test obj) {
		int check = 0;
		String sql = "INSERT INTO `test`.`test` (`name`, `Testcol`)"
				+ " VALUES ('"+obj.getName()+"', '"+obj.getTestcol()+"');";
		check = jdbcTemplate.update(sql);
		return check;
	}

	public List<Test> getAll(){
		String sql = "SELECT * FROM `test`.`test`";
		List<Test> list = new ArrayList<Test>();
		list = jdbcTemplate.query(sql, new MapperTest());
		return list;
	}

	public Test getOne(int id) {
		String sql = "SELECT * FROM `test`.`test` WHERE id= ?";
		Test t = new Test();
		t = jdbcTemplate.queryForObject(sql, new MapperTest(), id);
		return t;
	}

	public int update(Test t) {
		String sql = "UPDATE `test`.`test` SET"
				+ " `name` = '"+t.getName()+"', `Testcol` = '"+t.getTestcol()+"' WHERE (`id` = '"+t.getId()+"');";
		int check  = 0;
		check = jdbcTemplate.update(sql);
		return check;
	}
}
