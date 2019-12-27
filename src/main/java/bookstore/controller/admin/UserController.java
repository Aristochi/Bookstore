package bookstore.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import bookstore.annotation.Auth;
import bookstore.pojo.User;
import bookstore.util.Pagination;

import java.util.List;

@Controller
@RequestMapping("/admin/user")
public class UserController extends AdminBaseController {
    @Auth(User.Group.admin)
    @RequestMapping("list")
    public String list(Model model, Pagination pagination) throws Exception {
        List<User> users = userService.list("pagination", pagination);
        model.addAttribute("users", users);
        return "/admin/listUser";
    }
}
