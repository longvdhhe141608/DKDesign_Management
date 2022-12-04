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
    private ImageAndFileDao imageAndFileDao;

    @Override
    public List<ImageAndFile> getAllImageSummary(int pid) {
        return imageAndFileDao.getAllImageSummary(pid);
    }

    /**
     * @param id
     * @param id1
     * @return
     */
    @Override
    public int getTotalFileBySubTaskID(int id, int id1) {
        return imageAndFileDao.getTotalFileBySubTaskID(id,id1);
    }

    /**
     * @param url
     * @param id
     * @param id1
     * @return
     */
    @Override
    public int updateFileBySubTaskID(String url, int id, int id1) {
        return imageAndFileDao.updateFileBySubTaskID(url,id,id1);
    }

    /**
     * @param id
     * @return
     */
    @Override
    public int getTotalFile(int id) {
        return imageAndFileDao.getTotalFile(id);
    }

    /**
     * @param url
     * @param id
     * @return
     */
    @Override
    public int uploadFileSummary(String url, int id) {
        return imageAndFileDao.uploadFileSummary(url,id);
    }
}
