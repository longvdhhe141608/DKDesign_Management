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
        Employee e;
        e = jdbcTemplate.queryForObject(sql, new MapperEmployee(), id);
        return e;
    }

    /*
     * sua doi thong tin cua employee trong profile
     */
    public void updateProfile(Employee employee){
        String sql = "UPDATE `dkmanagement`.`employees` " +
                "SET `address` = ?, `gender` = ?, `dob` = ?, `cccd` = ?, `email` = ?, `phone` = ?" +
                "WHERE (`id` = ?)";
        jdbcTemplate.update(sql, employee.getAddress(), employee.getGender(), employee.getDob(), employee.getCccd(), employee.getMail(), employee.getPhone(),employee.getId());
    }
}
