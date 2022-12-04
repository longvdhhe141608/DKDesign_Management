package DkDesignManagement.Service;


import DkDesignManagement.Entity.Task;
import DkDesignManagement.Entity.Tasks;
import DkDesignManagement.model.DashboardResponse;
import DkDesignManagement.model.MyTaskDto;
import DkDesignManagement.model.TaskPageResponse;
import DkDesignManagement.model.TaskWaitDto;
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

    DashboardResponse getDashboard(int projectId , String designId);

    int getTotalAllMyTaskLeader(int id, String textSearch);

    List<Tasks> getAllSubTasksByTaskID(int taskId);

    List<MyTaskDto> getAllMyTaskLeader(int id, int page, String textSearch);

    Tasks getOneTasksByTaskID(int taskID);

    List<Tasks> getAllSubTasksByProjectIDAndSectionIDAndTaskID(int id, int sectionId, int id1);

    Tasks getOneSubTaskBySubTaskID(int subTaskID, int id);

    List<MyTaskDto> getAllMyTask(int id, int index, String textSearch);

    int getTotalAllMyTask(int id, String textSearch);

    int updateSubTaskByDesign(int id, Tasks editSubTask);

    int totalTaskWait(int id, int statusTask, String textSearch, int id1);

    List<TaskWaitDto> getAllTaskWaitByDesign(int id, int index, int statusTask, String textSearch, int id1);

    int updateStatusSubTaskByDesign(int subTaskID, int i);

    List<Tasks> getAllTasksByProjectIDAndSectionID(int id, int sectionId);

    List<Tasks> getTotalFileSubTasksByProjectIDAndSectionIDAndTaskID(int id, int sectionId, int id1);
}
