package DkDesignManagement.Service.Impl;

import DkDesignManagement.Entity.Employee;
import DkDesignManagement.Repository.EmployeeDao;
import DkDesignManagement.Service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeDao employeeDao;

    /**
     * @param id
     * @return
     */
    @Override
    public Employee getEmployeeByEmpId(int id) {
        return employeeDao.getEmployeeByEmpId(id);
    }

    /**
     * @param id
     * @return
     */
    @Override
    public Employee getEmployeeByAccId(int id) {
        return employeeDao.getInformation(id);
    }

    /**
     * @param email
     * @return
     */
    @Override
    public boolean emailIsExisted(String email) {
        List<String> emailList = employeeDao.getEmailList();
        for (String mail : emailList) {
            if (mail.equals(email)) {
                return true;
            }
        }
        return false;
    }

    /**
     * @param id
     * @return
     */
    @Override
    public Employee getInformation(int id) {
        return employeeDao.getInformation(id);
    }

    /**
     * @param employee
     */
    @Override
    public int updateProfile(Employee employee) {
        return employeeDao.updateProfile(employee);
    }
}
