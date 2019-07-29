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
        <div class="col-md-2">
            <div class="list-group">
                <a href="${pageContext.request.contextPath}/StudentManage/Pages.do"
                   class="list-group-item active">学生管理</a>
                <a href="${pageContext.request.contextPath}/StudentManage/StudentSearch.do"
                   class="list-group-item">学生搜索</a>
                <a href="" role="button" class="list-group-item" data-toggle="modal" data-target="#myModal">添加学生</a>
            </div>
        </div>
        <div class="col-md-10">
            <div class="page-header">
                <h1>学生管理</h1>
            </div>
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="${pageContext.request.contextPath}/StudentManage/Pages.do">学生列表</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/StudentManage/StudentSearch.do">学生搜索</a>
                </li>
                <li>
                    <a href="" role="button" data-toggle="modal" data-target="#myModal">添加学生</a>
                </li>
            </ul>
            <table class="table">
                <thead>
                <tr>
                    <th>学号</th>
                    <th>名字</th>
                    <th>学院</th>
                    <th>班级</th>
                    <th>电话号码</th>
                    <th>宿舍号</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <%--<tr>
                    <th scope="row">1</th>
                    <td>张三</td>
                    <td>计算机学院</td>
                    <td>机科2班</td>
                    <td>2016</td>
                    <td>216</td>
                    <td>
                        <div role="presentation" class="dropdown">
                            <button class="btn btn-default dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                                操作<span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                               <li><a href="#">编辑</a></li>
                               <li><a href="#">删除</a></li>
                               <li><a href="#">锁定</a></li>
                               <li><a href="#">修改密码</a></li>
                            </ul>
                        </div>
                    </td>
                </tr>--%>
                <c:forEach items="${studentList.list}" var="student">

                    <tr>
                            <%--<td><input name="ids" type="checkbox"></td>--%>
                        <td>${student.s_number }</td>
                        <td>${student.s_name }</td>
                        <td>${student.s_academy }</td>
                        <td>${student.s_sclass }</td>
                        <td>${student.s_tel }</td>
                        <td>${student.s_roomOfNumber }</td>
                        <td>
                            <div role="presentation" class="dropdown">
                                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown" href="#"
                                        role="button" aria-haspopup="true" aria-expanded="false">
                                    操作<span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a href="#">编辑</a></li>
                                    <li><a href="#">删除</a></li>
                                    <li><a href="#">锁定</a></li>
                                    <li><a href="#">修改密码</a></li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                </c:forEach>


                </tbody>
            </table>
            <nav class="pull-right">
                <ul class="pagination">
                    <li>
                        <a href="${pageContext.request.contextPath}/StudentManage/Pages.do?page=${studentList.pageNum-1}&size=${studentList.pageSize}"
                           aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
                    <c:forEach begin="1" end="${studentList.pages}" var="pageNum">
                        <li>
                            <a href="${pageContext.request.contextPath}/StudentManage/Pages.do?page=${pageNum}&size=${studentList.pageSize}">${pageNum}</a>
                        </li>
                    </c:forEach>
                    <li>
                        <a href="${pageContext.request.contextPath}/StudentManage/Pages.do?page=${studentList.pageNum+1}&size=${studentList.pageSize}"><span
                                aria-hidden="true">&raquo;</span></a></li>
                </ul>
            </nav>
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
                <h4 class="modal-title" id="myModalLabel">添加用户</h4>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/StudentManage/addStudent.do" method="post">
                    <div class="form-group">
                        <label for="S_number">学生编号</label>
                        <input type="text" id="S_number" name="S_number" class="form-control" placeholder="如：190101">
                    </div>
                    <div class="form-group">
                        <label for="S_name">学生姓名</label>
                        <input type="text" id="S_name" name="S_name" class="form-control" placeholder="学生姓名">
                    </div>
                    <div class="form-group">
                        <label for="S_tel">学生电话</label>
                        <input type="text" id="S_tel" name="S_tel" class="form-control" placeholder="学生电话">
                    </div>
                    <div class="form-group">
                        <label for="S_age">学生年龄</label>
                        <input type="text" id="S_age" name="S_age" class="form-control" placeholder="学生年龄">
                    </div>

                    <div class="form-group">
                        <label for="S_sex">学生性别</label>
                        <select id="S_sex" class="form-control" name="S_sex">
                            <option>男</option>
                            <option>女</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="S_sclass">学生班级</label>
                        <input type="text" id="S_sclass" name="S_sclass" class="form-control" placeholder="学生班级">
                    </div>
                    <div class="form-group">
                        <label for="S_roomOfNumber">学生宿舍编号</label>
                        <input type="text" id="S_roomOfNumber" name="S_roomOfNumber" class="form-control"
                               placeholder="学生宿舍编号">
                    </div>
                    <div class="form-group">
                        <label for="S_academy">所属学院</label>
                        <select id="S_academy" class="form-control" name="S_academy">
                            <option>计算机学院</option>
                            <option>文学院</option>
                            <option>外语学院</option>
                        </select>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="submit" class="btn btn-primary">提交</button>
                    </div>
                </form>
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