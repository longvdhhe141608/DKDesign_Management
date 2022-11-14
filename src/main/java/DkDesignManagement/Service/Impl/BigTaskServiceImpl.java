package DkDesignManagement.Service.Impl;


import DkDesignManagement.Entity.BigTask;
import DkDesignManagement.Entity.Task;
import DkDesignManagement.Repository.AccountDao;
import DkDesignManagement.Repository.BigTaskDAO;
import DkDesignManagement.Repository.TaskDAO;
import DkDesignManagement.Service.BigTaskService;
import DkDesignManagement.model.BigTaskDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import java.util.ArrayList;
import java.util.List;

@Service
public class BigTaskServiceImpl implements BigTaskService {

     @Autowired
     BigTaskDAO bigTaskDAO;

     @Autowired
     TaskDAO taskDAO;

     @Autowired
     AccountDao accountDao;

     @Override
     public List<BigTaskDto> getAll() {
          List<BigTask> list = bigTaskDAO.getAll();
          List<BigTaskDto> listBigTask = new ArrayList<>();
          for(BigTask bigTask : list){
               BigTaskDto bigTaskDto = BigTaskDto.toBigTaskDto(bigTask);
               //get list task
               bigTaskDto.setListTask(taskDAO.getTaskByBigTaskId(bigTask.getId()));
               if(!ObjectUtils.isEmpty(bigTaskDto.getListTask())){
                   for(Task task : bigTaskDto.getListTask()){
                        //get name assign
                        String assignToName = accountDao.getAccountById(task.getAssignTo()).getUsername();
                        task.setAssignToName(assignToName);

                        //get list sub task
                        task.setListSubTask(taskDAO.getListSubTask(task.getTaskId()));
                        task.getListSubTask().stream().forEach(t->t.setAssignToName(assignToName));
                   }
               }

               listBigTask.add(bigTaskDto);
          }
          return listBigTask;
     }
}
