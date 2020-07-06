<%--
  Created by IntelliJ IDEA.
  User: 13716
  Date: 2020/6/21
  Time: 9:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>XXX影院</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <style>
        .thumbnail {
            text-align: center;
        }
        .thumbnail:hover {
            border: 1px solid blue;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-default">
        <div class="container-fluid">

            <div class="navbar-header">
                <a href="#" class="navbar-brand">电影</a>
            </div>

            <div class="collapse navbar-collapse" id="navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">首页 <span class="sr-only">(current)</span></a></li>
                </ul>
                <form class="navbar-form navbar-left">
                    <div class="form-group">
                        <label for="search" hidden></label>
                        <input type="text" id="search" class="form-control" placeholder="搜索">
                    </div>
                    <button type="submit" class="btn btn-default">搜索</button>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="login">登陆</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <h2>最热电影</h2>
        <div class="row">
            <div class="col-lg-3">
                <div class="thumbnail">
                    <img src="http://pic3.iqiyipic.com/image/20200630/b5/ed/v_62815967_m_601_m12_260_360.webp" alt="图片备注">
                    <div class="caption">
                        <h4>东邪西毒</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <h2>最新电影</h2>
        <div class="row">
            <div class="col-lg-3">
                <div class="thumbnail">
                    <img src="http://pic3.iqiyipic.com/image/20200630/b5/ed/v_62815967_m_601_m12_260_360.webp" alt="图片备注">
                    <div class="caption">
                        <h4>东邪西毒</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="jsp/footer.jsp" %>

</body>
</html>
