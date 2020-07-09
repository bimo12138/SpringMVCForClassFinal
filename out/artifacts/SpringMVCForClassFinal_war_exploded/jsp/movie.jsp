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
            height: 100px;
        }
        .buy {
            position: absolute;
            right: 3rem;
            top: 50%;
            transform: translateY(-50%);
            padding: 1rem;
            font-size: 5rem;
        }
    </style>
</head>
<body>

    <div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="myLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myLabel">确认订单</h4>
                </div>
                <div class="modal-body">
                    <form action="${pageContext.request.contextPath}/order" method="POST">
                        <h4>用户ID: <strong id="userName"></strong></h4>
                        <h4>电影ID: <strong id="movieName"></strong></h4>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="buy('${movie.id}')">确定</button>
                </div>
            </div>
        </div>
    </div>
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
        <div class="buy">
            <button class="btn btn-warning" data-toggle="modal" data-target="#add">购买</button>
        </div>
    </div>
    <script>
        (function () {
            let userName = localStorage.getItem("username");
            $("#userName").html(userName);
            $("#movieName").html("${movie.name}");
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
        function buy(movieId) {

            let userId = localStorage.getItem("userId");
            if (userId === null) {
                window.location.href = "${pageContext.request.contextPath}/login";
                return ;
            }
            if (movieId === "") {
                alert("出现位置错误，请重试！");
                return ;
            }
            $.ajax({
                method: "POST",
                url: "${pageContext.request.contextPath}/order",
                data: {
                    movieId: movieId,
                    userId: userId
                },
                success: (res) => {
                    alert(res);
                    window.location.reload();
                },
                fail: (res) => {
                    alert("请先登录！");
                    window.location.href = "${pageContext.request.contextPath}/login";
                }
            })
        }
    </script>
    <%@ include file="footer.jsp" %>
</body>
</html>
