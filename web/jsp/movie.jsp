<%--
  Created by IntelliJ IDEA.
  User: 13716
  Date: 2020/7/5
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>电影详情</title>
</head>
<body>
    <ol class="breadcrumb">
        <li><a href="${pageContext.request.contextPath}/">首页</a></li>
        <li class="active" id="currentMovie">#</li>
    </ol>

    <div class="container">
        <div class="row">
            <div class="col-lg-3">

            </div>
            <div class="col-lg-8 col-lg-offset-1">

            </div>
        </div>
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
</body>
</html>
