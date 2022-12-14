package DkDesignManagement.Repository;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.Employee;
import DkDesignManagement.Mapper.MapperAccount;
import DkDesignManagement.Mapper.MapperEmployee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class EmployeeDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public Employee getInformation(int id) {
        String sql = "select * from `dkmanagement`.`employees` where id_acc = ?";
        Employee employee = jdbcTemplate.queryForObject(sql, new MapperEmployee(), id);
        return employee;
    }

    public List<Employee> getAll() {
        String sql = "select * from employees e ";
        List<Employee> employeeList;
        employeeList = jdbcTemplate.query(sql, new MapperEmployee());
        return employeeList;
    }


    /*
     * sua doi thong tin cua employee trong profile
     */
    public int updateProfile(Employee employee) {
        String sql = "UPDATE `dkmanagement`.`employees` " +
                "SET `name` = ?, `address` = ?, `gender` = ?, `dob` = ?, `cccd` = ?, `email` = ?, `phone` = ?" +
                "WHERE (`id` = ?)";
        return jdbcTemplate.update(sql, employee.getName(), employee.getAddress(), employee.getGender(), employee.getDob(), employee.getCccd(), employee.getMail(), employee.getPhone(), employee.getId());
    }

    public Employee getEmployeeByEmpId(int id){
        String sql = "select * from `dkmanagement`.`employees` where id = ?";
        Employee employee = jdbcTemplate.queryForObject(sql, new MapperEmployee(), id);
        return employee;
    }

    public List<String> getEmailList(){
        String sql = "SELECT `email` FROM `dkmanagement`.`employees`";
        List<String> emailList = jdbcTemplate.query(sql, new RowMapper<String>() {
            @Override
            public String mapRow(ResultSet rs, int rowNum) throws SQLException {
                return rs.getString("email");
            }
        });
        return  emailList;
    }

    public Employee getEmployeebyEmail(String mail){
        String sql = "SELECT * from dkmanagement.employees where email = ?";
        Employee employee = jdbcTemplate.queryForObject(sql, new MapperEmployee(), mail);
        return employee;
    }
}
