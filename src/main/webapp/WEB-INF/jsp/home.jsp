
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="title" value="首页 - ${website_name}" />
<%@include file="include/header.jsp"%>
<c:set var="home" value="home" />
<%@include file="include/top.jsp"%>
<%@include file="include/home/homeSearch.jsp"%>
<%@include file="include/home/homeCenter.jsp"%>
<%@include file="include/home/homeBottom.jsp"%>
<%@include file="include/footer.jsp"%>
