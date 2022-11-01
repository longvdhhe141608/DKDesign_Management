package DkDesignManagement.Mapper;

import DkDesignManagement.Entity.Employee;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MapperEmployee implements RowMapper<Employee> {
    @Override
    public Employee mapRow(ResultSet resultSet, int i) throws SQLException {
        Employee e = new Employee();
        e.setIdEmp(resultSet.getInt("idEmp"));
        e.setName(resultSet.getString("Name"));
        e.setGender(resultSet.getString("Gender"));
        e.setAge(resultSet.getInt("Age"));
        e.setMail(resultSet.getString("Mail"));
        e.setPhone(resultSet.getString("Phone"));
        e.setCccd(resultSet.getString("CCCD"));
        return e;
    }
}
