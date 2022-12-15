package DkDesignManagement.Service.Impl;

import DkDesignManagement.Entity.ImageAndFile;
import DkDesignManagement.Repository.ImageAndFileDao;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.anyInt;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class ImageAndFileServiceImplTest {
    @InjectMocks
    private ImageAndFileServiceImpl imageAndFileService;
    @Mock
    private ImageAndFileDao imageAndFileDao;

    @Test
    void GivenListValue_getAllImageSummary_ReturnListValue() {
        int id = 1;
        List<ImageAndFile> imageAndFileList = new ArrayList<>();
        when(imageAndFileDao.getAllImageSummary(anyInt())).thenReturn(imageAndFileList);

        imageAndFileList = imageAndFileDao.getAllImageSummary(id);
        int check = imageAndFileService.getAllImageSummary(id).size();
        assertEquals(check, imageAndFileList.size());
    }

    @Test
    void GivenListValue_getAllImageSubtask_ReturnListValue() {
        int pid = 1, tid = 1;
        List<ImageAndFile> imageAndFileList = new ArrayList<>();
        when(imageAndFileDao.getAllImageSubtask(anyInt(), anyInt())).thenReturn(imageAndFileList);

        imageAndFileList = imageAndFileDao.getAllImageSubtask(pid, tid);
        int check = imageAndFileService.getAllImageSubtask(pid, tid).size();
        assertEquals(check, imageAndFileList.size());
    }

    @Test
    void GivenListValue_getTotalFileBySubTaskID_ReturnTotalValue() {
        int tid = 1, stid = 1;
        when(imageAndFileDao.getTotalFileBySubTaskID(anyInt(), anyInt())).thenReturn(1);
        int result = imageAndFileService.getTotalFileBySubTaskID(tid, stid);
        assertEquals(result, imageAndFileDao.getTotalFileBySubTaskID(tid, stid));
    }

    @Test
    void GivenListValue_updateFileBySubTaskID_ReturnIntValue() {
        String url = "url-demo";
        int tid = 1, stid = 1;
        when(imageAndFileDao.updateFileBySubTaskID(anyString(), anyInt(), anyInt())).thenReturn(1);
        int check = imageAndFileService.updateFileBySubTaskID(url, tid, stid);
        assertEquals(check, 1);
    }

    @Test
    void GivenListValue_getTotalFile_ReturnTotalValue() {
        int id = 1;
        when(imageAndFileDao.getTotalFile(anyInt())).thenReturn(1);
        int result = imageAndFileService.getTotalFile(id);
        assertEquals(result, imageAndFileDao.getTotalFile(id));
    }

    @Test
    void GivenListValue_uploadFileSummary_ReturnIntValue() {
        int id = 1;
        String url = "url-demo";
        when(imageAndFileDao.uploadFileSummary(anyString(),anyInt())).thenReturn(1);
        int check = imageAndFileService.uploadFileSummary(url,id);
        assertEquals(check,1);
    }
}