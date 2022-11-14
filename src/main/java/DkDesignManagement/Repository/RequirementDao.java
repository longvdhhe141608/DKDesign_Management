package DkDesignManagement.Repository;


import DkDesignManagement.Entity.Requirement;

import DkDesignManagement.Mapper.MapperRequirement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;


import java.util.List;

@Repository
public class RequirementDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Requirement>  getAll() {
        String sql = "select * from requirement r ";

        return jdbcTemplate.query(sql, new MapperRequirement());
    }

}
