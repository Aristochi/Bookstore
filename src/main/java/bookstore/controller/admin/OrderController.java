package bookstore.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import bookstore.annotation.Auth;
import bookstore.pojo.Order;
import bookstore.pojo.User;
import bookstore.util.Pagination;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin/order")
public class OrderController extends AdminBaseController {
    @Auth(User.Group.admin)
    @RequestMapping("list")
    public String list(Model model, Pagination pagination) throws Exception {
        List<Order> orders = orderService.
                list("pagination", pagination, "depth", 3);
        model.addAttribute("orders", orders);
        return "admin/listOrder";
    }

    @Auth(User.Group.admin)
    @RequestMapping("deliver")
    public String list(Integer oid) throws Exception {
        Order order = (Order) orderService.get(oid);
        order.setStatus(Order.Status.waitComment);
        order.setDeliverDate(new Date());
        orderService.update(order);
        return "redirect:list";
    }

}