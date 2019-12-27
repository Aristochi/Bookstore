
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<main class="pay-suc">
    <div class="payed-tip">
        <img src="img/pay_success.png">
        <span>您已成功付款</span>
    </div>
    <div class="payed-info">
        <ul>
            <li>收货地址： ${order.address} </li>
            <li>实付款：<span class="payed-num">￥${order.sum}</span></li>
        </ul>
    </div>
    <div class="payed-guide">
        您可以
        <a href="myOrder" class="payed-guide-link">查看已买到的宝贝</a>
        <a href="#nowhere" class="payed-guide-link">查看交易详情 </a>
    </div>
   
</main>