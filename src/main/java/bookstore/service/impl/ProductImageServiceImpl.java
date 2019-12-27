package bookstore.service.impl;


import org.springframework.stereotype.Service;

import bookstore.mapper.ProductImageMapper;
import bookstore.pojo.Product;
import bookstore.pojo.ProductImage;
import bookstore.pojo.ProductImageExample;
import bookstore.service.ProductImageService;

import java.util.List;

@Service
public class ProductImageServiceImpl extends BaseServiceImpl<ProductImageMapper,ProductImageExample>
        implements ProductImageService {

}