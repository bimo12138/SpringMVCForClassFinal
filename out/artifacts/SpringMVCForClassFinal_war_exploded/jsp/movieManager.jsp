<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8"%>

<div class="container-fluid">
    <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#add">添加电影</button>
</div>

<div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="myLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myLabel">添加新的电影</h4>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/movie" method="POST">
                    <div class="form-group">
                        <label for="movieName">电影名</label>
                        <input type="text" id="movieName" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="movieType">电影类型</label>
                        <select id="movieType" class="form-control">

                        </select>
                    </div>
                    <div class="form-group">
                        <label for="logoPath">宣传海报</label>
                        <input type="file" id="logoPath" class="form-control" name="logoPath">
                    </div>
                    <div class="form-group">
                        <label for="deploy_time">上映时间</label>
                        <input type="datetime-local" id="deploy_time" class="form-control">
                    </div>
                    <div id="rooms_checkbox">
                        <label for="rooms">上映房间</label>
                    </div>
                    <div class="form-group">
                        <label for="price">价格</label>
                        <input type="number" id="price" class="form-control">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="saveMovie()">保存</button>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid">
    <table class="table table-hover">
        <thead>
        <tr>
            <td>ID</td>
            <td>影片名</td>
            <td>影片类型</td>
            <td>LOGO</td>
            <td>上传时间</td>
            <td>价格</td>
        </tr>
        </thead>
        <tbody>

        <jsp:useBean id="movies" scope="request" type="java.util.List"/>
        <c:forEach items="${movies}" var="movie" varStatus="movieStatus">
            <tr id="${movieStatus.index}">
                <th>${movie.id}</th>
                <td>${movie.name}</td>
                <td>${movie.type}</td>
                <td>${movie.logoPath}</td>
                <td>${movie.upload_time}</td>
                <td>${movie.price}</td>
                <td>
                    <button class="btn btn-warning" onclick="deleteButton(${movieStatus.index})">删除</button>
                </td>
            </tr>
        </c:forEach>

        </tbody>
    </table>

</div>

<script>
    (function () {
        $.ajax({
            method: "GET",
            url: "${pageContext.request.contextPath}/movieType",
            success: (res) => {
                res.forEach(element => {
                    $("#movieType").append("<option value=" + element + ">" + element + "</option>");
                });
            }
        });
        $.ajax({
            method: "GET",
            url: "${pageContext.request.contextPath}/movieManager/rooms",
            success: (res) => {
                res.forEach(element => {
                    $("#rooms_checkbox").append("<div class='checkbox'><label>" +
                        "<input name='rooms' type='checkbox' value=" + element["id"] +">" + element["roomName"] +
                        "</label></div>");
                });
            }
        })
    })();
    function saveMovie() {
        let movieName = $("#movieName").val();
        let movieType = $("#movieType").val();
        let movieLogo = document.getElementById("logoPath").files[0];
        let deploy_time = $("#deploy_time").val();
        let price = $("#price").val();
        let rooms;
        document.getElementsByName("rooms").forEach(element => {
            if (element.checked) {
                rooms += element.value + "|";
            }
        });

        let formData = new FormData();

        formData.append("movieName", movieName);
        formData.append("movieType", movieType);
        formData.append("movieLogo", movieLogo);
        formData.append("deployTime", deploy_time);
        formData.append("price", price);
        formData.append("rooms", rooms);

        $.ajax({
            method: "POST",
            url: "${pageContext.request.contextPath}/movieManager",
            data: formData,
            processData : false,
            contentType : false,
            success: (res) => {
                alert(res);
                window.location.reload();
            }
        })
    }

    function deleteButton(index) {
        let id = $("#" + index).children()[0].innerText;
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/movieManager/delete",
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