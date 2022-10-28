package DkDesignManagement.Mapper;

import DkDesignManagement.Entity.Category;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MapperCategory implements RowMapper<Category> {

    @Override
    public Category mapRow(ResultSet resultSet, int i) throws SQLException {
        Category c = new Category();
        c.setIdCate(resultSet.getInt("idCategory"));
        c.setNameCate(resultSet.getString("Category_Name"));
        return c;
    }
}
