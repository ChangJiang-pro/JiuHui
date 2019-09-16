<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/28
  Time: 19:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%@include file="header.jsp"%>
    <nav class="navbar navbar-default" role="navigation" style="width: 930px;height: 70px;margin-left: 20px">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">太平洋保险</a>
            </div>
                <ul class="nav navbar-nav navbar-right" style="width: 150px">
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span><strong>注册</strong></a></li>
                    <li><a href="${pageContext.request.contextPath}/user/logout"><span class="glyphicon glyphicon-log-in"></span><strong>注销</strong></a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="col-sm-3" style="width: 300px;">
        <a href="#" class="list-group-item active">
            <h4>菜单栏</h4>
        </a>
        <a href="${pageContext.request.contextPath}/jsps/member/viewData.jsp" class="list-group-item"><h5>查看数据</h5></a>
        <c:if test="${user.level==0}">
        <a href="${pageContext.request.contextPath}/jsps/member/orzManagement.jsp" class="list-group-item" id="a1"><h5>机构管理</h5></a>
        <a href="${pageContext.request.contextPath}/jsps/member/userManagement.jsp" class="list-group-item" id="a2"><h5>用户管理</h5></a>
        </c:if>
    <c:if test="${user.level!=0}">
        <a href="${pageContext.request.contextPath}/jsps/member/forecast.jsp" class="list-group-item"><h5>预报数据</h5></a>
        <a href="${pageContext.request.contextPath}/jsps/member/report.jsp" class="list-group-item"><h5>上报数据</h5></a>
    </c:if>


</div>
</body>
<script>
    $(function () {

    })
</script>
</html>
