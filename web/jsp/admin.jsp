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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>管理界面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <style>
        header {
            width: 100%;
            min-height: 3rem;
            font-size: 1.5rem;
        }
        .header-logo {
            padding: 1rem;
            background: #080808;
            color: white;
            min-height: 3rem;
            text-align: center;
            box-sizing: border-box;
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
        #user {
            padding: 1rem 2rem 1rem 2rem;
        }
    </style>
</head>
<body>
    <header class="container-fluid row">
        <div class="header-logo col-lg-1 col-lg-offset-1">
            <div class="logo">用户管理界面</div>
        </div>
        <div class="header-main col-lg-offset-1 col-lg-9">
            <div class="dropdown pull-right">
                <button id="user" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" class="btn btn-primary username">
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu" aria-labelledby="user">
                    <li><a href="#" data-toggle="modal" data-target="#confirm-modal" onclick="confirmLogout()">注销</a></li>
                </ul>
            </div>
        </div>
    </header>

    <div class="main container-fluid">
        <aside class="col-lg-3">
            <div class="list-group">
                <a class="list-group-item" onclick="userManager()">用户管理</a>
                <a class="list-group-item" onclick="movieManager()">影片管理</a>
                <a class="list-group-item" onclick="roomManager()">影院管理</a>
            </div>
        </aside>
        <main class="col-lg-8" id="main-container">
            <div class="base-filled">
                <h2><strong class="username"></strong>欢迎使用用户管理系统！</h2>
            </div>
        </main>
    </div>

    <div class="modal fade" tabindex="-1" role="dialog" id="confirm-modal">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">Confirm</h4>
                </div>
                <div class="modal-body">
                    <p>确定要继续 <strong id="action"></strong> 操作吗？</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="logout()">确定</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        (function () {
            let username = localStorage.getItem("username");
            if (username) {
                $(".username").html(username);
            } else {
                logout();
            }
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
        function logout() {
            window.location.href = "${pageContext.request.contextPath}/login";
        }
        function confirmLogout() {
            $("#action").html("退出");
        }
        function movieManager() {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/movieManager",
                success: (res) => {
                    $("#main-container").html(res);
                }
            })
        }
        function roomManager() {
            $.ajax({
                type: "GET",
                url: "${pageContext.request.contextPath}/rooms",
                success: (res) => {
                    $("#main-container").html(res);
                }
            })
        }
    </script>
</body>
</html>
