<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Changepeng
  Date: 2019/6/3
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="main">
    <div class="left col-sm-2 col-sm-offset-1 col-xs-12">
        <ul>
            <li id="showUserListLi" class="active chose">用户列表</li>
            <li id="showUserChangeLi">修改用户信息</li>
        </ul>
    </div>
    <div class="right col-sm-6 col-sm-offset-1 col-xs-12">
        <h3 id="title">用户列表</h3>
        <div class="inf" id="userInf">
            <table class="table myTable">
                <tr>
                    <td>用户ID</td>
                    <td>用户名</td>
                    <td>性别</td>
                    <td>生日</td>
                    <td>电话</td>
                    <td>eMail</td>
                    <td>所在地</td>
                    <td>操作</td>
                </tr>
                <c:forEach items="${users}" var="user">
                    <tr>
                        <td class="userId">${user.userId}</td>
                        <td class="userName">${user.userName}</td>
                        <td class="sex">${user.sex}</td>
                        <td class="birthday">${user.birthday}</td>
                        <td class="tel">${user.tel}</td>
                        <td class="email">${user.email}</td>
                        <td class="place">${user.place}</td>
                        <td>
                            <a href="user?U_method=delete&userName=${user.userName}">删除</a>
                            <a href="#" class="userChange">修改</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="changeUser" id="changeUser">
            <form action="user?U_method=changeUser" method="post">
                <div class="form-group">
                    <label for="exampleInputEmail2">用户ID</label>
                    <input type="text" class="form-control" readonly="readonly" id="exampleInputEmail2" name="userId"
                           placeholder="输入真实姓名，以便通过申请">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail3">用户名</label>
                    <input type="text" class="form-control" id="exampleInputEmail3" name="userName"
                           placeholder="输入真实姓名，以便通过申请">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail4">性别</label>
                    <input type="text" class="form-control" id="exampleInputEmail4" name="sex" placeholder="性别">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail5">出生年月</label>
                    <input type="date" class="form-control" id="exampleInputEmail5" name="birthday"
                           placeholder="请输入正确的出生日期">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail6">电话</label>
                    <input type="number" min="0000000" max="99999999999999" class="form-control" id="exampleInputEmail6" name="tel"
                           placeholder="电话">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail7">e-mail</label>
                    <input type="email" class="form-control" id="exampleInputEmail7" name="email" placeholder="邮箱">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail8">出生地</label>
                    <input type="text" class="form-control" id="exampleInputEmail8" name="place" placeholder="出生地">
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
    function showUserChangeView(btn,userId,username,sex,birthday,tel,email,place) {
        btn.onclick = function () {
            document.getElementById('exampleInputEmail2').value = userId.innerHTML;
            document.getElementById('exampleInputEmail3').value = username.innerHTML;
            document.getElementById('exampleInputEmail4').value = sex.innerHTML;
            document.getElementById('exampleInputEmail5').value = birthday.innerHTML;
            document.getElementById('exampleInputEmail6').value = tel.innerHTML;
            document.getElementById('exampleInputEmail7').value = email.innerHTML;
            document.getElementById('exampleInputEmail8').value = place.innerHTML;


            document.getElementById('changeUser').style.display = 'block';
            document.getElementById('userInf').style.display = 'none';
            document.getElementById('showUserListLi').className = 'active';
            document.getElementById('showUserChangeLi').style.display = 'block';
            document.getElementById('title').innerHTML = '修改用户信息';
        };
    }
</script>

<script>
    var inf = document.getElementById('userInf');
    var aChange = inf.getElementsByClassName('userChange');
    var aUserName = inf.getElementsByClassName('userName');
    var aSex = inf.getElementsByClassName('sex');
    var aBirthday = inf.getElementsByClassName('birthday');
    var aTel = inf.getElementsByClassName('tel');
    var aEmail = inf.getElementsByClassName('email');
    var aPlace = inf.getElementsByClassName('place');
    var aUserId = inf.getElementsByClassName('userId');
    document.getElementById('showUserChangeLi').style.backgroundColor = '#000';
    document.getElementById('showUserChangeLi').style.color = '#FFF';
    document.getElementById('showUserListLi').onclick = function () {
        document.getElementById('changeUser').style.display = 'none';
        document.getElementById('userInf').style.display = 'block';
        document.getElementById('showUserChangeLi').style.display = 'none';
        document.getElementById('showUserChangeLi').style.backgroundColor = '#000';
        document.getElementById('showUserChangeLi').style.color = '#FFF';
        document.getElementById('title').innerHTML = '用户列表';
    };
    ;
    for (var i = 0; i < aChange.length; i++) {
        showUserChangeView(aChange[i],aUserId[i],aUserName[i],aSex[i],aBirthday[i],aTel[i],aEmail[i],aPlace[i]);
    }
    document.getElementById('closeChangeBtn').onclick = function () {
        document.getElementById('changeUser').style.display = 'none';
        document.getElementById('userInf').style.display = 'block';
        document.getElementById('showUserChangeLi').style.display = 'none';
        document.getElementById('showUserChangeLi').style.backgroundColor = '#000';
        document.getElementById('showUserListLi').className = 'active chose';
        document.getElementById('showUserChangeLi').style.color = '#FFF';
        document.getElementById('title').innerHTML = '用户列表';
    };
</script>

