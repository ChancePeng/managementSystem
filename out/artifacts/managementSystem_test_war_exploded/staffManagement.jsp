<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
职工管理界面
  Created by IntelliJ IDEA.
  User: Changepeng
  Date: 2019/6/2
  Time: 18:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String send = request.getParameter("send");
    String view = request.getParameter("view");
    if (send != null && send.equals("through_success")) {
        out.write("<script>\n" +
                "window.onload = function (){\n" +
                "showSuccess('已通过');\n" +
                "};\n</script>"
        );
    } else if (send != null && send.equals("withdraw_success")) {
        out.write("<script>\n" +
                "window.onload = function (){\n" +
                "showSuccess('已撤回');\n" +
                "};\n</script>"
        );
    } else if (send != null && send.equals("change_success")) {
        out.write("<script>\n" +
                "window.onload = function (){\n" +
                "showSuccess('修改成功');\n" +
                "};\n</script>"
        );
    }
    if(view!=null&&view.equals("workerList")){
        out.write("<script>\n" +
                "window.onload = function (){\n" +
                "clear();\n" +
                "document.getElementById('showStaffLi').className = 'active chose';\n" +
                "document.getElementById('changeStaffLi').style.display = 'none';\n" +
                "document.getElementById('changeStaff').style.display = 'none';\n" +
                "document.getElementById('showStaff').style.display = 'block';\n" +
                "document.getElementById('newWorker').style.display = 'none';\n" +
                "document.getElementById('title').innerHTML = '职工列表';" +
                "};\n</script>"
        );
    }
%>


