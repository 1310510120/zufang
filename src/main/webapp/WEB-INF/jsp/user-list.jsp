<%--
  Created by IntelliJ IDEA.
  User: 13105
  Date: 2018/12/2
  Time: 13:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <%@include file="common/head.jsp"%> <!-- 静态包含 -->
</head>
<body>

<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading text-center">
            <h2>用户列表</h2>
        </div>
        <div class="panel-body">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>id</th>
                    <th>昵称</th>
                    <th>email</th>
                    <th>手机号</th>
                    <th>用户头像</th>
                    <th>用户状态</th>
                    <th>创建时间</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="user" items="${list}">
                    <tr>
                        <th>${user.id}</th>
                        <th>${user.nickname}</th>
                        <th>${user.email}</th>
                        <th>${user.phone_number}</th>
                        <th>${user.portrait}</th>
                        <th>${user.status}</th>
                        <th>
                            <fmt:formatDate value="${user.created}" pattern="yyyy-MM-dd HH-mm-ss"/>
                        </th>
                        <th>
                            <a class="btn btn-info"  href="/user/${user.id}/detail" target="_blank">链接</a>
                            <a class="btn btn-info"  href="/user/${user.id}/delete" target="_blank">删除</a>
                        </th>
                    </tr>
                </c:forEach>
                <th>
                <a class="btn btn-info"  href="/user/add" target="_blank">创建</a>
                </th>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</html>
