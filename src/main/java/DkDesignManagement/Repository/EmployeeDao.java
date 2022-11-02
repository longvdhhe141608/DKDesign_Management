package DkDesignManagement.Repository;

import DkDesignManagement.Entity.Employee;
import DkDesignManagement.Mapper.MapperEmployee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class EmployeeDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public Employee getInformation(int id) {
        String sql = "select * from `dkmanagement`.`employees` where id_acc = ?";
        Employee e = new Employee();
        e = jdbcTemplate.queryForObject(sql, new MapperEmployee(), id);
        return e;
    }

}
