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
<!--导航-->
<jsp:include page="header.jsp"/>
<!--导航-->

<div class="container">
    <div class="row">
        <div class="col-md-2">
            <div class="list-group">
                <a href="${pageContext.request.contextPath}/Visit/Pages.do" class="list-group-item active">来访管理</a>
                <a href="${pageContext.request.contextPath}/Visit/AddPages.do" class="list-group-item">来访内容</a>
            </div>
        </div>
        <div class="col-md-10">
            <div class="page-header">
            </div>
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="${pageContext.request.contextPath}/Visit/Pages.do">来访管理</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/Visit/AddPages.do">添加来访</a>
                </li>
            </ul>
            <table class="table">
                <thead>
                <tr>
                    <th>来访标题</th>
                    <th>来访人</th>
                    <th>来访时间</th>
                    <th>离开时间</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${visitManList.list}" var="visitMan">
                    <tr>
                        <th scope="row">${visitMan.theme_cause}</th>
                        <td>${visitMan.theme_name}</td>
                        <td>${visitMan.theme_enter_str}</td>
                        <td>${visitMan.theme_out_str}</td>
                        <td>
                            <div role="presentation" class="dropdown">
                                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown" href="#"
                                        role="button" aria-haspopup="true" aria-expanded="false">
                                    操作<span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a href="#">预警</a></li>
                                    <li><a href="#">全局置顶</a></li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                <%--<tr>
                    <th scope="row">探访同学</th>
                    <td>小李子</td>
                    <td>2019/06/28 14:12</td>
                    <td>2019/06/28 18:00</td>
                    <td>
                        <div role="presentation" class="dropdown">
                            <button class="btn btn-default dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                                操作<span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="#">预警</a></li>
                                <li><a href="#">查看具体内容</a></li>
                                <li><a href="#">全局置顶</a></li>
                            </ul>
                        </div>
                    </td>
                </tr>--%>

                </tbody>
            </table>
            <nav class="pull-right">
                <ul class="pagination">
                    <li>
                        <a href="${pageContext.request.contextPath}/Visit/Pages.do?page=${visitManList.pageNum-1}&size=${visitManList.pageSize}"
                           aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
                    <c:forEach begin="1" end="${visitManList.pages}" var="pageNum">
                        <li>
                            <a href="${pageContext.request.contextPath}/Visit/Pages.do?page=${pageNum}&size=${visitManList.pageSize}">${pageNum}</a>
                        </li>
                    </c:forEach>
                    <li>
                        <a href="${pageContext.request.contextPath}/Visit/Pages.do?page=${visitManList.pageNum+1}&size=${visitManList.pageSize}"><span
                                aria-hidden="true">&raquo;</span></a></li>



                </ul>
            </nav>
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