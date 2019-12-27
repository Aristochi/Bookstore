package bookstore.controller.front;

import bookstore.annotation.Auth;
import bookstore.controller.BaseController;
import bookstore.pojo.User;

@Auth(User.Group.unLogin)
public class FrontBaseController extends BaseController {

}
