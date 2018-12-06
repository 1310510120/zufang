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
    <form id="usertable" method="post" action="/user/add">
        <table>
            <tr>
                <td colspan="2">用戶信息</td>
            </tr>
            <tr>
                <td>昵称：</td>
                <td><input type="text" name="nickname"></td>
            </tr>
            <tr>
                <td>密码：</td>
                <td><input type="text" name="password"></td>
            </tr>
            <tr>
                <td>email:</td>
                <td><input type="text" name="email"></td>
            </tr>
            <tr>
                <td>手机号:</td>
                <td><input type="text" name="phone_number"></td>
            </tr>
            <tr>
                <td>用户头像:</td>
                <td><input type="text" name="portrait"></td>
            </tr>
            <tr>
                <td>状态:</td>
                <td><input type="text" name="status"></td>
            </tr>
            <tr>
                <button id="submitId" >创建</button>
            </tr>
        </table>
    </form>
</center>
</body>



</html>