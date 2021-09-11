<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/9/7
  Time: 18:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://shiro.apache.org/tags" %> 
<html>
<head>
    <title>主页</title>
</head>
<body>
        ${username}
<%--        <h1>${message}</h1--%>
            <c:hasPermission name="bookmanager:book:query">
                 <h1>用户查询</h1>
                <hr/>
            </c:hasPermission>
            <c:hasPermission name="bookmanager:book:add">
                <h1>用户新增</h1>
                <form action="/SSMshiro_02/edti/add" method="post">
                    <b>账号:</b><input name="username" />
                    <b>密码：</b><input name="password"/>
                    <input type="submit" name="注册" />
                </form>
                <hr/>
            </c:hasPermission>
            <c:hasPermission name="bookmanager:book:edit">
                <h1>用户修改</h1>
                <hr/>
            </c:hasPermission>
            <c:hasPermission name="bookmanager:book:del">
                <h1>用户删除</h1>
                <form action="/SSMshiro_02/edti/delete" method="post">
                    编号：<input type="text" name="uid"/><br/>
                    <input type="submit"/>

                </form>
                <hr/>
            </c:hasPermission>
</body>
</html>
