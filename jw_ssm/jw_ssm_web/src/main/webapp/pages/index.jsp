<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
    <title>学生管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-maizi.css"/>
</head>
<body>

<jsp:include page="header.jsp"/>

<!--警告框-->
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="alert alert-danger alert-dismissible fade in" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                        aria-hidden="true">×</span></button>
                <h4>有非法进入，急需处理！</h4>
                <p>已有n人非法进入，且未被处理，请处理！！</p>
                <p>
                    <button type="button" class="btn btn-danger">我已处理</button>
                    <button type="button" class="btn btn-default" data-dismiss="alert">稍后处理</button>
                </p>
            </div>
        </div>
        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">学生实时数据统计</div>
                <div class="panel-body">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>统计人数</th>
                            <th>今日</th>
                            <th>昨日</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th scope="row">已出人数</th>
                            <td>3800</td>
                            <td>4105</td>
                        </tr>
                        <tr>
                            <th scope="row">已入人数</th>
                            <td>4100</td>
                            <td>5112</td>
                        </tr>
                        <tr>
                            <th scope="row">非法进入</th>
                            <td>15</td>
                            <td>26</td>
                        </tr>
                        <tr>
                            <th scope="row">今日访客</th>
                            <td>15</td>
                            <td>11</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">今日公告</div>
                <ul class="list-group">
                    <%--<c:forEach items="${itemlist }" var="item" varStatus="status">
                    <li class="list-group-item">
                        <a href="#" ><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;<c:out value="${i}"/>  <small class="pull-right">2019/06/27</small></a>
                    </li>
                    </c:forEach>--%>
                    <li class="list-group-item">
                        <a href="index.jsp"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;426卫生不过关 限电一周
                            <small class="pull-right">2019/06/27</small>
                        </a></li>
                    <li class="list-group-item">
                        <a href="index.jsp"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;426卫生不过关 限电一周
                            <small class="pull-right">2019/06/27</small>
                        </a>
                    </li>
                    <li class="list-group-item">
                        <a href="index.jsp"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;457 还未交电费
                            请尽早交付 以免停电
                            <small class="pull-right">2019/06/27</small>
                        </a>
                    </li>
                    <li class="list-group-item">
                        <a href="index.jsp"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;526卫生不过关 限电一周
                            <small class="pull-right">2019/06/27</small>
                        </a>
                    </li>
                    <li class="list-group-item">
                        <a href="index.jsp"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;126卫生不过关 限电一周
                            <small class="pull-right">2019/06/27</small>
                        </a>
                    </li>
                    <li class="list-group-item">
                        <a href="index.jsp"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;226卫生不过关 限电一周
                            <small class="pull-right">2019/06/27</small>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">今日实时人流量统计</div>
                <div class="panel-body">
                    <canvas id="canvas" class="col-md-12"></canvas>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="panel panel-default">
                <div class="panel-heading">设备信息</div>
                <div class="panel-body">
                    <p>水费已交率：40%</p>
                    <div class="progress">
                        <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar"
                             aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%"></div>
                    </div>
                    <p>电费已交率：20%</p>
                    <div class="progress">
                        <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%"></div>
                    </div>
                    <p>宿舍使用率：60%</p>
                    <div class="progress">
                        <div class="progress-bar progress-bar-warning progress-bar-striped" role="progressbar"
                             aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%"></div>
                    </div>
                    <p>门窗损害率：80%</p>
                    <div class="progress">
                        <div class="progress-bar progress-bar-danger progress-bar-striped" role="progressbar"
                             aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">团队留言板</div>
                <div class="panel-body">
                    <div class="col-md-7">
                        <div class="media well">
                            <div class="media-left">
                                <a href="#">
                                    <img class="media-object wh64" src="${pageContext.request.contextPath}/img/a.png"
                                         alt="张二姐">
                                </a>
                            </div>

                            <div class="media-body">
                                <h4 class="media-heading">张二姐</h4>
                                牛二哥 、 426宿舍的锁坏了，有时间给娃修下
                            </div>
                        </div>

                        <div class="media well">
                            <div class="media-body text-right">
                                <h4 class="media-heading">维修大哥</h4>
                                收到，今天就去修
                            </div>
                            <div class="media-right">
                                <a href="#">
                                    <img class="media-object wh64" src="${pageContext.request.contextPath}/img/b.png"
                                         alt="维修大哥">
                                </a>
                            </div>
                        </div>

                        <div class="media well">
                            <div class="media-body text-right">
                                <h4 class="media-heading">维修大哥</h4>
                                你给学生说下，宿舍留个人哈！我马上去！
                            </div>
                            <div class="media-right">
                                <a href="#">
                                    <img class="media-object wh64" src="${pageContext.request.contextPath}/img/b.png"
                                         alt="维修大哥">
                                </a>
                            </div>
                        </div>

                        <div class="media well">
                            <div class="media-left">
                                <a href="#">
                                    <img class="media-object wh64" src="${pageContext.request.contextPath}/img/a.png"
                                         alt="张二姐">
                                </a>
                            </div>
                            <div class="media-body">
                                <h4 class="media-heading">张二姐</h4>
                                好的 ，我给学生联系
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <form action="#">
                            <div class="form-group">
                                <label for="text1">输入留言内容</label>
                                <textarea class="form-control" id="text1" rows="5" cols="10"
                                          placeholder="请输入留言内容"></textarea>
                                <button type="submit" class="btn btn-default mar_t15">留言</button>
                            </div>
                        </form>
                        <div class="panel panel-default">
                            <div class="panel-heading">学校联系手册</div>
                            <div class="panel-body">
                                <ul class="list-group">
                                    <li class="list-group-item">校长(哈大哥)：<span class="glyphicon glyphicon-phone"></span>&nbsp;&nbsp;13134848615
                                    </li>
                                    <li class="list-group-item">维修大哥(牛二哥)：<span
                                            class="glyphicon glyphicon-phone"></span>
                                    <li class="list-group-item">后勤主任(西小姐)：<span
                                            class="glyphicon glyphicon-phone"></span>&nbsp;&nbsp;13456127694
                                    </li>
                                    <li class="list-group-item">宿管老师(张二姐)：<span
                                            class="glyphicon glyphicon-phone"></span>&nbsp;&nbsp;13457815482
                                    </li>
                                    <li class="list-group-item">宿管老师(刘阿姨)：<span
                                            class="glyphicon glyphicon-phone"></span>&nbsp;&nbsp;13134567782&nbsp;&nbsp;<span
                                            class="glyphicon glyphicon-phone-alt"></span>&nbsp;&nbsp;028-888888
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<jsp:include page="foot.jsp"/>

<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/Chart.js"></script>
<script src="${pageContext.request.contextPath}/js/script.js"></script>
</body>
</html>