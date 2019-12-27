package bookstore.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import bookstore.annotation.Auth;
import bookstore.pojo.User;

@Controller
@RequestMapping("/admin/")
public class RootController extends AdminBaseController {
    @Auth(User.Group.admin)
    @RequestMapping("/")
    public String root() {
        return "redirect:category/list";
    }
}
