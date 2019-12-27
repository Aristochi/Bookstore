package bookstore.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bookstore.mapper.CommentMapper;
import bookstore.pojo.Comment;
import bookstore.pojo.CommentExample;
import bookstore.pojo.Order;
import bookstore.pojo.OrderItem;
import bookstore.service.CommentService;
import bookstore.service.OrderItemService;
import bookstore.service.OrderService;

import java.util.List;

@Service
public class CommentServiceImpl extends BaseServiceImpl<CommentMapper,CommentExample>
        implements CommentService {
    @Autowired
    OrderService orderService;
    @Autowired
    OrderItemService orderItemService;
    @Override
    public boolean checkFinishComment(Order order) {
        List<OrderItem> orderItems = order.getOrderItems();
        for(OrderItem orderItem:orderItems){
            if(orderItem.getComment()==null){
                return false;
            }
        }
        return true;
    }
}