package bookstore.service;

import java.util.List;

import bookstore.pojo.CartItem;
import bookstore.pojo.Order;
import bookstore.pojo.User;
import bookstore.service.BaseService;

public interface OrderService extends BaseService{
    /**
     * 添加订单
     */
    public void createOrder(Order order ,List<CartItem> cartItems) throws Exception;
}