package DkDesignManagement.Service.Impl;


import DkDesignManagement.Entity.Task;
import DkDesignManagement.Repository.*;
import DkDesignManagement.Service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import java.util.List;

import static DkDesignManagement.utils.Constant.COMPLETE_STATUS;


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
    public List<Task> getListTask() {
        return taskDAO.getAllTaskLevel2();
    }

    @Override
    public Task getTaskById(int taskId) {
        Task task = taskDAO.getTaskById(taskId);

        //set value send FE
        task.setProjectName(projectDao.getProject(task.getProjectId()).getProjectName());
        task.setSectionName(section.getOneSectionBySectionID(task.getSectionId()).getSectionName());
        task.setListSubTask(taskDAO.getListSubTask(task.getTaskId()));
        task.setAssignToName(accountDao.getAccountById(task.getAssignToId()).getUsername());
        task.setNumberFileCurrent(taskDAO.countFile(task.getTaskId()));
        double workProgress = (task.getNumberFileCurrent() / (double) task.getFileNumber()) * 100;
        task.setWorkProgress(workProgress + "%");
        if(!ObjectUtils.isEmpty(task.getRequirementId())){
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
        int count = taskDAO.countTaskNoDone(task.getTaskId());
        //no done
        if(count == 0){
            //update
            task.setTaskStatus(COMPLETE_STATUS);//done status
            taskDAO.updateTask(task);
        }
        return task.getTaskStatus();
    }
}
