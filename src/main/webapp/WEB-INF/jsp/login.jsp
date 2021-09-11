<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/9/7
  Time: 20:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
</head>
<body>

        <form action="/SSMshiro_02/user/login" method="post">
            账号：<input name="username"/><br>
            密码：<input type="password" name="password">
            <input type="submit">
        </form>

</body>
</html>
