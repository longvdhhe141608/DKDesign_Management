package DkDesignManagement.Service.Impl;

import DkDesignManagement.Entity.Category;
import DkDesignManagement.Repository.CategoryDao;
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
class CategoryServiceImplTest {
    @InjectMocks
    private CategoryServiceImpl categoryService;

    @Mock
    private CategoryDao categoryDao;

    @Test
    void GivenListValue_getAllCategory_ReturnListValue() {
        List<Category> categoryList = new ArrayList<>();
        when(categoryDao.getAll()).thenReturn(categoryList);

        categoryList = categoryDao.getAll();
        int check = categoryService.getAllCategory().size();
        assertEquals(check,categoryList.size());
    }
}