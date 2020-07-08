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
        img {
            min-height: 300px;
            max-height: 300px;
        }

    </style>
</head>
<body>
    <%@ include file="jsp/header.jsp" %>

    <div class="container">
        <h2>最热电影</h2>
        <div class="row" id="hotContainer">

        </div>
    </div>
    <div class="container">
        <h2>最新电影</h2>
        <div class="row" id="newContainer">
        </div>
    </div>

    <%@ include file="jsp/footer.jsp" %>

    <script>
        $.ajax({
            method: "GET",
            url: "${pageContext.request.contextPath}/movie/orderByScore",
            success: (res) => {
                res.forEach(element => {

                    let currentPath = "${pageContext.request.contextPath}/media/" + element['logoPath'];
                    $("#hotContainer").append(
                        "<div class='col-lg-3'><div class='thumbnail' onclick='toMovie(this)' id=" + element["id"] + ">" +
                        "<img src=" + currentPath +" alt=" + element["name"] +">" +
                        "<div class='caption'><h4>" + element["name"] + "</h4></div></div></div>")
                })
            }
        });
        $.ajax({
            method: "GET",
            url: "${pageContext.request.contextPath}/movie/orderByUpload",
            success: (res) => {
                res.forEach(element => {
                    let currentPath = "${pageContext.request.contextPath}/media/" + element['logoPath'];
                    $("#newContainer").append(
                        "<div class='col-lg-3'><div class='thumbnail' onclick='toMovie(" +  element["id"] + ")'>" +
                        "<img src=" + currentPath +" alt=" + element["name"] +">" +
                        "<div class='caption'><h4>" + element["name"] + "</h4></div></div></div>")
                })
            }
        });
        function toMovie(e) {
            let movieId = $(e).attr("id")
            window.location.href = "${pageContext.request.contextPath}/movie?movieId=" + movieId;
        }
    </script>
</body>
</html>
