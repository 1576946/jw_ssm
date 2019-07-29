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
                <a href="${pageContext.request.contextPath}/Dorm_C/Pages.do" class="list-group-item active">宿舍管理</a>
                <a href="${pageContext.request.contextPath}/Dorm_C/Search.do" class="list-group-item">宿舍搜索</a>
                <a href="${pageContext.request.contextPath}/Dorm_C/Post.do" class="list-group-item">宿舍紧急情况</a>
                <a href="" role="button" data-toggle="modal" data-target="#myModal">添加宿舍</a>
                <!-- <a href="" role="button"  class="list-group-item" data-toggle="modal" data-target="#myModal">添加学生</a>-->
            </div>
        </div>
        <div class="col-md-10">
            <div class="page-header">
            </div>
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="${pageContext.request.contextPath}/Dorm_C/Pages.do">宿舍管理</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/Dorm_C/Search.do">宿舍搜索</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/Dorm_C/Post.do">宿舍紧急情况</a>
                </li>
                <li>
                    <a href="" role="button" data-toggle="modal" data-target="#myModal">添加宿舍</a>
                </li>
            </ul>
            <table class="table">
                <thead>
                <tr>
                    <th>宿舍编号</th>
                    <th>宿舍人数</th>
                    <th>宿舍水费</th>
                    <th>宿舍电费</th>
                    <th>损坏维修</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${roomingList}" var="rooming">
                    <tr>
                        <td>${rooming.s_roomOfNumber }</td>
                        <td>${rooming.numberOfPeople }</td>
                        <td>${rooming.waterOfFee }</td>
                        <td>${rooming.electricOfFee }</td>
                        <td>${rooming.errorOfAppliance }</td>
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
                    <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
                    </li>
                    <li class="active"><a href="#">1</a></li>
                    <li><a href="#">2 </a></li>
                    <li><a href="#">3 </a></li>
                    <li><a href="#">4 </a></li>
                    <li><a href="#">5 </a></li>
                    <li><a href="#">6 </a></li>
                    <li><a href="#"><span aria-hidden="true">&raquo;</span></a></li>
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
                <h4 class="modal-title" id="myModalLabel">添加宿舍</h4>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/Dorm_C/AddHome.do" method="post">
                    <div class="form-group">
                        <label for="addnumber">宿舍编号</label>
                        <input type="text" id="addnumber" class="form-control" placeholder="宿舍编号" name="S_roomOfNumber">
                    </div>
                    <div class="form-group">
                        <label for="addManNumber">宿舍人数</label>
                        <input type="text" id="addManNumber" class="form-control" placeholder="宿舍人数"
                               name="numberOfPeople">
                    </div>
                    <div class="form-group">
                        <label for="addWaterFee">宿舍水费</label>
                        <input type="text" id="addWaterFee" class="form-control" placeholder="宿舍水费" name="waterOfFee">
                    </div>
                    <div class="form-group">
                        <label for="addFee">宿舍电费</label>
                        <input type="text" id="addFee" class="form-control" placeholder="宿舍电费" name="electricOfFee">
                    </div>
                    <div class="form-group">
                        <label for="addError">损坏维修</label>
                        <input type="text" id="addError" class="form-control" placeholder="损坏维修"
                               name="errorOfAppliance">
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