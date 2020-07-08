<%--
  Created by IntelliJ IDEA.
  User: 13716
  Date: 2020/7/5
  Time: 14:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Footer</title>
    <style>
        footer {
            background: #080808;
            color: white;
            padding: 4rem;
        }
        footer a {
            color: white;
        }
        h2 {
            text-align: center;
        }
    </style>
</head>
<body>
    <footer class="container-fluid">
        <div class="row">
            <div class="col-lg-1 col-lg-offset-1">
                <a href="mailto:1371639183@qq.com">联系我们</a>
            </div>
            <div class="col-lg-4">
                <a href="${pageContext.request.contextPath}/admin">管理端登陆</a>
            </div>
        </div>
        <div class="row">
            <h2>&copy; 版权所有, mo!</h2>
        </div>
    </footer>

</body>
</html>
