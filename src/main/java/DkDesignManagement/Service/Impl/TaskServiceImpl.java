package DkDesignManagement.Service.Impl;



import DkDesignManagement.Entity.Task;
import DkDesignManagement.Repository.ProjectDao;
import DkDesignManagement.Repository.RequirementDao;
import DkDesignManagement.Repository.SectionDAO;
import DkDesignManagement.Repository.TaskDAO;
import DkDesignManagement.Service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class TaskServiceImpl implements TaskService {

   @Autowired
   TaskDAO taskDAO;

   @Autowired
   RequirementDao requirementDao;

   @Autowired
   ProjectDao projectDao;

   @Autowired
   SectionDAO section;

   @Override
   public int addTask(Task task) {
      return taskDAO.addTask(task);
   }

   @Override
   public Task getTaskById(int taskId) {
      Task task = taskDAO.getTaskById(taskId);
      task.setRequirementName(requirementDao.getRequirementById(task.getRequirementId()).getRequirementName());
      task.setProjectName(projectDao.getProject(task.getProjectId()).getProjectName());
      task.setSectionName(section.getOneSectionBySectionID(task.getSectionId()).getSectionName());
      task.setListSubTask(taskDAO.getListSubTask(task.getTaskId()));
      task.setTaskfName(taskDAO.getTaskById(task.getTaskfId().intValue()).getTaskName());

      return task ;
   }
}
