<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Changepeng
  Date: 2019/6/8
  Time: 12:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="main">
    <div class="left col-sm-2 col-sm-offset-1 col-xs-12">
        <ul id="listLi">
            <li id="oldReimbursementLi" class="active chose">历史报销单</li>
            <li id="newReimbursementLi" class="active">新建报销单</li>
        </ul>
    </div>
    <div class="right col-sm-6 col-sm-offset-1 col-xs-12">
        <h3 id="title">历史报销单</h3>


        <div class="errorMessage alert alert-danger alert-dismissible col-lg-12" id="errorMessage" role="alert" style="display: none;">
            <button  type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong>Warning!</strong><span id="errorInf">Better check yourself, you're not looking too good.</span>
        </div>
        <div style="display: none;" class="successMessage alert alert-success alert-dismissible col-lg-12" id="successMessage" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <strong>Success!</strong> <span id="successInf">Better check yourself, you're not looking too good.</span>
        </div>





        <div class="inf" id="oldReimbursement">
            <table class="table myTable">
                <tr>
                    <td>报销单号</td>
                    <td>报销人ID</td>
                    <td>报销金额</td>
                    <td>缘由</td>
                    <td>状态</td>
                </tr>
                <c:forEach items="${reimbursements}" var="reimbursement">
                    <tr>
                        <td>${reimbursement.r_id}</td>
                        <td>${reimbursement.workerId}</td>
                        <td>${reimbursement.r_price}</td>
                        <td>${reimbursement.reason}</td>
                        <td>
                            <c:if test="${reimbursement.state=='0'}">
                                申请中
                            </c:if>
                            <c:if test="${reimbursement.state=='1'}">
                                通过申请
                            </c:if>
                            <c:if test="${reimbursement.state=='2'}">
                                撤回
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="newReimbursement col-sm-6 col-sm-offset-3"  style="display: none;" id="newReimbursement">
            <form action="workerReimbursementManage" method="post">
                <div class="form-group">
                    <label for="exampleInputEmail2">报销金额</label>
                    <input type="text" class="form-control" id="exampleInputEmail2" name="r_price" placeholder="报销金额">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail3">报销缘由</label>
                    <textarea type="text" class="form-control" id="exampleInputEmail3" name="reason" placeholder="报销缘由">
                    </textarea>
                </div>
                <button type="submit" class="btn btn-default btn-primary col-sm-2 col-sm-offset-5 col-xs-2 col-xs-offset-5">提交</button>
            </form>
        </div>
    </div>

</div>


<script>
    function clear(){
        var listLi = document.getElementById('listLi');
        var aLi = listLi.getElementsByTagName('li');
        for(var i=0;i<aLi.length;i++){
            aLi[i].className = 'active';
        }
    }
    function showErrorMessage(str){
        var errorMessage = document.getElementById('errorInf');
        var errorMessageView = document.getElementById('errorMessage');
        errorMessageView.style.display = 'block';
        errorMessage.innerHTML = str;
    }
    function showErrorMessage(str){
        var successMessage = document.getElementById('successInf');
        var successMessageView = document.getElementById('successMessage');
        successMessageView.style.display = 'block';
        successMessage.innerHTML = str;
    }
</script>

<script>

    //列表1点击事件
    document.getElementById('oldReimbursementLi').onclick = function(){
        clear();
//        alert(123);
        this.className = 'active chose';
        document.getElementById('newReimbursement').style.display = 'none';
        document.getElementById('oldReimbursement').style.display = 'block';
        document.getElementById('title').innerHTML = '历史报销单';
    };
    //列表2点击事件
    document.getElementById('newReimbursementLi').onclick = function(){
        clear();
        this.className = 'active chose';
        document.getElementById('newReimbursement').style.display = 'block';
        document.getElementById('oldReimbursement').style.display = 'none';
        document.getElementById('title').innerHTML = '新建报销单';

    };
</script>
