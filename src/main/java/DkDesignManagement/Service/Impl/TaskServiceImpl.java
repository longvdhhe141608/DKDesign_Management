package DkDesignManagement.Service.Impl;


import DkDesignManagement.Entity.Project;
import DkDesignManagement.Entity.Task;
import DkDesignManagement.Entity.Tasks;
import DkDesignManagement.Repository.*;
import DkDesignManagement.Service.TaskService;
import DkDesignManagement.model.DashboardResponse;
import DkDesignManagement.model.TaskPageResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static DkDesignManagement.utils.Constant.*;


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
    public DashboardResponse getDashboard(int projectId ,String designId) {
        //Tổng số công việc
        int countTask = taskDAO.countAllSubTaskByProjectId(projectId,designId);
        //Công việc đang làm
        int countSubTaskProcess = taskDAO.countAllSubTaskProcess(projectId,designId);
        //Công việc hoàn thành đúng hạn
        int countCorrectDeadline = taskDAO.countAllSubTaskCorrectDeadline(projectId,designId);
        //Công việc trễ hạn
        int countOverDeadline = taskDAO.countAllSubTaskOverDeadline(projectId,designId);
        //Công việc hoàn thành chậm tiến độ
        int countOverDeadlineDoneTask = taskDAO.countAllSubTaskOverDeadlineAndFinish(projectId,designId);

        return DashboardResponse.builder()
                .countTask(countTask)
                .countSubTaskProcess(countSubTaskProcess)
                .countCorrectDeadline(countCorrectDeadline)
                .countOverDeadline(countOverDeadline)
                .countOverDeadlineDoneTask(countOverDeadlineDoneTask)
                .build();
    }
}
