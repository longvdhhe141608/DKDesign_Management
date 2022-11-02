package DkDesignManagement.Repository;

import DkDesignManagement.Entity.Category;
import DkDesignManagement.Mapper.MapperCategory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    public Category getCategoryByName(String s){
        String sql = "SELECT * FROM `dkmanagement`.`category` where `category`.`category_name` like N'"+ s +"';";
        Category c = new Category();
        c = jdbcTemplate.queryForObject(sql, new MapperCategory(), s);
        return c;
    }
}
