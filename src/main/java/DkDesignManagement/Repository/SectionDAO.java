package DkDesignManagement.Repository;

import DkDesignManagement.Entity.Project;
import DkDesignManagement.Entity.Section;
import DkDesignManagement.Mapper.MapperSection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.stereotype.Repository;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/*
 * TaskDAO xu ly 2 bang big_task va task
 * TaskDAO co the xem toan bo task va big_task theo project_id, xem detail task theo task_id
 * TaskDAO co them moi big_task, task, sub-task(task co khoa ngoai la 1 task cu)
 *
 */

@Repository
public class SectionDAO {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Autowired
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    public List<Section> getAll() {
        String sql = "select * from section bt ";
        return jdbcTemplate.query(sql, new MapperSection());
    }

    public int addSection(Section section) {
        String sql = "INSERT INTO dkmanagement.`section`\n" +
                "(section_name, description, project_id, creator, status)\n" +
                "VALUES(:section_name, :description, :project_id, :creator, 1);";

        Map<String, Object> params = new HashMap<>();
        params.put("section_name", section.getSectionName());
        params.put("description", section.getDescription());
        params.put("project_id", section.getProjectId());
        params.put("creator", section.getCreator());
        params.put("status", 1);

        GeneratedKeyHolder generatedKeyHolder = new GeneratedKeyHolder();
        namedParameterJdbcTemplate.update(sql, new MapSqlParameterSource(params), generatedKeyHolder);
        return generatedKeyHolder.getKey().intValue();
    }

    public int editSection(String name, int id) {
        String sql = "update `dkmanagement`.`section`\n" +
                "set  section_name = ?\n" +
                "where id = ?";
        int check = 0;
        check = jdbcTemplate.update(sql, name, id);
        return check;
    }

    public List<Section> getAllSectionByProjectID(int projectID) {

        List<Section> sectionList = new ArrayList<>();
        String sql = "SELECT * FROM dkmanagement.section WHERE project_id= ?";

        try {
            sectionList = jdbcTemplate.query(sql, new MapperSection(), projectID);

            return sectionList;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public Section getOneSectionBySectionID(int sectionID) {

        Section section = new Section();
        String sql = "SELECT * FROM dkmanagement.section WHERE id= ?";

        try {
            section = jdbcTemplate.queryForObject(sql, new MapperSection(), sectionID);
            return section;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

}
