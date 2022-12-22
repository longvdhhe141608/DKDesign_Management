package DkDesignManagement.Service.Impl;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.Employee;
import DkDesignManagement.Entity.ProjectParticipation;
import DkDesignManagement.Repository.EmployeeDao;
import DkDesignManagement.Repository.ProjectParticipationDao;
import DkDesignManagement.Service.EmployeeService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    private EmployeeDao employeeDao;

    @Autowired
    ProjectParticipationDao projectParticipationDao;

    @Override
    public List<Employee> getAll() {
        return employeeDao.getAll();
    }

    @Override
    public List<Employee> getAllToAdd(int projectId,Account account) {
        List<Employee> list = employeeDao.getAll();
        List<Employee> listOutPut = new ArrayList<>();
        for (Employee employee : list) {
            if(account.getId() == employee.getId_acc()){
                continue;
            }
            ProjectParticipation projectParticipation = projectParticipationDao.getProjectParticipants(projectId,employee.getId_acc());
            if(ObjectUtils.isEmpty(projectParticipation)){
                listOutPut.add(employee);
            }else{
                if(projectParticipation.getStatus() != 2 ){
                    listOutPut.add(employee);
                }
            }

        }
        return listOutPut;
    }

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

    @Override
    public Employee getEmployeeByEmail(String email) {
        return employeeDao.getEmployeebyEmail(email);
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
