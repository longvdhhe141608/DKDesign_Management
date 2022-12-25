package DkDesignManagement.Mapper;


import DkDesignManagement.Entity.ImageAndFile;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class MapperImageAndFile implements RowMapper<ImageAndFile> {

    @Override
    public ImageAndFile mapRow(ResultSet rs, int rowNum) throws SQLException {

        ImageAndFile file = ImageAndFile.builder()
                .id(rs.getInt("id"))
                .projectId(rs.getInt("project_id"))
                .taskId(rs.getInt("task_id"))
                .poster(rs.getInt("poster"))
                .fileUrl(rs.getString("file_url"))
                .posterDate(rs.getDate("poster_date"))
                .status(rs.getInt("status"))
                .build();
        return file;
    }
}
