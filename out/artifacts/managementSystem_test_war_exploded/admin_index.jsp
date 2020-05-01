<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  登陆成功后的主界面
  Created by IntelliJ IDEA.
  User: Changepeng
  Date: 2019/6/2
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>欢迎使用管理系统</title>
    <meta name="viewport" content="width=device-width,nitial-scale=1.0">
    <script src="js/jquery-3.3.1.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css">
    <script src="js/bootstrap.js"></script>
    <link rel="stylesheet" href="css/admin_index.css">
    <link rel="stylesheet" href="css/other.css">
    <link rel="stylesheet" href="css/user.css">
    <link rel="stylesheet" href="css/department.css">
    <link rel="stylesheet" href="css/staff.css">
</head>
<style>
    .main .right .re_inf{
        padding: 5%;
        padding-top: 0;
    }
</style>

<body>
<div class="bg"></div>
<div class="nav myNav">
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
                <a class="navbar-brand" href="admin_index.jsp">管理系统</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">


<%--  最高管理员权限为1--------------------------最高管理员权限为1----------最高管理员权限为1----------------最高管理员权限为1--------------最高管理员权限为1------------------------------------------------------%>
            <c:if test="${worker.permissions=='1'}">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="admin_index">首页</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">用户管理<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="userManage">用户列表</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">部门管理<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="department">部门列表</a></li>
                            <li><a href="department?view=addDepartment">添加部门</a></li>
                        </ul>
                    </li>


                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">职工管理<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="staffManagement">入职申请</a></li>
                            <li><a href="staffManagement?view=workerList">职工列表</a></li>
                        </ul>
                    </li>


                    <li><a href="Reimbursement">管理报销</a></li>
                    <li><a href="Announcement">公告</a></li>



                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${worker.nickName}<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">个人信息</a></li>
                            <li><a href="changeWorkerCode.html">修改密码</a></li>
                            <li><a href="exit">退出</a></li>
                        </ul>
                    </li>

                </ul>
            </c:if>
<%--管理员权限为1结束---------------------最高管理员权限为1结束------------------最高管理员权限为1结束-----------------最高管理员权限为1结束----------------------------------------------------------%>

    <%-- 管理员权限为2--------------------------管理员权限为2----------管理员权限为2----------------管理员权限为2--------------管理员权限为2------------------------------------------------------%>
    <c:if test="${worker.permissions=='2'}">
        <ul class="nav navbar-nav">
            <li class="active"><a href="admin_index">首页</a></li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">用户管理<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="userManage">用户列表</a></li>
                </ul>
            </li>
            <c:if test="${worker.department=='人事部'}">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">职工管理<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="staffManagement">入职申请</a></li>
                        <li><a href="staffManagement?view=workerList">职工列表</a></li>
                    </ul>
                </li>
                <li><a href="workerReimbursement">报销系统</a></li>
            </c:if>
            <c:if test="${worker.department=='财务部'}">
                <li><a href="Reimbursement">管理报销</a></li>
            </c:if>





            <li><a href="Announcement">公告</a></li>



            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${worker.nickName}<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="#">个人信息</a></li>
                    <li><a href="changeWorkerCode.html">修改密码</a></li>
                    <li><a href="exit">退出</a></li>
                </ul>
            </li>

        </ul>
    </c:if>
    <%--管理员权限为2结束---------------------管理员权限为2结束------------------管理员权限为2结束-----------------管理员权限为2结束----------------------------------------------------------%>


    <%-- 管理员权限为3--------------------------管理员权限为3----------管理员权限为3----------------管理员权限为3--------------管理员权限为3------------------------------------------------------%>
    <c:if test="${worker.permissions=='3'}">
        <ul class="nav navbar-nav">
            <li class="active"><a href="admin_index">首页</a></li>
                <li><a href="workerReimbursement">报销系统</a></li>




            <li><a href="Announcement">公告</a></li>



            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${worker.nickName}<span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="#">个人信息</a></li>
                    <li><a href="changeWorkerCode.html">修改密码</a></li>
                    <li><a href="login.jsp">退出</a></li>
                </ul>
            </li>

        </ul>
    </c:if>
    <%--管理员权限为3结束---------------------管理员权限为3结束------------------管理员权限为3结束-----------------管理员权限为3结束----------------------------------------------------------%>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</div>
<%------------------------------------------------权限控制-------------------------------------------------------------%>

<%--最高管理员权限--%>

<%--<c:if ChineseToPinyin="${worker.permissions=='1'}">--%>
<%--    <a href="admin_index">首页</a>--%>
<%--    <a href="userManage">用户管理</a>--%>
<%--    <a href="department">部门管理</a>--%>
<%--    <a href="staffManagement">职工管理</a>--%>
<%--    <a href="Reimbursement">报销系统</a>--%>
<%--    <a href="Announcement">公告</a>--%>
<%--</c:if>--%>

<%--&lt;%&ndash;部门管理员权限&ndash;%&gt;--%>
<%--<c:if ChineseToPinyin="${worker.permissions=='2'}">--%>
<%--    <a href="">职工管理</a>--%>
<%--    <a href="">报销系统</a>--%>
<%--    <a href="">公告</a>--%>
<%--</c:if>--%>

<%-----------------------------------------------------界面显示---------------------------------------------------------%>

<%--管理系统的主界面--%>
<c:if test="${method=='index'}">
    <jsp:include page="system_index.jsp"></jsp:include>
</c:if>


<%--职工管理界面--%>
<c:if test="${method=='newWorker'}">
    <jsp:include page="staffManagement.jsp"></jsp:include>
</c:if>

<%--部门管理界面--%>
<c:if test="${method=='Department'}">
    <jsp:include page="department.jsp"></jsp:include>
</c:if>


<%--用户管理界面--%>
<c:if test="${method=='userManage'}">
    <jsp:include page="user.jsp"></jsp:include>
</c:if>
<%--公告界面--%>
<c:if test="${method=='Announcement'}">
    <jsp:include page="announcement.jsp"></jsp:include>
</c:if>

<%--报销系统--%>
<c:if test="${method=='Reimbursement'}">
    <jsp:include page="reimbursement.jsp"></jsp:include>
</c:if>
<%--职工报销系统--%>
<c:if test="${method=='workerReimbursement'}">
    <jsp:include page="workerReimbursement.jsp"></jsp:include>
</c:if>
<br>
<a href="login.jsp">返回登录首页</a>
</body>
</html>
