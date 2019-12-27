
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<main class="pay-page">
   
    <div class="pay-num">￥${order.sum}</div>

    <a href="payed?oid=${order.id}"><button class="confirm-pay">免费支付</button></a>
</main>
