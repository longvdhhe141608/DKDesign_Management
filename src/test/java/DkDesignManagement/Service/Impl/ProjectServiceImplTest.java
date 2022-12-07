package DkDesignManagement.Service.Impl;

import DkDesignManagement.Entity.Project;
import DkDesignManagement.Repository.ProjectDao;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class ProjectServiceImplTest {

    @InjectMocks
    private ProjectServiceImpl projectService;
    @Mock
    private ProjectDao projectDao;

    @Test
    void GivenListValue_getAllProject_ReturnListValue() {
        List<Project> projectList = new ArrayList<>();
        when(projectDao.getAll()).thenReturn(projectList);
        projectList = projectDao.getAll();
        int result = projectService.getProject().size();
        assertEquals(result, projectList.size());
    }

    @Test
    void GivenProjectValue_getProjectById_ReturnProjectValue() {
        int id = 3;
        Project projectMock = new Project();
        projectMock.setId(3);
        when(projectDao.getProject(anyInt())).thenReturn(projectMock);
        Project result = projectService.getProject(id);
        assertEquals(result.getId(), 3);
    }

    @Test
    void GivenProjectValue_addProject_ReturnProjectValue() {
    }

    @Test
    void GivenProjectValue_editProject_ReturnProjectValue() {
    }

    @Test
    void getAllProjectByAcc() {
    }

    @Test
    void getProjectByLeaderAcc() {
    }

    @Test
    void getProjectByAcc() {
    }
}