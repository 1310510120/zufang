<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="common/tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <%@include file="common/head.jsp"%> <!-- 静态包含 -->
    <script type="text/javascript">
    </script>
</head>
<body>
<center>
    <form items="${user}" id="usertable" action="/user/${user.id}/edit" method="post">
        <table>
            <tr>
                <td colspan="2">用戶信息</td>
            </tr>
            <tr>
                <td>id:</td>
                <td><input type="text" name="id" value="${user.id}"></td>
            </tr>
            <tr>
                <td>昵称：</td>
                <td><input type="text" name="nickname" value="${user.nickname}"></td>
            </tr>
            <tr>
                <td>密码：</td>
                <td><input type="text" name="password" value="${user.password}"></td>
            </tr>
            <tr>
                <td>email:</td>
                <td><input type="text" name="email" value="${user.email}"></td>
            </tr>
            <tr>
                <td>手机号:</td>
                <td><input type="text" name="phone_number" value="${user.phone_number}"></td>
            </tr>
            <tr>
                <td>用户头像:</td>
                <td><input type="text" name="portrait" value="${user.portrait}"></td>
            </tr>
            <tr>
                <td>状态:</td>
                <td><input type="text" name="status" value="${user.status}"></td>
            </tr>
            <tr>
                    <button id="submitId" >提交</button>
            </tr>
        </table>
    </form>
</center>
</body>



</html>