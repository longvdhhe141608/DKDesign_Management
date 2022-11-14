package DkDesignManagement.Repository;

import DkDesignManagement.Entity.Section;
import DkDesignManagement.Mapper.MapperSection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;


import java.util.List;
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

   public List<Section> getAll() {
       String sql = "select * from section bt ";

       return jdbcTemplate.query(sql, new MapperSection());

   }
}
