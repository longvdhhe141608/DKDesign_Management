package DkDesignManagement.Service;


import DkDesignManagement.Entity.Task;
import DkDesignManagement.model.DashboardResponse;
import DkDesignManagement.model.TaskPageResponse;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;


@Service
public interface TaskService {

    int addTask(Task task);

    int addTaskeofLeader(int pid, int creid, int assid, String tname, Date sd, Date dl);

    List<Task> getListSubTask();

    List<Task> getListTaskExpiredToDay(int accountId);

    List<Task> getListTaskExpiredToDayDesign(int accountId);

    Task getTaskById(int taskId);

    Task getTaskByIdFullModel(int taskId);

    Task getTaskByIdFullModelForLeader(int taskId);


    int updateTask(Task task);

    int checkAndUpdateTaskDone(Task task);

    TaskPageResponse getListSubTask(int indexPage, int projectId, int status, String name, String accountId);

    TaskPageResponse getListSubTaskProcess(int indexPage, int projectId);

    boolean isLastTask(Task task);

    List<Task> getAllTaskByRequirementId(int requirementId);

    DashboardResponse getDashboard(int projectId);
}
