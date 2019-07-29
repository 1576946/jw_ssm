<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
    <title>学生宿舍管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-maizi.css"/>
</head>
<body>
<jsp:include page="header.jsp"/>
<!--导航-->


<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="page-header">
            </div>

            <!-- 正文区域 -->
            <table class="table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>开始时间</th>
                    <th>访问用户</th>
                    <th>访问IP</th>
                    <th>资源URL</th>
                    <th>时长</th>
                    <th>访问方法</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${sysLogs}" var="syslog">
                    <tr>
                            <%--<td><input name="ids" type="checkbox"></td>--%>
                        <td>${syslog.id}</td>
                        <td>${syslog.visitTimeStr}</td>
                        <td>${syslog.username }</td>
                        <td>${syslog.ip }</td>
                        <td>${syslog.url}</td>
                        <td> ${syslog.executionTime}ms</td>
                        <td>${syslog.method}</td>
                    </tr>
                </c:forEach>
                </tbody>

            </table>


        </div>
    </div>
</div>


<!--footer-->
<jsp:include page="foot.jsp"/>
<!--footer-->


<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

</body>

</html>