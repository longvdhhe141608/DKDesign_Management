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
                "(section_name, description, project_id, creator)\n" +
                "VALUES(:section_name, :description, :project_id, :creator);";

        Map<String, Object> params = new HashMap<>();
        params.put("section_name", section.getSectionName());
        params.put("description", section.getDescription());
        params.put("project_id", section.getProjectId());
        params.put("creator", section.getCreator());

        GeneratedKeyHolder generatedKeyHolder = new GeneratedKeyHolder();
        namedParameterJdbcTemplate.update(sql, new MapSqlParameterSource(params), generatedKeyHolder);
        return generatedKeyHolder.getKey().intValue();
    }
}