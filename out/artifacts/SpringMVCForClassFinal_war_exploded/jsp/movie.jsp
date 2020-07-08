<%--
  Created by IntelliJ IDEA.
  User: 13716
  Date: 2020/7/5
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>电影详情</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <style>
        .fixed-bottom {
            width: 100%;
            position: fixed;
            bottom: 0;
            background: #5e5e5e;
            color: white;
            height: 100px;
        }
        .buy {
            position: absolute;
            right: 3rem;
            top: 50%;
            transform: translateY(-50%);
            background: #2e6da4;
            color: red;
            padding: 1rem;
            font-size: 5rem;
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>
    <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/">首页</a></li>
        <li class="active" id="currentMovie">${movie.name}</li>
    </ol>

    <div class="container">
        <div class="row">
            <div class="col-lg-4">
                <img src="${pageContext.request.contextPath}/media/${movie.logoPath}" alt="电影" class="img-thumbnail">
            </div>
            <div class="col-lg-5 col-lg-offset-1">
                <h2>电影名称: <strong>${movie.name}</strong></h2>
                <p>电影类型: <strong>${movie.type}</strong></p>
                <p>上传时间: <strong>${movie.upload_time}</strong></p>
                <p>价格: <strong>${movie.price}</strong></p>
                <p>部署房间: <strong>${movie.rooms}</strong></p>
            </div>
            <div class="col-lg-2">
                评分: <strong>${movie.score}</strong>
            </div>
        </div>

    </div>
    <div class="fixed-bottom">
        <div class="buy">购票</div>
    </div>
    <script>
        (function () {
            let path = window.location.search.substr(1);
            let all_path = path.split("&");
            let movieId;
            all_path.forEach(element => {
                let args = element.split("=");
                if (args[0] === "movieId") {
                    movieId = args[1];
                }
            });
            $(document).attr("title", movieId + "电影详情");
        })();


    </script>
    <%@ include file="footer.jsp" %>
</body>
</html>
