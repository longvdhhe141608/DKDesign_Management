package DkDesignManagement.Service;

import DkDesignManagement.Entity.ImageAndFile;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public interface ImageAndFileService {

    List<ImageAndFile> getAllImageSummary(int pid);

    int getTotalFileBySubTaskID(int id, int id1);

    int updateFileBySubTaskID(String url, int id, int id1);

    int getTotalFile(int id);

    int uploadFileSummary(String url, int id);
}
