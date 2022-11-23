package DkDesignManagement.Service;



import DkDesignManagement.Entity.Task;
import DkDesignManagement.model.TaskPageResponse;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public interface TaskService {

   int addTask(Task task);

   List<Task> getListSubTask();

   Task getTaskById(int taskId);

   Task getTaskByIdFullModel(int taskId);

   int updateTask(Task task);

   int checkAndUpdateTaskDone(Task task);

   TaskPageResponse getListSubTask(int indexPage, int status);

   boolean isLastTask(Task task);
}
