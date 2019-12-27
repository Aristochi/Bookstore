package bookstore.service.impl;

import org.springframework.stereotype.Service;

import bookstore.mapper.OrderItemMapper;
import bookstore.pojo.OrderItemExample;
import bookstore.service.OrderItemService;

@Service
public class OrderItemServiceImpl extends BaseServiceImpl<OrderItemMapper,OrderItemExample>
        implements OrderItemService {
 
}