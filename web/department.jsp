<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
部门管理界面
  Created by IntelliJ IDEA.
  User: Changepeng
  Date: 2019/6/2
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%
    String send = request.getParameter("send");
    String view = request.getParameter("view");

    if (send != null && send.equals("del_success")) {
        out.write("<script>\n" +
                "window.onload = function (){\n" +
                "showSuccess('删除成功');\n" +
                "};\n</script>"
        );
    } else if (send != null && send.equals("del_error")) {
        out.write("<script>\n" +
                "window.onload = function (){\n" +
                "showError('删除失败');\n" +
                "};\n</script>"
        );
    }else
    if (send != null && send.equals("change_success")) {
        out.write("<script>\n" +
                "window.onload = function (){\n" +
                "showSuccess('修改成功');\n" +
                "};\n</script>"
        );
    } else if (send != null && send.equals("change_error")) {
        out.write("<script>\n" +
                "window.onload = function (){\n" +
                "showError('修改失败');\n" +
                "};\n</script>"
        );
    }

    if(view!=null&&view.equals("addDepartment")){
        out.write("<script>\n" +
                "window.onload = function (){\n" +
                "clear();\n" +
                "this.className = 'active chose';\n" +
                "document.getElementById('changeDepartmentLi').style.display = 'none';\n" +
                "document.getElementById('addDepartmentLi').className = 'active chose';\n" +
                "document.getElementById('changeDepartment').style.display = 'none';\n" +
                "document.getElementById('addDepartment').style.display = 'block';\n" +
                "document.getElementById('departmentInf').style.display = 'none';\n" +
                "document.getElementById('title').innerHTML = '添加部门';\n" +
                "};\n</script>"
        );
    }
%>


<div class="main">
    <div class="left col-sm-2 col-sm-offset-1 col-xs-12">
        <ul id="listLi">
            <li id="showDepartmentLi" class="active chose">部门列表</li>
            <li id="addDepartmentLi" class="active">添加部门</li>
            <li id="changeDepartmentLi">修改部门信息</li>
        </ul>
    </div>
    <div class="right col-sm-6 col-sm-offset-1 col-xs-12">
        <h3 id="title">部门列表</h3>


        <div class="errorMessage alert alert-danger alert-dismissible col-sm-5 col-sm-offset-7" id="errorMessage" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                    aria-hidden="true">&times;</span></button>
            <strong>Warning!</strong><span id="errorInf">Better check yourself, you're not looking too good.</span>
        </div>
        <div class="successMessage alert alert-success alert-dismissible col-sm-5 col-sm-offset-7" id="successMessage" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                    aria-hidden="true">&times;</span></button>
            <strong>Success!</strong> <span id="successInf">Better check yourself, you're not looking too good.</span>
        </div>


        <div class="inf" id="departmentInf">
            <table class="table myTable">
                <tr>
                    <td>部门名称</td>
                    <td>部门ID</td>
                    <td>部门经理ID</td>
                    <td>操作</td>
                </tr>
                <c:forEach items="${departments}" var="department">
                    <tr>
                        <td class="departmentName">${department.d_Name}</td>
                        <td class="departmentId">${department.d_Id}</td>
                        <td class="workerId">${department.workerId}</td>
                        <td>
                            <a href="departmentManage?D_method=delDepartment&d_Id=${department.d_Id}">删除</a>
                            <a href="#" class="change">修改</a>
                        </td>
                    </tr>
                </c:forEach>
                </tr>
            </table>
        </div>
        <div class="addDepartment" id="addDepartment">
            <form action="addDepartment" method="post">
                <div class="form-group">
                    <label for="exampleInputEmail2">部门名</label>
                    <input type="text" class="form-control" id="exampleInputEmail2" name="d_Name" placeholder="部门名">
                </div>

                <div class="form-group">
                    <label for="exampleInputEmail0">部门经理ID</label>

                    <select name="workerId" id="exampleInputEmail0">
                        <c:forEach items="${d_workers}" var="worker">
                            <option value="${worker.workerId}">${worker.name}</option>
                        </c:forEach>

                    </select>
                </div>
                <button type="submit"
                        class="btn btn-default col-lg-3 col-lg-offset-5 col-md-3 col-md-offset-2 col-sm-3 col-sm-offset-2 col-xs-3 col-xs-offset-2 btn-primary">
                    提交
                </button>
            </form>
        </div>


        <div class="changeDepartment" id="changeDepartment">
            <form action="departmentManage?D_method=changeDepartment" method="post">
                <div class="form-group">
                    <label for="exampleInputEmail3">部门ID</label>
                    <input type="text" readonly="readonly" class="form-control" id="exampleInputEmail3" name="d_Id">
                </div>
                <div class="form-group">
                    <input type="hidden" class="form-control" id="exampleInputEmail6" name="oldName">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail4">部门名</label>
                    <input type="text" class="form-control" id="exampleInputEmail4" name="d_Name" placeholder="输入部门名称">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail5">部门经理ID</label>
                    <select name="workerId" id="exampleInputEmail5">
                        <c:forEach items="${d_workers}" var="worker">
                            <option value="${worker.workerId}">${worker.name}</option>
                        </c:forEach>

                    </select>
                </div>
                <button type="submit"
                        class="btn btn-default col-lg-3 col-lg-offset-2 col-md-3 col-md-offset-2 col-sm-3 col-sm-offset-2 col-xs-3 col-xs-offset-2 btn-primary">
                    提交
                </button>
                <button type="button" id="closeChangeBtn"
                        class="btn btn-default col-lg-3 col-lg-offset-2 col-md-3 col-md-offset-2 col-sm-3 col-sm-offset-2 col-xs-3 col-xs-offset-2 btn-danger">
                    取消
                </button>
            </form>
        </div>
    </div>
