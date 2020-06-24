<%--
  Created by IntelliJ IDEA.
  User: 13716
  Date: 2020/6/22
  Time: 19:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理界面 - ${username}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <style>
        header {
            width: 100%;
            min-height: 3rem;
            text-align: center;
            font-size: 1.5rem;
        }
        .header-logo {
            padding: 1rem;
            margin-left: 3rem;
            width: 12rem;
            background: #080808;
            color: white;
            min-height: 3rem;
            text-align: center;
        }

        aside {
            width: 20%;
            padding: 2rem;
            margin-left: 3rem;
            margin-right: 3rem;;
        }
        .base-filled {
            width: 100%;
            height: 800px;
            position: relative;
            background: #3c763d;
        }
        .base-filled h2 {
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translateX(-50%) translateY(-50%);
        }
        #error {
            display: none;
        }
        #edit_error {
            display: none;
        }
    </style>
</head>
<body>
    <header>
        <div class="header-logo">
            <span class="logo">用户管理界面</span>
        </div>
        <div class="header-main">

        </div>
    </header>

    <div class="main container-fluid">
        <aside class="col-lg-3">
            <div class="list-group">
                <a class="list-group-item" onclick="userManager()">用户管理</a>
            </div>
        </aside>
        <main class="col-lg-8" id="main-container">
            <div class="base-filled">
                <h2>欢迎使用用户管理系统！</h2>
            </div>
        </main>
    </div>
    <script>
        (function () {

        })();
        function getUsers(start, limit) {
            if (start < 0 || limit <= 0) {
                console.log("参数不合法！");
                return ;
            }
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/users",
                data: {
                    start: start,
                    limit: limit
                },
                success: (res) => {
                    $("#main-container").html(res);
                }

            })
        }
        function userManager() {
            let main = $("#main-container");
            main.empty();
            getUsers(0, 20);
        }
    </script>
</body>
</html>
