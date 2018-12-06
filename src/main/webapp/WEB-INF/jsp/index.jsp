<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <%@include file="common/head.jsp"%> <!-- 静态包含 -->


</head>
<body>
<div style=width:180px;>
	<div class="list-group" style="margin-top: 10px;margin-left: 5px;">

<div style="margin-bottom:20px;">
    <c:if test="${empty subject.principal}">
        <a href="login">登录</a><br>
    </c:if>
    <c:if test="${!empty subject.principal}">
        <span class="desc">你好，${subject.principal}，</span>
        <a href="doLogout">退出</a><br>
    </c:if>
    <a href="#" class="list-group-item">首页内容管理</a>
    <a href="#" class="list-group-item">出租房管理</a>
    <a href="/user/list" class="list-group-item">用户管理</a>
    <a href="#" class="list-group-item">代理管理</a>
</div>
</div>
</div>
</body>
</html>
