<%--
    入职办理
  Created by IntelliJ IDEA.
  User: Changepeng
  Date: 2019/5/30
  Time: 20:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>newWorker</title>
</head>
<body>
<h2>新入职申请</h2>
<form action="newWorker" method="get"><br>
    真实姓名<input type="text" name="name"><br>
    性别<input type="text" name="sex"><br>
    出生年月<input type="text" name="birthday"><br>
    电话<input type="text" name="tel"><br>
    e-mail<input type="text" name="email"><br>
    出生地<input type="text" name="place"><br>
    申请的部门<select name="department">
        <option value="GeneralAccountingDepartment">财务部</option>
        <option value="SalesDepartment">销售部</option>
        <option value="SecretarialPool">秘书室</option>
        <option value="AdvertisingDepartment">广告部</option>
    </select><br>
    <button type="submit">提交</button><br>
</form>
<a href="login.jsp">登录</a>
</body>
</html>
