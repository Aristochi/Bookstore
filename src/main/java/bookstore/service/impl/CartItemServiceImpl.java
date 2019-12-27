package bookstore.service.impl;

import org.springframework.stereotype.Service;

import bookstore.mapper.CartItemMapper;
import bookstore.pojo.CartItemExample;
import bookstore.service.CartItemService;
import bookstore.service.PropertyService;

@Service
public class CartItemServiceImpl extends BaseServiceImpl<CartItemMapper,CartItemExample>
        implements CartItemService {
 
}