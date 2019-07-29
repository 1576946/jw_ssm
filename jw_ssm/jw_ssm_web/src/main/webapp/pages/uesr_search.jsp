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
</head>
<body>
<!--导航-->
<jsp:include page="header.jsp"/>
<!--导航-->

<div class="container">
    <div class="row">
        <div class="col-md-2">
            <div class="list-group">
                <a href="${pageContext.request.contextPath}/StudentManage/Pages.do" class="list-group-item">学生管理</a>
                <a href="${pageContext.request.contextPath}/StudentManage/StudentSearch.do"
                   class="list-group-item active">学生搜索</a>
                <a href="" role="button" class="list-group-item" data-toggle="modal" data-target="#myModal">添加学生</a>
            </div>
        </div>
        <div class="col-md-10">
            <div class="page-header">
                <h1>学生管理</h1>
            </div>
            <ul class="nav nav-tabs">
                <li>
                    <a href="${pageContext.request.contextPath}/StudentManage/Pages.do">学生列表</a>
                </li>
                <li class="active">
                    <a href="${pageContext.request.contextPath}/StudentManage/StudentSearch.do">学生搜索</a>
                </li>
                <li>
                    <a href="" role="button" data-toggle="modal" data-target="#myModal">添加学生</a>
                </li>
            </ul>
            <form action="#" class="uesr_search">
                <div class="alert alert-info" role="alert">
                    <strong>技巧提示：</strong>
                    支持模糊搜索和匹配搜索，匹配搜索使用*代替！
                </div>
                <div class="form-group">
                    <label for="name">学生名字</label>
                    <input type="text" id="name" class="form-control" placeholder="请输入学生名">
                </div>
                <div class="form-group">
                    <label for="uid">ID</label>
                    <input type="text" id="uid" class="form-control" placeholder="输入学生ID">
                </div>
                <div class="form-group">
                    <label for="yonghuzu">选择学生组</label>
                    <select id="yonghuzu" class="form-control">
                        <option>普通学生</option>
                        <option>宿舍舍长</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-default">提交</button>
            </form>
        </div>
    </div>
</div>


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">添加学生</h4>
            </div>
            <div class="modal-body">
                <form action="#">
                    <div class="form-group">
                        <label for="addname">学生性名</label>
                        <input type="text" id="addname" class="form-control" placeholder="学生性名">
                    </div>
                    <div class="form-group">
                        <label for="addphone">学生电话</label>
                        <input type="text" id="addphone" class="form-control" placeholder="学生电话">
                    </div>
                    <div class="form-group">
                        <label for="addemail">请输入学生邮箱</label>
                        <input type="email" id="addemail" class="form-control" placeholder="请输入学生邮箱">
                    </div>
                    <div class="form-group">
                        <label for="addhost">学生信息</label>
                        <input type="text" id="addhost" class="form-control" placeholder="学生信息">
                    </div>
                    <div class="form-group">
                        <label for="addpost">学生宿舍编号</label>
                        <input type="text" id="addpost" class="form-control" placeholder="学生宿舍编号">
                    </div>
                    <div class="form-group">
                        <label for="addyonghuzu">所属用户组</label>
                        <select id="addyonghuzu" class="form-control">
                            <option>普通学生</option>
                            <option>宿舍舍长</option>
                        </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary">提交</button>
            </div>
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