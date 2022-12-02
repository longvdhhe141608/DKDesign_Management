package DkDesignManagement.Repository;

import DkDesignManagement.Entity.ImageAndFile;
import DkDesignManagement.Mapper.MapperImageAndFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class ImageAndFileDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public int getTotalFileBySubTaskID(int projectID, int subTaskID) {

        List<ImageAndFile> files = new ArrayList<>();
        String sql = "SELECT * FROM dkmanagement.image_and_file where project_id = ? And task_id = ?;";

        try {
            files = jdbcTemplate.query(sql, new MapperImageAndFile(), projectID, subTaskID);
            return files.size();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int updateFileBySubTaskID(String url, int projectID, int subTaskID) {

        int check = 0;
        String sql = "INSERT INTO `dkmanagement`.`image_and_file` (`project_id`, `task_id`, `file_url`) VALUES (?, ?, ?);\n";

        try {
            check = jdbcTemplate.update(sql, projectID, subTaskID, url);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public int uploadFileSummary(String url, int projectID) {
        int check = 0;
        String sql = "INSERT INTO `dkmanagement`.`image_and_file` (`project_id`, `file_url`) VALUES (?, ?);\n";

        try {
            check = jdbcTemplate.update(sql, projectID, url);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public List<ImageAndFile> getAllImageSummary(int pid) {
        String sql = "SELECT * FROM dkmanagement.image_and_file i where i.project_id = ? and i.task_id is null;";
        List<ImageAndFile> image = new ArrayList<>();
        try {
            image = jdbcTemplate.query(sql, new MapperImageAndFile(), pid);
            return image;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return image;
    }

    public int getTotalFile(int subTaskID) {

        List<ImageAndFile> files = new ArrayList<>();
        String sql = "SELECT * FROM dkmanagement.image_and_file where task_id = ?;";

        try {
            files = jdbcTemplate.query(sql, new MapperImageAndFile(), subTaskID);
            return files.size();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
}
