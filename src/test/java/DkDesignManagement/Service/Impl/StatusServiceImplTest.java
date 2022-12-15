package DkDesignManagement.Service.Impl;

import DkDesignManagement.Entity.Category;
import DkDesignManagement.Entity.Status;
import DkDesignManagement.Repository.StatusDao;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.ArrayList;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class StatusServiceImplTest {
    @InjectMocks
    private StatusServiceImpl statusService;
    @Mock
    private StatusDao statusDao;

    @Test
    void GivenListValue_getAllStatus_ReturnListValue() {
        List<Status> statusList = new ArrayList<>();
        when(statusDao.getAllStatus()).thenReturn(statusList);

        statusList = statusDao.getAllStatus();
        int check = statusService.getAllStatus().size();
        assertEquals(check,statusList.size());
    }
}