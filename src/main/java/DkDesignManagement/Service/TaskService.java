package DkDesignManagement.Service;



import DkDesignManagement.Entity.Task;
import org.springframework.stereotype.Service;



@Service
public interface TaskService {

   int addTask(Task task);
}
