package DkDesignManagement.Service;



import DkDesignManagement.Entity.Task;
import DkDesignManagement.model.DashboardResponse;
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

   TaskPageResponse getListSubTask(int indexPage,int projectId, int status,String name ,String accountId);

   TaskPageResponse getListSubTaskProcess(int indexPage,int projectId);

   boolean isLastTask(Task task);

   List<Task> getAllTaskByRequirementId(int requirementId);

   DashboardResponse getDashboard(int projectId);
}
