package bookstore.service.impl;


import org.springframework.stereotype.Service;

import bookstore.mapper.CategoryMapper;
import bookstore.pojo.Category;
import bookstore.pojo.CategoryExample;
import bookstore.pojo.ProductExample;
import bookstore.service.CategoryService;

import java.util.ArrayList;
import java.util.List;

/**
 * @see CategoryService
 */
@Service
public class CategoryServiceImpl extends BaseServiceImpl<CategoryMapper,CategoryExample>
        implements CategoryService  {

}