package DkDesignManagement.Service.Impl;



import DkDesignManagement.Entity.Task;
import DkDesignManagement.Repository.TaskDAO;
import DkDesignManagement.Service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class TaskServiceImpl implements TaskService {

   @Autowired
   TaskDAO taskDAO;

   @Override
   public int addTask(Task task) {
      return taskDAO.addTask(task);
   }
}
