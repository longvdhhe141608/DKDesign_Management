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
        String sql = "SELECT * FROM dkmanagement.image_and_file where project_id = ? And task_id = ? and status= 1;";

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
        String sql = "INSERT INTO `dkmanagement`.`image_and_file` (`project_id`, `task_id`, `file_url`, `status`) VALUES (?, ?, ?, ?);\n";

        try {
            check = jdbcTemplate.update(sql, projectID, subTaskID, url, 1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public int uploadFileSummary(String url, int projectID) {
        int check = 0;
        String sql = "INSERT INTO `dkmanagement`.`image_and_file` (`project_id`, `file_url`, `status`) VALUES (?, ?, ?);\n";

        try {
            check = jdbcTemplate.update(sql, projectID, url, 1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }

    public List<ImageAndFile> getAllImageSummary(int pid) {
        String sql = "SELECT * FROM dkmanagement.image_and_file i where i.project_id = ? and i.task_id is null and status= 1";
        List<ImageAndFile> image = new ArrayList<>();
        try {
            image = jdbcTemplate.query(sql, new MapperImageAndFile(), pid);
            return image;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return image;
    }

    public List<ImageAndFile> getAllImageSubtask(int pid, int tid) {
        String sql = "SELECT * FROM dkmanagement.image_and_file i where i.project_id = ? and i.task_id = ? and status= 1;";
        List<ImageAndFile> image = new ArrayList<>();
        try {
            image = jdbcTemplate.query(sql, new MapperImageAndFile(), pid, tid);
            return image;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return image;
    }

    public int getTotalFile(int subTaskID) {

        List<ImageAndFile> files = new ArrayList<>();
        String sql = "SELECT * FROM dkmanagement.image_and_file where task_id = ? and status=1 ;";

        try {
            files = jdbcTemplate.query(sql, new MapperImageAndFile(), subTaskID);
            return files.size();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int updateStatus(int projectID, int idFile) {
        int check = 0;
        String sql = "UPDATE `dkmanagement`.`image_and_file` SET `status` = '2' WHERE (`id` = ? AND project_id= ?);";
        try {
            check = jdbcTemplate.update(sql, idFile, projectID);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return check;
    }
}
