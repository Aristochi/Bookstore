package bookstore.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bookstore.mapper.ProductMapper;
import bookstore.pojo.Product;
import bookstore.pojo.ProductExample;
import bookstore.service.CommentService;
import bookstore.service.OrderItemService;
import bookstore.service.OrderService;
import bookstore.service.ProductService;

import java.util.List;

@Service
public class ProductServiceImpl extends BaseServiceImpl<ProductMapper,ProductExample> implements ProductService {

}