package DkDesignManagement.Mapper;

import DkDesignManagement.Entity.Employee;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MapperEmployee implements RowMapper<Employee> {
    @Override
    public Employee mapRow(ResultSet resultSet, int i) throws SQLException {
        Employee e = new Employee();
        e.setId(resultSet.getInt("id"));
        e.setName(resultSet.getString("name"));
        e.setAge(resultSet.getInt("Age"));
        e.setAddress(resultSet.getString("address"));
        e.setGender(resultSet.getInt("gender"));
        e.setDob(resultSet.getDate("dob"));
        e.setCccd(resultSet.getString("cccd"));
        e.setMail(resultSet.getString("Mail"));
        e.setPhone(resultSet.getString("phone"));
        e.setId_acc(resultSet.getInt("id_acc"));
        return e;
    }
}
