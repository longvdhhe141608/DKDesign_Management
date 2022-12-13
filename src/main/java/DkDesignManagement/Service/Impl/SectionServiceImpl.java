package DkDesignManagement.Service.Impl;


import DkDesignManagement.Entity.Section;
import DkDesignManagement.Entity.Task;
import DkDesignManagement.Repository.AccountDao;
import DkDesignManagement.Repository.SectionDAO;
import DkDesignManagement.Repository.TaskDAO;
import DkDesignManagement.Service.SectionService;
import DkDesignManagement.Model.SectionDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;

import java.util.ArrayList;
import java.util.List;

@Service
public class SectionServiceImpl implements SectionService {

    @Autowired
    SectionDAO sectionDAO;

    @Autowired
    TaskDAO taskDAO;

    @Autowired
    AccountDao accountDao;

    @Override
    public List<SectionDto> getAll(int projectId) {
        List<Section> list = sectionDAO.getAllSectionByProjectID(projectId);
        List<SectionDto> listBigTask = new ArrayList<>();
        for (Section section : list) {
            SectionDto sectionDto = SectionDto.toBigTaskDto(section);
            //get list task
            sectionDto.setListTask(taskDAO.getTaskByBigTaskId(section.getSectionId()));
            if (!ObjectUtils.isEmpty(sectionDto.getListTask())) {
                for (Task task : sectionDto.getListTask()) {
                    //get name assign
                    String assignToName = accountDao.getAccountById(task.getAssignToId()).getUsername();
                    task.setAssignToName(assignToName);

                    //get list sub task
                    task.setListSubTask(taskDAO.getListSubTask(task.getTaskId()));
                    task.getListSubTask().stream().forEach(t -> t.setAssignToName(assignToName));
                }
            }

            listBigTask.add(sectionDto);
        }
        return listBigTask;
    }

    @Override
    public int addSection(Section section) {
        return sectionDAO.addSection(section);
    }

    @Override
    public int editSection(String name, int id) {
        return sectionDAO.editSection(name, id);
    }

    @Override
    public void updateSection(Section section) {
        sectionDAO.updateSection(section);
    }

    @Override
    public Section getOneSectionBySectionID(int id) {
        return sectionDAO.getOneSectionBySectionID(id);
    }

    /**
     * @param id
     * @return
     */
    @Override
    public List<Section> getAllSectionByProjectID(int id) {
        return sectionDAO.getAllSectionByProjectID(id);
    }
}
