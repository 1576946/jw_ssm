<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
    <title>学生宿舍管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-maizi.css"/>
    <link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
</head>
<body>
<!--导航-->
<jsp:include page="header.jsp"/>
<!--导航-->

<div class="container">
    <div class="row">
        <div class="col-md-2">
            <div class="list-group">
                <a href="${pageContext.request.contextPath}/Dorm_C/Pages.do" class="list-group-item">宿舍管理</a>
                <a href="${pageContext.request.contextPath}/Dorm_C/Search.do" class="list-group-item">宿舍搜索</a>
                <a href="${pageContext.request.contextPath}/Dorm_C/Post.do" class="list-group-item  active">宿舍紧急情况</a>
            </div>
        </div>
        <div class="col-md-10">
            <div class="page-header">
            </div>
            <ul class="nav nav-tabs">
                <li>
                    <a href="${pageContext.request.contextPath}/Dorm_C/Pages.do">宿舍管理</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/Dorm_C/Search.do">宿舍搜索</a>
                </li>
                <li   class="active">
                    <a href="${pageContext.request.contextPath}/Dorm_C/Post.do">宿舍紧急情况</a>
                    <!-- <a href="" role="button" data-toggle="modal" data-target="#myModal">添加学生</a>-->
                </li>
            </ul>
            <form action="${pageContext.request.contextPath}/Dorm_C/AddMiss.do" class="mar_t15" method="post">
                <div class="form-group">
                    <label for="title">主题</label>
                    <input type="text" id="title" class="form-control" placeholder="主题" name="R_theme">
                </div>

                <div class="form-group">
                    <label for="title">时间</label>
                    <!--指定 date标记-->
                    <div class='input-group date' id='datetimepicker1'>
                        <input type='text' class="form-control" placeholder="请输入时间" name="R_time_str"/>
                        <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                                </span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="content">具体情况</label>
                    <textarea id="content" class="form-control" rows="15" cols="10" placeholder="请输入内容正文部分" name="R_context"></textarea>
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox">全局置顶
                    </label>
                    <button type="submit" class="btn btn-default pull-right">开始预警</button>
                </div>
            </form>

        </div>
    </div>
</div>

<!--footer-->
<jsp:include page="foot.jsp"/>
<!--footer-->

<script>
    $(function () {
        $('#datetimepicker1').datetimepicker({
            format: 'YYYY-MM-DD hh:mm',
            locale: moment.locale('zh-cn')
        });
    });</script>
<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"></script>
<script src="https://cdn.bootcss.com/moment.js/2.22.0/moment-with-locales.js"></script>
<script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>
</html>