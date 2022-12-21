package DkDesignManagement.Service;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.Employee;
import DkDesignManagement.Repository.EmployeeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public interface EmployeeService {
    @Autowired
    EmployeeDao employeeDao = new EmployeeDao();
    List<Employee> getAll();

    List<Employee> getAllToAdd(int projectId,Account account);

    public Employee getEmployeeByEmpId(int id);
    public Employee getEmployeeByAccId(int id);
    public Employee getEmployeeByEmail(String email);
    public boolean emailIsExisted(String email);
    Employee getInformation(int id);
    int updateProfile(Employee employee);

}
