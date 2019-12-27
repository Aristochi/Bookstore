package bookstore.controller.admin;

import bookstore.annotation.Auth;
import bookstore.controller.BaseController;
import bookstore.pojo.User;

/**
 * Controller基类，定义权限
 */
@Auth(User.Group.superAdmin)
public class AdminBaseController extends BaseController {

}
