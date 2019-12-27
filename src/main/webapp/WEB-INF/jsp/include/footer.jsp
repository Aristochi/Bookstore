<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<script>
    var msg = "${msg}";
    if(msg !== ""){
        alert(msg);
    }
    $(function () {
        $("#refer").val(window.location.href ===""?"/":window.location.href);
        $("#form").submit(function () {
            if($("#password").val() == "" || $("#name").val() == ""){
                alert("用户名或密码为空");
                return false;
            }
            return true;
        });
    });
</script>
<div class="modal" tabindex="-1" role="dialog" id="loginModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <section class="login-modal">
                <div class="login-content">
                    <form method="post" action="loginIn" id="form">
                        <div class="login-frame">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <div class="login-tip">密码登录</div>
                            <div class="login-input">
                    <span class="login-input-icon">
                                <span class=" glyphicon glyphicon-user"></span>
                            </span>
                                <input type="text" placeholder="手机/会员名/邮箱" name="name" id="name" autofocus>
                            </div>
                            <div class="login-input">
                    <span class="login-input-icon ">
                                <span class=" glyphicon glyphicon-lock"></span>
                            </span>
                                <input type="password" placeholder="密码" name="password" id="password">
                                <input type="hidden" name="refer" id="refer" value="/">
                            </div>
                            <div class="login-button">
                                <button type="submit" class="login-button">登 录</button>
                            </div>
                            <div class="login-bottom">
                                <a href="#">忘记登录密码</a>
                                <a class="" href="register">免费注册</a>
                            </div>

                        </div>
                    </form>
                </div>
            </section>
        </div>
    </div>
</div>
<footer class="footer-top clear">
    <div class="footer-content">
        <div class="footer-ensure">
            <a href="#1"></a>
            <a href="#2"></a>
            <a href="#3"></a>
            <a href="#4"></a>
        </div>

        <div class="footer-desc" id="footer-desc">
            <div class="desc-column">
                <span class="desc-column-title">购物指南</span>
                <a href="#">购物流程</a>
                <a href="#">免费注册</a>
                <a href="#">联系客服</a>
            </div>
            <div class="desc-column">
                <span class="desc-column-title">本站保障</span>
                <a href="#">发票保障</a>
                <a href="#">售后规则</a>
                <a href="#">缺货赔付</a>
            </div>
            <div class="desc-column">
                <span class="desc-column-title">支付方式</span>
                <a href="#">快捷支付</a>
                <a href="#">分期付款</a>
                <a href="#">货到付款</a>
            </div>
            <div class="desc-column">
                <span class="desc-column-title">特色服务</span>
                <a href="#">上门自提</a>
                <a href="#">送货上门</a>
                <a href="#">运营服务</a>
            </div>
        </div>
    </div>
</footer>

<footer class="footer-bottom">

    <div class="foot-image"></div>
    <div class="foot-content">
        <div class="copyright" id="copyright">
            <div class="white-link">
                <a href="#">关于本站</a>
                <a href="#">帮助中心</a>
                <a href="#">开放平台</a>
                <a href="#"> 诚聘英才</a>
                <a href="#">联系我们</a>
                <a href="#">网站合作</a>
                <a href="#">法律声明</a>
                <a href="#">知识产权</a>
                <a href="#">廉正举报 </a>
            </div>
            <div class="white-link">
                <a href="#">BookStores科技公司</a><span class="slash">|</span>
                <a href="#">Bookstore.com</a><span class="slash">|</span>
                <a href="#">${website_name} </a><span class="slash">|</span>
            </div>
            <div class="license">
                <span>经营许可证： <a href="#">粤00-00000000</a></span>
                <span>网络文化经营许可证：<a href="#">粤网文[2019]0000-001号</a></span>
                <span><a href="#">12318举报 </a></span><br>
                <span>互联网资质证书：<a href="#">粤-（经营性）-0000-0001</a></span>
                <div class="copy-right-year">© 2019-2019 Bookstore版权所有</div>

            </div>
        </div>
    </div>
</footer>

</body>
</html>