package DkDesignManagement.Service.Impl;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Entity.Project;
import DkDesignManagement.Entity.ProjectParticipation;
import DkDesignManagement.Repository.ProjectDao;
import DkDesignManagement.Repository.ProjectParticipationDao;
import DkDesignManagement.Service.ProjectService;
import DkDesignManagement.Model.ProjectPageResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class ProjectServiceImpl implements ProjectService {

    @Autowired
    ProjectDao projectDao;

    @Autowired
    ProjectParticipationDao projectParticipationDao;

    @Override
    public List<Project> getProject() {
        return projectDao.getAll();
    }

    @Override
    public Project getProject(int projectId) {
        return projectDao.getProject(projectId);
    }

    @Override
    public int addProject(Project project, Account account) {
        int idProject = projectDao.addNewProject(project);
        if (idProject == -1) {
            return -1;
        }
        ProjectParticipation pp = new ProjectParticipation(idProject, account.getId(), account.getRole_id(), 1);
        return projectParticipationDao.addProjectParticipation(pp);
    }

    @Override
    public int editProject(Project project) {
        return projectDao.editProject(project);
    }

    /**
     * @param id
     * @param textSearch
     * @param date
     * @param page
     * @return
     */
    @Override
    public ProjectPageResponse getAllProjectByAcc(int id, String textSearch, String date, int page) {

        int pageNumber = 10;
        int count = projectDao.getSizeProjectByAcc(id, textSearch, date);
        List<Project> listProject = projectDao.getAllProjectByAcc(pageNumber, page, id, textSearch, date, page);
        int endPage = count / pageNumber;
        if (count % pageNumber != 0) {
            endPage++;
        }

        List<Project> listSort = sortProject(listProject);

        return ProjectPageResponse.builder().endPage(endPage).projectList(listSort).build();

    }

    private List<Project> sortProject(List<Project> listProject) {
        List<Project> projectListProcess = new ArrayList<>();
        List<Project> projectListDone = new ArrayList<>();

        //split list
        for (Project project : listProject) {
            if (project.getStatus() != 3) {
                projectListProcess.add(project);
            } else {
                projectListDone.add(project);
            }
        }

        List<Project> projectListDeadline = new ArrayList<>();
        List<Project> projectListOverDeadline = new ArrayList<>();
        for (Project project : projectListProcess) {
            if(project.getClosureDate().before(new Date())){
                projectListDeadline.add(project);
            }else if(project.getClosureDate().after(new Date())){
                projectListOverDeadline.add(project);
            }
        }

        //sort by deadline
        List<Project>  projectListDeadlineSorted = projectListDeadline.stream()
                .sorted(Comparator.comparing(Project::getClosureDate).reversed()).collect(Collectors.toList());

        List<Project>  projectListOverDeadlineSorted = projectListOverDeadline.stream()
                .sorted(Comparator.comparing(Project::getClosureDate)).collect(Collectors.toList());

        List<Project> list = new ArrayList<>();
        list.addAll(projectListDeadlineSorted);
        list.addAll(projectListOverDeadlineSorted);
        list.addAll(projectListDone);

        return list;
    }

    /**
     * @param id
     * @return
     */
    @Override
    public List<Project> getProjectByLeaderAcc(int id) {
        return projectDao.getProjectByLeaderAcc(id);
    }

    /**
     * @param id
     * @return
     */
    @Override
    public List<Project> getProjectByAcc(int id) {
        return projectDao.getProjectByAcc(id);
    }
}
