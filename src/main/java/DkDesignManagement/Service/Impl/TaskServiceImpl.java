package DkDesignManagement.Service.Impl;


import DkDesignManagement.Entity.Task;
import DkDesignManagement.Repository.*;
import DkDesignManagement.Service.TaskService;
import DkDesignManagement.model.TaskPageResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import java.math.BigInteger;
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
    public List<Task> getListSubTask() {
        return taskDAO.getAllTaskLevel2();
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
        double workProgress = (task.getNumberFileCurrent() / (double) task.getFileNumber()) * 100;
        task.setWorkProgress(workProgress + "%");
        if (!ObjectUtils.isEmpty(task.getRequirementId())) {
            task.setRequirementName(requirementDao.getRequirementById(task.getRequirementId().intValue()).getRequirementName());
        }

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
    public TaskPageResponse getListSubTask(int indexPage, int status) {
        int pageNumber = 10;
        int count = taskDAO.countSubTask(String.valueOf(status));
        List<Task> listTask = taskDAO.getAllSubTask(pageNumber, indexPage, String.valueOf(status));
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
    public boolean isLastTask(Task task) {
       //get list sub task of task level 2
        List<Task> listSubTask = taskDAO.getListSubTask(task.getTaskfId().intValue());
        boolean checkIsLastTask = true;
        for (Task subTask : listSubTask) {
            if(subTask.getTaskStatus() != COMPLETE_TASK_STATUS){
                checkIsLastTask = false;
            }
        }
        return checkIsLastTask;
    }
}