<div class="main">
    <div class="left col-sm-2 col-sm-offset-1 col-xs-12">
        <ul id="listLi">
            <li id="newWorkerLi" class="active chose">入职申请</li>
            <li id="showStaffLi" class="active">职工列表</li>
            <li id="changeStaffLi">修改职工信息</li>
        </ul>
    </div>
    <div class="right col-sm-8  col-xs-12">
        <h3 id="title">入职申请</h3>


        <div class="errorMessage alert alert-danger alert-dismissible col-sm-6" id="errorMessage" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                    aria-hidden="true">&times;</span></button>
            <strong>Warning!</strong><span id="errorInf">Better check yourself, you're not looking too good.</span>
        </div>
        <div class="successMessage alert alert-success alert-dismissible col-sm-6" id="successMessage" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close" ><span
                    aria-hidden="true">&times;</span></button>
            <strong>Success!</strong> <span id="successInf">Better check yourself, you're not looking too good.</span>
        </div>


        <div class="inf" id="newWorker">
            <table class="table myTable">
                <tr>
                    <td>姓名</td>
                    <td>性别</td>
                    <td>出生日期</td>
                    <td>电子邮件</td>
                    <td>出生地</td>
                    <td>欲申请部门</td>
                    <td>操作</td>
                </tr>
                <c:forEach items="${newWorkers}" var="newWorker">

                    <tr>
                        <td>${newWorker.name}</td>
                        <td>${newWorker.sex}</td>
                        <td>${newWorker.birthday}</td>
                        <td>${newWorker.email}</td>
                        <td>${newWorker.place}</td>
                        <td>${newWorker.department}</td>
                        <td>

                            <c:if test="${newWorker.state=='0'}">
                                <a href="verification?V_method=through&newWorkerName=${newWorker.name}">通过</a>
                                <a href="verification?V_method=withdraw&newWorkerName=${newWorker.name}">撤回</a>
                            </c:if>
                            <c:if test="${newWorker.state=='1'}">
                                已通过
                            </c:if>
                            <c:if test="${newWorker.state=='2'}">
                                已撤回
                            </c:if>
                        </td>

                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="showStaff" id="showStaff">
            <table class="table myTable">
                <tr>
                    <td>工号</td>
                    <td>昵称</td>
                    <td>姓名</td>
                    <td>性别</td>
                    <td>出生日期</td>
                    <td>电话</td>
                    <td>邮箱</td>
                    <td>出生地</td>
                    <td>部门</td>
                    <td>在职状态</td>
                    <td>操作</td>
                </tr>
                <c:forEach items="${workers}" var="worker">
                    <tr>
                        <td class="workerId">${worker.workerId}</td>
                        <td class="nickName">${worker.nickName}</td>
                        <td class="name">${worker.name}</td>
                        <td class="sex">${worker.sex}</td>
                        <td class="birthday">${worker.birthday}</td>
                        <td class="tel">${worker.tel}</td>
                        <td class="email">${worker.email}</td>
                        <td class="place">${worker.place}</td>
                        <td class="department">${worker.department}</td>
                        <td class="incumbency">
                            <c:if test="${worker.incumbency==1}">
                                在职
                            </c:if>
                            <c:if test="${worker.incumbency==2}">
                                退休
                            </c:if>
                            <c:if test="${worker.incumbency==3}">
                                辞职
                            </c:if>
                        </td>
                        <td>
                            <a href="#" class="change">修改</a>
                        </td>

                    </tr>
                </c:forEach>
            </table>
        </div>


        <div class="changeStaff" id="changeStaff">
            <form action="changeWorker" method="post">
                <div class="form-group">
                    <label for="exampleInputEmail0">工号</label>
                    <input type="text" readonly="readonly" class="form-control" id="exampleInputEmail0" name="workerId"
                           placeholder="工号">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail9">昵称</label>
                    <input type="text" class="form-control" id="exampleInputEmail9" name="nickName"
                           placeholder="昵称">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail1">姓名</label>
                    <input type="text" class="form-control" id="exampleInputEmail1" name="name"
                           placeholder="输入真实姓名">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail2">性别</label>
                    <input type="text" class="form-control" id="exampleInputEmail2" name="sex"
                           placeholder="性别">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail3">出生日期</label>
                    <input type="date" class="form-control" id="exampleInputEmail3" name="birthday"
                           placeholder="输入真实出生日期">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail4">电话</label>
                    <input type="text" class="form-control" id="exampleInputEmail4" name="tel" placeholder="电话">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail8">eMail</label>
                    <input type="text" class="form-control" id="exampleInputEmail8" name="email" placeholder="email">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail5">家庭住址</label>
                    <input type="text" class="form-control" id="exampleInputEmail5" name="place"
                           placeholder="住址">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail6">所属部门</label>
                    <input type="text" class="form-control" id="exampleInputEmail6" name="department"
                           placeholder="部门">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail7">在职状态(1为在职,2为退休,3为辞职)</label>
                    <input type="number" min="1" max="3" class="form-control" id="exampleInputEmail7" name="incumbency"
                           placeholder="在职状态">
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
    function showStaffView(btn, workerId, nickName, name, sex, birthday, tel, email, place, department, incumbency) {
        btn.onclick = function () {
            clear();
            document.getElementById('changeStaff').style.display = 'block';
            document.getElementById('showStaff').style.display = 'none';
            document.getElementById('changeStaffLi').style.display = 'block';
            document.getElementById('title').innerHTML = '修改部门信息';

            //处理信息
            var num = 1;
            document.getElementById('exampleInputEmail0').value = workerId.innerHTML;
            document.getElementById('exampleInputEmail9').value = nickName.innerHTML;
            document.getElementById('exampleInputEmail1').value = name.innerHTML;
            document.getElementById('exampleInputEmail2').value = sex.innerHTML;
            document.getElementById('exampleInputEmail3').value = birthday.innerHTML;
            document.getElementById('exampleInputEmail4').value = tel.innerHTML;
            document.getElementById('exampleInputEmail8').value = email.innerHTML;
            document.getElementById('exampleInputEmail5').value = place.innerHTML;
            document.getElementById('exampleInputEmail6').value = department.innerHTML;
            if (incumbency.value == '在职') {
                num = 1;
            } else if (incumbency.value == '退休') {
                num = 2;
            } else if (incumbency.value == '辞职') {
                num = 3;
            }
            document.getElementById('exampleInputEmail7').value = num;
        };
    }

    function clear() {
        var listLi = document.getElementById('listLi');
        var aLi = listLi.getElementsByTagName('li');
        for (var i = 0; i < aLi.length - 1; i++) {
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
    var inf = document.getElementById('showStaff');
    var aChange = inf.getElementsByClassName('change');
    var aWorkerId = inf.getElementsByClassName('workerId');
    var aNickName = inf.getElementsByClassName('nickName');
    var aName = inf.getElementsByClassName('name');
    var aSex = inf.getElementsByClassName('sex');
    var aBirthday = inf.getElementsByClassName('birthday');
    var aTel = inf.getElementsByClassName('tel');
    var aEmail = inf.getElementsByClassName('email');
    var aPlace = inf.getElementsByClassName('place');
    var aDepartment = inf.getElementsByClassName('department');
    var aIncumbency = inf.getElementsByClassName('incumbency');
    document.getElementById('changeStaffLi').style.backgroundColor = '#000';
    document.getElementById('changeStaffLi').style.color = '#FFF';
    for (var i = 0; i < aChange.length; i++) {
        showStaffView(aChange[i], aWorkerId[i], aNickName[i], aName[i], aSex[i], aBirthday[i], aTel[i], aEmail[i], aPlace[i], aDepartment[i], aIncumbency[i]);
    }

    //修改视图取消/关闭事件
    document.getElementById('closeChangeBtn').onclick = function () {
        document.getElementById('changeStaff').style.display = 'none';
        document.getElementById('changeStaffLi').style.display = 'none';
        document.getElementById('showStaff').style.display = 'block';
        document.getElementById('newWorker').style.display = 'none';
        clear();
        document.getElementById('showStaffLi').className = 'active chose';
        document.getElementById('title').innerHTML = '职工列表';
    };

    //列表1点击事件
    function list1() {
        document.getElementById('changeStaff').style.display = 'none';
        document.getElementById('showStaff').style.display = 'none';
        document.getElementById('newWorker').style.display = 'block';
        document.getElementById('changeStaffLi').style.display = 'none';
        document.getElementById('title').innerHTML = '入职申请';
    }

    document.getElementById('newWorkerLi').onclick = function () {
        clear();
        this.className = 'active chose';
        list1();
    };
    //列表2点击事件
    document.getElementById('showStaffLi').onclick = function () {
        clear();
        this.className = 'active chose';
        document.getElementById('changeStaffLi').style.display = 'none';
        document.getElementById('changeStaff').style.display = 'none';
        document.getElementById('showStaff').style.display = 'block';
        document.getElementById('newWorker').style.display = 'none';
        document.getElementById('title').innerHTML = '职工列表';

    };
</script>


<%--<br>--%>
<%--<h2>入职申请</h2>--%>
<%--<table border="1">--%>
<%--    <c:forEach items="${newWorkers}" var="newWorker">--%>

<%--        <tr>--%>
<%--            <td>${newWorker.name}</td>--%>
<%--            <td>${newWorker.sex}</td>--%>
<%--            <td>${newWorker.birthday}</td>--%>
<%--            <td>${newWorker.email}</td>--%>
<%--            <td>${newWorker.place}</td>--%>
<%--            <td>${newWorker.department}</td>--%>
<%--            <td>--%>

<%--            <c:if ChineseToPinyin="${newWorker.state=='0'}">--%>
<%--                <a href="verification?V_method=through&newWorkerName=${newWorker.name}">通过</a>--%>
<%--                <a href="verification?V_method=withdraw&newWorkerName=${newWorker.name}">撤回</a>--%>
<%--            </c:if>--%>
<%--            <c:if ChineseToPinyin="${newWorker.state=='1'}">--%>
<%--                已通过--%>
<%--            </c:if>--%>
<%--            <c:if ChineseToPinyin="${newWorker.state=='2'}">--%>
<%--                已撤回--%>
<%--            </c:if>--%>
<%--            </td>--%>

<%--        </tr>--%>
<%--    </c:forEach>--%>

<%--</table>--%>


<%--<h2>职工列表</h2>--%>
<%--<table border="1">--%>
<%--    <tr>--%>
<%--        <td>工号</td>--%>
<%--        <td>姓名</td>--%>
<%--        <td>性别</td>--%>
<%--        <td>生日</td>--%>
<%--        <td>电话</td>--%>
<%--        <td>家庭住址</td>--%>
<%--    </tr>--%>
<%--   <c:forEach items="${workers}" var="worker">--%>
<%--       <tr>--%>
<%--           <td>${worker.workerId}</td>--%>
<%--           <td>${worker.name}</td>--%>
<%--           <td>${worker.sex}</td>--%>
<%--           <td>${worker.birthday}</td>--%>
<%--           <td>${worker.tel}</td>--%>
<%--           <td>${worker.place}</td>--%>
<%--       </tr>--%>
<%--   </c:forEach>--%>
<%--</table>--%>
