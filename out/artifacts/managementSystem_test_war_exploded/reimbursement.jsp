<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
报销系统
  Created by IntelliJ IDEA.
  User: Changepeng
  Date: 2019/6/3
  Time: 18:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%
    String send = request.getParameter("send");
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
    }
%>





<div class="main">
    <div class="right col-sm-10 col-sm-offset-1 col-xs-12">
        <h3 id="title">报销列表</h3>

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




        <div class="re_inf" id="newWorker">
            <table class="table myTable">
                <tr>
                    <td>报销单号</td>
                    <td>报销人员ID</td>
                    <td>报销金额</td>
                    <td>报销缘由</td>
                    <td>操作</td>
                </tr>
                <c:forEach items="${reimbursements}" var="reimbursement">
                    <tr>
                        <td>${reimbursement.r_id}</td>
                        <td>${reimbursement.workerId}</td>
                        <td>${reimbursement.r_price}</td>
                        <td>${reimbursement.reason}</td>
                        <td>
                            <c:if test="${reimbursement.state==0}">
                                <a href="ReimbursementManage?R_method=through&R_id=${reimbursement.r_id}">通过</a>
                                <a href="ReimbursementManage?R_method=withdraw&R_id=${reimbursement.r_id}">撤回</a>
                            </c:if>
                            <c:if test="${reimbursement.state==1}">
                                已通过
                            </c:if>
                            <c:if test="${reimbursement.state==2}">
                                已打回
                            </c:if>
                        </td>

                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</div>

<script>
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


<%--<h2>全部报销列表</h2>--%>
<%--<table border="1">--%>
<%--    <c:forEach items="${reimbursements}" var="reimbursement">--%>
<%--        <tr>--%>
<%--            <td>${reimbursement.r_id}</td>--%>
<%--            <td>${reimbursement.workerId}</td>--%>
<%--            <td>${reimbursement.r_price}</td>--%>
<%--            <td>--%>
<%--                <c:if ChineseToPinyin="${reimbursement.state==0}">--%>
<%--                    <a href="ReimbursementManage?R_method=through&R_id=${reimbursement.r_id}">通过</a>--%>
<%--                    <a href="ReimbursementManage?R_method=withdraw&R_id=${reimbursement.r_id}">撤回</a>--%>
<%--                </c:if>--%>
<%--                <c:if ChineseToPinyin="${reimbursement.state==1}">--%>
<%--                    已通过--%>
<%--                </c:if>--%>
<%--                <c:if ChineseToPinyin="${reimbursement.state==2}">--%>
<%--                    已打回--%>
<%--                </c:if>--%>
<%--            </td>--%>

<%--        </tr>--%>
<%--    </c:forEach>--%>
<%--</table>--%>