package DkDesignManagement.Service.Impl;

import DkDesignManagement.Entity.Category;
import DkDesignManagement.Repository.CategoryDao;
import DkDesignManagement.Service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    CategoryDao categoryDao;

    @Override
    public List<Category> getAllCategory() {
        return categoryDao.getAll();
    }
}
