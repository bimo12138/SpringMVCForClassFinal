
<%--
  @fileName: header
  @author  : 13716
  @Date    : 2020 - 07 - 08 13: 48
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.bimo.pojo.User" %>

<html>
<head>
    <title>Header</title>
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
                <ul class="nav navbar-nav navbar-right" id="userContainer">

                </ul>
            </div>
        </div>
    </nav>
    <script>
        (function () {
            let container = $("#userContainer");
            let username = localStorage.getItem("username");
            let userId = localStorage.getItem("userId");
            if (username !== "") {
                container.append("<li><a href='${pageContext.request.contextPath}/order?userId=" + userId + "'>我的订单</a></li>" +
                    "<li><a href='#'>" + username + "</a></li>");
            } else {
                container.append("<li><a href='login' id='login_container'>登陆</a></li>");
            }
        })()
    </script>
</body>
</html>
