package DkDesignManagement.Service.Impl;


import DkDesignManagement.Entity.Project;
import DkDesignManagement.Entity.Task;
import DkDesignManagement.Entity.Tasks;
import DkDesignManagement.Repository.*;
import DkDesignManagement.Service.TaskService;
import DkDesignManagement.Model.DashboardResponse;
import DkDesignManagement.Model.MyTaskDto;
import DkDesignManagement.Model.TaskPageResponse;
import DkDesignManagement.Model.TaskWaitDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static DkDesignManagement.Utils.Constant.*;


@Service
public class TaskServiceImpl implements TaskService {

    @Autowired
    TaskDAO taskDAO;

    @Autowired
    ProjectDao projectDao;

    @Autowired
    SectionDAO section;

    @Autowired
    AccountDao accountDao;

    @Autowired
    RequirementDao requirementDao;

    @Override
    public int addTask(Task task) {
        return taskDAO.addTask(task);
    }

    @Override
    public int addTaskeofLeader(int pid, int creid, int assid, String tname, Date sd, Date dl) {
        return taskDAO.addTaskofLeader(pid, creid, assid, tname, sd, dl);
    }

    @Override
    public List<Task> getListSubTask() {
        return taskDAO.getAllTaskLevel2();
    }

    @Override
    public List<Task> getListTaskExpiredToDay(int accountId) {
        List<Project> listProject = projectDao.getAllProjectByCreated(accountId);
        List<Task> listTaskExpired = new ArrayList<>();
        for (Project project : listProject) {
            List<Task> listTask = taskDAO.getAllSubTaskExpiredToDay(project.getId());
            listTaskExpired.addAll(listTask);
        }

        return listTaskExpired;
    }

    @Override
    public List<Task> getListTaskExpiredToDayDesign(int accountId) {
        return taskDAO.getAllSubTaskExpiredToDayDesign(accountId);
    }

    @Override
    public Task getTaskById(int taskId) {
        return taskDAO.getTaskById(taskId);
    }

    @Override
    public Task getTaskByIdFullModel(int taskId) {
        Task task = taskDAO.getTaskById(taskId);

        //set value send FE
        task.setProjectName(projectDao.getProject(task.getProjectId()).getProjectName());
        task.setSectionName(section.getOneSectionBySectionID(task.getSectionId()).getSectionName());
        task.setListSubTask(taskDAO.getListSubTask(task.getTaskId()));
        task.setAssignToName(accountDao.getAccountById(task.getAssignToId()).getUsername());
        task.setNumberFileCurrent(taskDAO.countFile(task.getTaskId()));
//        double workProgress = (task.getNumberFileCurrent() / 1.0 * task.getFileNumber()) * 100;
        float workProgress = Math.round(task.getNumberFileCurrent() / (1.0 * task.getFileNumber()) * 100);
        task.setWorkProgress(workProgress + "%");
        if (!ObjectUtils.isEmpty(task.getRequirementId())) {
            task.setRequirementName(requirementDao.getRequirementById(task.getRequirementId().intValue()).getRequirementName());
        }

        return task;
    }

    @Override
    public Task getTaskByIdFullModelForLeader(int taskId) {
        Task task = taskDAO.getTaskById(taskId);
        //set value send FE
        task.setProjectName(projectDao.getProject(task.getProjectId()).getProjectName());
        task.setAssignToName(accountDao.getAccountById(task.getAssignToId()).getUsername());
        return task;
    }

    @Override
    public int updateTask(Task task) {
        return taskDAO.updateTask(task);
    }

