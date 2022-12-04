package DkDesignManagement.Service;

import DkDesignManagement.Entity.Employee;
import DkDesignManagement.Repository.EmployeeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public interface EmployeeService {
    @Autowired
    EmployeeDao employeeDao = new EmployeeDao();
    public Employee getEmployeeByEmpId(int id);
    public Employee getEmployeeByAccId(int id);
    public boolean emailIsExisted(String email);
    Employee getInformation(int id);
    int updateProfile(Employee employee);

}
