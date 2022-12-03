package DkDesignManagement.Service;

import DkDesignManagement.Entity.ImageAndFile;
import DkDesignManagement.Repository.ImageAndFileDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public interface ImageAndFileService {
    @Autowired
    ImageAndFileDao imageAndFileDao = new ImageAndFileDao();
    List<ImageAndFile> getAllImageSummary(int pid);
}
