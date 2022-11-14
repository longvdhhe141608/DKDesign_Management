package DkDesignManagement.Repository;

import DkDesignManagement.Entity.Section;
import DkDesignManagement.Mapper.MapperSection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class SectionDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

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

    public Section getOneSectionBySectionID(int sectionID){

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
