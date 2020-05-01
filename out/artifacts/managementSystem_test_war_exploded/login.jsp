<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
    登录界面
  Created by IntelliJ IDEA.
  User: Changepeng
  Date: 2019/5/30
  Time: 20:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>Login</title>
    <meta name="viewport" content="width=device-width,nitial-scale=1.0">
    <script src="js/jquery-3.3.1.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css">
    <script src="js/bootstrap.js"></script>
    <link rel="stylesheet" href="css/login.css">
</head>
<body>
<%
    String send = request.getParameter("send");
    if(send!=null&&send.equals("well")){
        out.write("<script>\n"+
                "window.onload = function (){\n" +
                        "showSuccess('已经提交申请');\n"+
                        "};\n</script>"
        );
    }else
    if(send!=null&&send.equals("error")){
        out.write("<script>\n"+
                "window.onload = function (){\n" +
                "showError('申请提交失败');\n"+
                "};\n</script>"
        );
    }else
    if(send!=null&&send.equals("loginError")){
        out.write("<script>\n"+
                "window.onload = function (){\n" +
                "showError('用户名或者密码错误！登陆失败');\n"+
                "};\n</script>"
        );
    }
    if(send!=null&&send.equals("changeCode")){
        out.write("<script>\n"+
                "window.onload = function (){\n" +
                "showSuccess('修改密码成功！您已退出登录！请您用新密码登录');\n"+
                "};\n</script>"
        );
    }
%>
<div class="bg">
</div>
<div class="nav">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">登录</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="index.jsp">返回用户门面</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">关于<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">设计者</a></li>
                            <li><a href="#">系统</a></li>
                            <li><a href="#">版本信息</a></li>
                        </ul>
                    </li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</div>
<div class="container">
    <div class="login col-lg-4 col-lg-offset-4 col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
        <h2>用户登录</h2>
        <form action="login" method="post">
            <div class="form-group">
                <label for="exampleInputEmail1">用户名/邮箱/工号</label>
                <input type="text" class="form-control" id="exampleInputEmail1" name="workerId" placeholder="username" autofocus>
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">密码</label>
                <input type="password" class="form-control" id="exampleInputPassword1" name="passWord" placeholder="Password">
            </div>
            <div class="checkbox">
                <label>
                    <input type="checkbox"> 记住密码
                </label>
            </div>
            <button type="submit" class="btn btn-default col-lg-3 col-lg-offset-2 col-md-3 col-md-offset-2 col-sm-3 col-sm-offset-2 col-xs-3 col-xs-offset-2 btn-primary">登录</button>
            <button type="button" id="newWorkerBtn" class="btn btn-default col-lg-3 col-lg-offset-2 col-md-3 col-md-offset-2 col-sm-3 col-sm-offset-2 col-xs-3 col-xs-offset-2 btn-success">新入职</button>
        </form>
    </div>

</div>
<div class="newWorker col-lg-4 col-lg-offset-4 col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1" id="newWorker">
    <h2>新入职申请</h2>
    <form action="newWorker" method="post">
        <div class="form-group">
            <label for="exampleInputEmail3">真实姓名</label>
            <input type="text" class="form-control" id="exampleInputEmail3" name="name" placeholder="输入真实姓名，以便通过申请">
        </div>
        <div class="form-group">
            <label for="exampleInputEmail4">性别</label>
            <input type="text" class="form-control" id="exampleInputEmail4" name="sex" placeholder="性别">
        </div>
        <div class="form-group">
            <label for="exampleInputEmail5">出生年月</label>
            <input type="date" class="form-control" id="exampleInputEmail5" name="birthday" placeholder="请输入正确的出生日期">
        </div>
        <div class="form-group">
            <label for="exampleInputEmail6">电话</label>
            <input type="number" min="0000000" max="99999999999999" class="form-control" id="exampleInputEmail6" name="tel" placeholder="电话">
        </div>
        <div class="form-group">
            <label for="exampleInputEmail7">e-mail</label>
            <input type="email" class="form-control" id="exampleInputEmail7" name="email" placeholder="邮箱">
        </div>
        <div class="form-group">
            <label for="exampleInputEmail8">出生地</label>
            <input type="text" class="form-control" id="exampleInputEmail8" name="place" placeholder="出生地">
        </div>
        <div class="form-group">
            <label for="exampleInputEmail9">申请的部门</label>
            <select name="department" id="exampleInputEmail9">
                <c:forEach items="${departments}" var="department">
                    <option value="${department.d_Name}">${department.d_Name}</option>
                </c:forEach>

            </select>
        </div>
        <button type="submit" class="btn btn-default col-lg-3 col-lg-offset-2 col-md-3 col-md-offset-2 col-sm-3 col-sm-offset-2 col-xs-3 col-xs-offset-2 btn-primary">提交</button>
        <button type="button" id="closeWorkerBtn" class="btn btn-default col-lg-3 col-lg-offset-2 col-md-3 col-md-offset-2 col-sm-3 col-sm-offset-2 col-xs-3 col-xs-offset-2 btn-danger">取消</button>
    </form>
</div>
<div class="information_error alert alert-danger alert-dismissible col-lg-4 col-md-3 col-sm-3" id="error" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <strong>Warning!</strong><span id="errorInf">Better check yourself, you're not looking too good.</span>
</div>
<div class="information_well alert alert-success alert-dismissible col-lg-4" id="success" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    <strong>Success!</strong> <span id="successInf">Better check yourself, you're not looking too good.</span>
</div>

<script>
    function showError(str){
        var error = document.getElementById('error');
        var errorInf = document.getElementById('errorInf');
        error.style.display = 'block';
        errorInf.innerHTML = str;
    }
    function showSuccess(str){
        var success = document.getElementById('success');
        var successInf = document.getElementById('successInf');
        success.style.display = 'block';
        successInf.innerHTML = str;
    }
    function disablePageBack() {
        //消除后退的所有动作。包括 键盘、鼠标手势等产生的后退动作。，用户登录到系统中后，浏览器回退按钮失效，只能点击退出按钮退出系统！
        history.pushState(null, null, document.URL);
        window.addEventListener('popstate', function () {
            history.pushState(null, null, document.URL);
        });
    }
</script>

<script>
    var newWorker = document.getElementById('newWorker');
    var newWorkerBtn = document.getElementById('newWorkerBtn');
    var closeWorkerBtn = document.getElementById('closeWorkerBtn');
    newWorkerBtn.onclick = function(){
        newWorker.style.display = 'block';
    };
    closeWorkerBtn.onclick = function(){
        newWorker.style.display = 'none';
    };
    disablePageBack();
</script>





</body>
</html>
