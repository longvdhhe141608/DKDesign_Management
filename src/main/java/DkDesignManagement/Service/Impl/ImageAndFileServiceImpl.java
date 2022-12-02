package DkDesignManagement.Service.Impl;

import DkDesignManagement.Entity.ImageAndFile;
import DkDesignManagement.Repository.ImageAndFileDao;
import DkDesignManagement.Service.ImageAndFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ImageAndFileServiceImpl implements ImageAndFileService {
    @Autowired
    ImageAndFileDao imageAndFileDao = new ImageAndFileDao();

    @Override
    public List<ImageAndFile> getAllImageSummary(int pid) {
        return imageAndFileDao.getAllImageSummary(pid);
    }
}