</div>

<script>
    function showDepartmentView(btn, departmentId, departmentName, workerId) {
        btn.onclick = function () {
            clear();
            document.getElementById('changeDepartment').style.display = 'block';
            document.getElementById('departmentInf').style.display = 'none';
            document.getElementById('exampleInputEmail3').value = departmentId.innerHTML;
            document.getElementById('exampleInputEmail4').value = departmentName.innerHTML;
            document.getElementById('exampleInputEmail6').value = departmentName.innerHTML;
            document.getElementById('exampleInputEmail5').value = workerId.innerHTML;
            document.getElementById('changeDepartmentLi').style.display = 'block';
            document.getElementById('title').innerHTML = '修改部门信息';
        };
    }

    function clear() {
        var listLi = document.getElementById('listLi');
        var aLi = listLi.getElementsByTagName('li');
        for (var i = 0; i < aLi.length; i++) {
            aLi[i].className = 'active';
        }
    }

    function showError(str){
        var error = document.getElementById('errorMessage');
        var errorInf = document.getElementById('errorInf');
        error.style.display = 'block';
        errorInf.innerHTML = str;
    }
    function showSuccess(str){
        var success = document.getElementById('successMessage');
        var successInf = document.getElementById('successInf');
        success.style.display = 'block';
        successInf.innerHTML = str;
    }
</script>

<script>

    //修改点击事件
    var inf = document.getElementById('departmentInf');
    var aChange = inf.getElementsByClassName('change');
    var aDepartmentId = inf.getElementsByClassName('departmentId');
    var aDepartmentName = inf.getElementsByClassName('departmentName');
    var aWorkerId = inf.getElementsByClassName('workerId');
    document.getElementById('changeDepartmentLi').style.backgroundColor = '#000';
    document.getElementById('changeDepartmentLi').style.color = '#FFF';
    for (var i = 0; i < aChange.length; i++) {
        showDepartmentView(aChange[i], aDepartmentId[i], aDepartmentName[i], aWorkerId[i]);
    }

    //修改视图取消/关闭事件
    document.getElementById('closeChangeBtn').onclick = function () {
        document.getElementById('changeDepartment').style.display = 'none';
        document.getElementById('changeDepartmentLi').style.display = 'none';
        document.getElementById('departmentInf').style.display = 'block';
        document.getElementById('changeDepartmentLi').style.backgroundColor = '#000';
        document.getElementById('changeDepartmentLi').style.color = '#FFF';
        document.getElementById('showDepartmentLi').className = 'active chose';
        document.getElementById('title').innerHTML = '部门列表';
    };

    //列表1点击事件
    document.getElementById('showDepartmentLi').onclick = function () {
        clear();
        this.className = 'active chose';
        document.getElementById('changeDepartment').style.display = 'none';
        document.getElementById('addDepartment').style.display = 'none';
        document.getElementById('departmentInf').style.display = 'block';
        document.getElementById('changeDepartmentLi').style.display = 'none';
        document.getElementById('title').innerHTML = '部门列表';
    };
    //列表2点击事件
    function addDepartmentLi(){
        document.getElementById('addDepartmentLi').onclick = function () {
            clear();
            this.className = 'active chose';
            document.getElementById('changeDepartmentLi').style.display = 'none';
            document.getElementById('changeDepartment').style.display = 'none';
            document.getElementById('addDepartment').style.display = 'block';
            document.getElementById('departmentInf').style.display = 'none';
            document.getElementById('title').innerHTML = '添加部门';

        };
    }
    addDepartmentLi();
</script>


<%--<h2>部门列表</h2>--%>
<%--<table border="1">--%>
<%--    <c:forEach items="${departments}" var="department">--%>
<%--        <tr>--%>
<%--            <td>${department.d_Name}</td>--%>
<%--            <td>${department.d_Id}</td>--%>
<%--            <td>${department.workerId}</td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
<%--</table>--%>

<%--<h2>添加部门--%>
<%--</h2>--%>

<%--<form action="addDepartment" method="post">--%>

<%--    部门名称：<input type="text" name="d_Name"><br>--%>
<%--    部门Id：<input type="text" name="d_Id"><br>--%>
<%--    部门管理员：<input type="text" name="workerId"><br>--%>
<%--    <button type="submit">提交</button>--%>

<%--</form>--%>
