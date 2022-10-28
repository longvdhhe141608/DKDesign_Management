package DkDesignManagement.Repository;

import DkDesignManagement.Entity.Employee;
import DkDesignManagement.Mapper.MapperEmployee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class EmployeeDao {
    @Autowired
    JdbcTemplate jdbcTemplate;

    public Employee getInformation(String acc) {
        String sql = "select * from `dkmanagement`.`employees` where Username = ?";
        Employee e = new Employee();
        e = jdbcTemplate.queryForObject(sql, new MapperEmployee(), acc);
        return e;
    }

}
