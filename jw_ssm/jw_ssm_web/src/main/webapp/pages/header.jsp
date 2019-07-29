<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-maizi.css"/>
</head>
<body>

<!--导航-->
<nav class="navbar navbar-default">
    <div class="container">
        <!--小屏幕导航按钮和logo-->
        <div class="navbar-header">
            <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="#" class="navbar-brand">你好 管理员</a>
        </div>
        <!--小屏幕导航按钮和logo-->
        <!--导航-->
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <%--class="active"--%>
                <li><a href="${pageContext.request.contextPath}/index/Pages.do"><span
                        class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;管理主页</a></li>
                <li><a href="${pageContext.request.contextPath}/StudentManage/Pages.do?page=1&size=7"><span
                        class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;学生管理</a></li>
                <li><a href="${pageContext.request.contextPath}/Visit/Pages.do?page=1&size=7"><span
                        class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;来访登记</a></li>
                <li><a href="${pageContext.request.contextPath}/Dorm_C/Pages.do?page=1&size=7"><span
                        class="glyphicon glyphicon-tags"></span>&nbsp;&nbsp;宿舍资源</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        admin
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="dLabel">
                        <li><a href="#"><span class="glyphicon glyphicon-screenshot"></span>&nbsp;&nbsp;主页面</a></li>
                        <li><a href="${pageContext.request.contextPath}/sysLog/findAll.do"><span
                                class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;日志文件</a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-cog"></span>&nbsp;&nbsp;个人设置</a></li>
                        <!--<li><a href="index.jsp"><span class="glyphicon glyphicon-credit-card"></span>&nbsp;&nbsp;账户中心</a></li>
                        <li><a href="index.jsp"><span class="glyphicon glyphicon-heart"></span>&nbsp;&nbsp;我的收藏</a></li>-->
                    </ul>
                </li>
                <li><a href="${pageContext.request.contextPath}/logout.do"><span class="glyphicon glyphicon-off"></span>&nbsp;&nbsp;退出</a>
                </li>
            </ul>
        </div>
        <!--导航-->

    </div>
</nav>
<!--导航-->
<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>
</html>