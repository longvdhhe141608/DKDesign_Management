package DkDesignManagement.Repository;

import DkDesignManagement.Entity.Roles;
import DkDesignManagement.Mapper.MapperRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class RoleDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Roles> getAllRole(){
        List<Roles> roles = new ArrayList<>();
        String sql = "SELECT * FROM dkmanagement.roles;";

        try {
            roles = jdbcTemplate.query(sql, new MapperRole());
            return roles;
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
