<%--
  @fileName: myOrder
  @author  : 13716
  @Date    : 2020 - 07 - 09 11: 06
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>我的订单</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body>

    <div class="container-fluid">
        <table class="table table-hover">
            <thead>
            <tr>
                <td>ID</td>
                <td>电影名</td>
                <td>用户名</td>
                <td>操作</td>
            </tr>
            </thead>
            <tbody>

            <c:forEach items="${orders}" var="order" varStatus="orderStatus">
                <tr id="${orderStatus.index}">
                    <th>${order.id}</th>
                    <td>${order.movieName}</td>
                    <td>${order.username}</td>
                    <td>
                        <button class="btn btn-warning" onclick="deleteButton(${orderStatus.index})">退票</button>
                    </td>
                </tr>
            </c:forEach>
            
            </tbody>
        </table>

    </div>
    <script>
        function deleteButton(index) {
            let id = $("#" + index).children()[0].innerText;
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/order/delete",
                data: {
                    id: id
                },
                success: (res) => {
                    alert("删除成功！");
                    window.location.reload();
                }
            })
        }
    </script>
</body>
</html>
