<%--
  @fileName: roomManager
  @author  : 13716
  @Date    : 2020 - 07 - 07 17: 19
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8"%>

<div class="container-fluid">
    <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#add">添加影院</button>
</div>

<div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="myLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myLabel">添加新的影院</h4>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/rooms" method="POST">
                    <div class="form-group">
                        <label for="roomName">影院名</label>
                        <input type="text" id="roomName" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="charts">座位数</label>
                        <input type="number" id="charts" class="form-control">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="saveRoom()">保存</button>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid">
    <table class="table table-hover">
        <thead>
            <tr>
                <td>ID</td>
                <td>影院名</td>
                <td>状态</td>
                <td>座位数</td>
                <td>操作</td>
            </tr>
        </thead>
        <tbody>

        <jsp:useBean id="rooms" scope="request" type="java.util.List"/>
        <c:forEach items="${rooms}" var="room" varStatus="roomStatus">
            <tr id="${roomStatus.index}">
                <th>${room.id}</th>
                <td>${room.roomName}</td>
                <td>${room.status}</td>
                <td>${room.charts}</td>
                <td>
                    <button class="btn btn-warning" onclick="deleteButton(${roomStatus.index})">删除</button>
                </td>
            </tr>
        </c:forEach>

        </tbody>
    </table>

</div>
<script>
    function saveRoom() {
        let roomName = $("#roomName").val();
        let charts = $("#charts").val();
        if (roomName === "" || charts === "") {
            return ;
        }
        $.ajax({
            method: "POST",
            url: "${pageContext.request.contextPath}/rooms",
            data: {
                roomName: roomName,
                charts: charts
            },
            success: (res) => {
                window.location.reload();
            }
        })
    }
    function deleteButton(index) {
        let id = $("#" + index).children()[0].innerText;
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/rooms/delete",

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