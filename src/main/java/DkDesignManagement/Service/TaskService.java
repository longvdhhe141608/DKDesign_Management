package DkDesignManagement.Service;



import DkDesignManagement.Entity.Task;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public interface TaskService {

   int addTask(Task task);

   List<Task>  getListTask();

   Task getTaskById(int taskId);

   Task getSubTaskById(int taskId);
}
