<%--
  Created by IntelliJ IDEA.
  User: 13716
  Date: 2020/6/21
  Time: 9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登陆</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <style>
        body {
            width: 100%;
            height: 100%;
            background-image: linear-gradient(to bottom, blue, white);
        }
        form {
            width: 400px;
            background: white;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translateX(-50%) translateY(-50%);
            padding: 3rem;
            border-radius: 25px;
        }
        .my-btn-group {

        }
        #error {
            display: none;
        }
    </style>
</head>
<body>
    <form action="${pageContext.request.contextPath}/login" method="post" class="form-group">
        <label for="username">用户名</label>
        <input type="text" id="username" name="username" class="form-control">
        <label for="password">密码</label>
        <input type="password" id="password" name="password" class="form-control">
        <div class="checkbox">
            <label>
                <input type="checkbox" id="remember"> 记住我
            </label>
        </div>
        <div class="alert alert-warning" role="alert" id="error">

        </div>
        <div class="btn-group my-btn-group">
            <button class="btn btn-default" type="reset">重置</button>
            <button class="btn btn-primary" type="button" onclick="login()">提交</button>
        </div>
    </form>

<script>
    (function () {
        // 默认错误提示框为隐藏
    })();

    function found_error(message) {
        let error = $("#error");
        error.css("display", "block");
        error.alert();
        error.text(message);
    }
    function login(e) {
        let error = $("#error");
        error.css("display", "none");
        let btn = $(".btn");
        btn.attr("disabled", true);

        let username = $("#username").val();
        let password = $("#password").val();
        let remember = $("#remember")[0].checked;

        if (username === "" || password === "") {
            found_error("用户名和密码不能为空！");
            return ;
        }
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/login",
            data: {
                username: username,
                password: password
            },
            success: (res) => {
                if (res === "") {
                    found_error(res);
                    return ;
                } else {
                    localStorage.setItem("username", res["username"]);
                    localStorage.setItem("userId", res["id"]);
                    window.location.href = "${pageContext.request.contextPath}/";
                }
            },
            fail: (res) => {
                found_error(res);
            },
            error: (err) => {
                if (err.status === 500) {
                    found_error("服务器出现问题，请联系管理员处理！");
                } else {
                    found_error("未知错误！");
                }
            },
            complete: () => {
                btn.attr("disabled", false);
            }
        })

    }
</script>
</body>
</html>