    @Override
    public int checkAndUpdateTaskDone(Task task) {
        //check task new create
        if (task.getTaskStatus() == NOT_APPROVED_TASK_STATUS) {
            return task.getTaskStatus();
        }
        //check new task create of leader
        if (task.getTaskStatus() == PROCESS_TASK_STATUS && ObjectUtils.isEmpty(task.getListSubTask())) {
            return task.getTaskStatus();
        }
        //check personal task of leader
        if (task.getTaskStatus() == PROCESS_TASK_STATUS && (task.getTaskfId() == null && ObjectUtils.isEmpty(task.getSectionId()))) {
            return task.getTaskStatus();
        }

        int count = taskDAO.countTaskNoDone(task.getTaskId());

        //no done
        if (count == 0 && task.getTaskStatus() != 4) {
            //update
            task.setTaskStatus(COMPLETE_TASK_STATUS);//done status
            taskDAO.updateTask(task);
        } else if (count != 0 && task.getTaskStatus() == 4) {
            task.setTaskStatus(PROCESS_TASK_STATUS);//done status
            taskDAO.updateTask(task);
        }
        return task.getTaskStatus();
    }


    @Override
    public TaskPageResponse getListSubTask(int indexPage, int projectId, int status, String name, String accountId) {
        int pageNumber = 10;
        int count = taskDAO.countSubTask(projectId, String.valueOf(status), name, accountId);
        List<Task> listTask = taskDAO.getAllSubTask(pageNumber, indexPage, projectId, String.valueOf(status), name, accountId);
        int endPage = count / pageNumber;
        if (count % pageNumber != 0) {
            endPage++;
        }

        for (Task task : listTask) {
            task.setAssignToName(accountDao.getAccountById(task.getAssignToId()).getUsername());
        }

        return TaskPageResponse.builder().endPage(endPage).tasksList(listTask).build();
    }

    @Override
    public TaskPageResponse getListSubTaskProcess(int indexPage, int projectId) {
        int pageNumber = 10;
        int count = taskDAO.countSubTaskViewProcess(projectId);
        List<Task> listTask = taskDAO.getAllSubTaskViewProcess(pageNumber, indexPage, projectId);
        int endPage = count / pageNumber;
        if (count % pageNumber != 0) {
            endPage++;
        }

        for (Task task : listTask) {
            task.setAssignToName(accountDao.getAccountById(task.getAssignToId()).getUsername());
            task.setNumberFileCurrent(taskDAO.countFile(task.getTaskId()));
            double workProgress = (task.getNumberFileCurrent() / (double) task.getFileNumber()) * 100;
            task.setWorkProgress(workProgress + "%");
        }

        return TaskPageResponse.builder().endPage(endPage).tasksList(listTask).build();
    }

    @Override
    public boolean isLastTask(Task task) {
        //get list sub task of task level 2
        List<Task> listSubTask = taskDAO.getListSubTask(task.getTaskfId().intValue());
        boolean checkIsLastTask = true;
        for (Task subTask : listSubTask) {
            if (subTask.getTaskStatus() != COMPLETE_TASK_STATUS) {
                //can hoi long de review lai
                checkIsLastTask = false;
            }
        }
        return checkIsLastTask;
    }

    @Override
    public List<Task> getAllTaskByRequirementId(int requirementId) {
        return taskDAO.getAllTaskByRequirementId(requirementId);
    }

    @Override
    public List<Task> getAllTaskByProjectId(int projectId) {
        return taskDAO.getAllTaskByProjectId(projectId);
    }

    @Override
    public DashboardResponse getDashboard(int projectId, String designId) {
        //Tổng số công việc
        int countTask = taskDAO.countAllSubTaskByProjectId(projectId, designId);
        //Công việc đang làm
        int countSubTaskProcess = taskDAO.countAllSubTaskProcess(projectId, designId);
        //Công việc hoàn thành đúng hạn
        int countCorrectDeadline = taskDAO.countAllSubTaskCorrectDeadline(projectId, designId);
        //Công việc trễ hạn
        int countOverDeadline = taskDAO.countAllSubTaskOverDeadline(projectId, designId);
        //Công việc hoàn thành chậm tiến độ
        int countOverDeadlineDoneTask = taskDAO.countAllSubTaskOverDeadlineAndFinish(projectId, designId);

        return DashboardResponse.builder()
                .countTask(countTask)
                .countSubTaskProcess(countSubTaskProcess)
                .countCorrectDeadline(countCorrectDeadline)
                .countOverDeadline(countOverDeadline)
                .countOverDeadlineDoneTask(countOverDeadlineDoneTask)
                .build();
    }

    /**
     * @param id
     * @param textSearch
     * @return
     */
    @Override
    public int getTotalAllMyTaskLeader(int id, String textSearch) {
        return taskDAO.getTotalAllMyTaskLeader(id, textSearch);
    }

    /**
     * @param taskId
     */
    @Override
    public List<Tasks> getAllSubTasksByTaskID(int taskId) {
        return taskDAO.getAllSubTasksByTaskID(taskId);
    }

    /**
     * @param id
     * @param page
     * @param textSearch
     * @return
     */
    @Override
    public List<MyTaskDto> getAllMyTaskLeader(int id, int page, String textSearch) {
        return taskDAO.getAllMyTaskLeader(id, page, textSearch);
    }

    /**
     * @param taskID
     * @return
     */
    @Override
    public Tasks getOneTasksByTaskID(int taskID) {
        return taskDAO.getOneTasksByTaskID(taskID);
    }

    /**
     * @param id
     * @param sectionId
     * @param id1
     * @return
     */
    @Override
    public List<Tasks> getAllSubTasksByProjectIDAndSectionIDAndTaskID(int id, int sectionId, int id1) {
        return taskDAO.getAllSubTasksByProjectIDAndSectionIDAndTaskID(id, sectionId, id1);
    }

    /**
     * @param subTaskID
     * @param id
     * @return
     */
    @Override
    public Tasks getOneSubTaskBySubTaskID(int subTaskID, int id) {
        return taskDAO.getOneSubTaskBySubTaskID(subTaskID, id);
    }

    /**
     * @param id
     * @param index
     * @param textSearch
     * @return
     */
    @Override
    public List<MyTaskDto> getAllMyTask(int id, int index, String textSearch) {
        return taskDAO.getAllMyTask(id, index, textSearch);
    }

    /**
     * @param id
     * @param textSearch
     * @return
     */
    @Override
    public int getTotalAllMyTask(int id, String textSearch) {
        return taskDAO.getTotalAllMyTask(id, textSearch);
    }

    /**
     * @param id
     * @param editSubTask
     * @return
     */
    @Override
    public int updateSubTaskByDesign(int id, Tasks editSubTask) {
        return taskDAO.updateSubTaskByDesign(id, editSubTask);
    }

    /**
     * @param id
     * @param statusTask
     * @param textSearch
     * @param id1
     * @return
     */
    @Override
    public int totalTaskWait(int id, int statusTask, String textSearch, int id1) {
        return taskDAO.totalTaskWait(id, statusTask, textSearch, id1);
    }

    /**
     * @param id
     * @param index
     * @param statusTask
     * @param textSearch
     * @param id1
     * @return
     */
    @Override
    public List<TaskWaitDto> getAllTaskWaitByDesign(int id, int index, int statusTask, String textSearch, int id1) {
        return taskDAO.getAllTaskWaitByDesign(id, index, statusTask, textSearch, id1);
    }

    /**
     * @param subTaskID
     * @param i
     * @return
     */
    @Override
    public int updateStatusSubTaskByDesign(int subTaskID, int i) {
        return taskDAO.updateStatusSubTaskByDesign(subTaskID, i);
    }

    /**
     * @param id
     * @param sectionId
     * @return
     */
    @Override
    public List<Tasks> getAllTasksByProjectIDAndSectionID(int id, int sectionId) {
        return taskDAO.getAllTasksByProjectIDAndSectionID(id,sectionId);
    }

    /**
     * @param id
     * @param sectionId
     * @param id1
     * @return
     */
    @Override
    public List<Tasks> getTotalFileSubTasksByProjectIDAndSectionIDAndTaskID(int id, int sectionId, int id1) {
        return taskDAO.getTotalFileSubTasksByProjectIDAndSectionIDAndTaskID(id,sectionId,id1);
    }

    @Override
    public List<Task> getAllTasksBySectionID(int sectionId) {
        return taskDAO.getAllTaskBySection(sectionId);
    }
}
