<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<div class="container-fluid">
    <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#add">添加用户</button>
</div>

<div class="modal fade" id="add" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">添加用户</h4>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/users" method="post">
                    <label for="username">用户名</label>
                    <input type="text" class="form-control" id="username">
                    <label for="password">密码</label>
                    <input type="password" class="form-control" id="password">
                    <label for="password_check">确认密码</label>
                    <input type="password" class="form-control" id="password_check">
                </form>
                <div class="alert alert-warning" role="alert" id="error">

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="close">关闭</button>
                <button type="button" class="btn btn-primary" onclick="addUser()">保存</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="myModalLabelEdit">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabelEdit">添加用户</h4>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/users">
                    <label for="edit_id">ID</label>
                    <input type="text" disabled id="edit_id" class="form-control">
                    <label for="edit_username">用户名</label>
                    <input type="text" class="form-control" id="edit_username">
                    <label for="edit_password">密码</label>
                    <input type="password" class="form-control" id="edit_password">
                    <label for="edit_sex">性别</label>
                    <input type="text" class="form-control" id="edit_sex">
                    <label for="superuser">管理员</label>
                    <input type="checkbox" id="superuser">
                </form>
                <div class="alert alert-warning" role="alert" id="edit_error">

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" id="edit_close">关闭</button>
                <button type="button" class="btn btn-primary" onclick="editUser()">保存</button>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid">
    <table class="table table-hover">
        <thead>
        <tr>
            <td>ID</td>
            <td>用户名</td>
            <td>密码</td>
            <td>性别</td>
            <td>管理员</td>
            <td>操作</td>
        </tr>
        </thead>
        <tbody>

            <jsp:useBean id="users" scope="request" type="java.util.List"/>
            <c:forEach items="${users}" var="user" varStatus="userStatus">
                <tr id="${userStatus.index}">
                    <th>${user.id}</th>
                    <td>${user.username}</td>
                    <td>${user.password}</td>
                    <td>${user.sex}</td>
                    <td>${user.superuser}</td>
                    <td>
                        <button class="btn btn-primary" onclick="editButton(${userStatus.index})">修改</button>
                        <button class="btn btn-warning" onclick="deleteButton(${userStatus.index})">删除</button>
                    </td>
                </tr>
            </c:forEach>

        </tbody>
    </table>

</div>
<script>
    function found_error(message) {
        let error = $("#error");
        error.css("display", "block");
        error.alert();
        error.text(message);
    }
    function found_edit_error(message) {
        let error = $("#edit_error");
        error.css("display", "block");
        error.alert();
        error.text(message);
    }
    function editButton(index) {
        let tr = $("#" + index).children();
        let id = tr[0].innerText;
        let username = tr[1].innerText;
        let password = tr[2].innerText;
        let sex = tr[3].innerText;
        let superuser = tr[4].innerText;
        $("#edit_id").val(id);
        $("#edit_username").val(username);
        $("#edit_password").val(password);
        $("#edit_sex").val(sex);
        $("#edit").modal("toggle");
    }
    function editUser() {
        let id = $("#edit_id").val();
        let username = $("#edit_username").val();
        let password = $("#edit_password").val();
        let sex = $("#edit_sex").val();
        let superuser = $("#superuser").checked;
        if (username === "" || password === "" || sex === "") {
            found_edit_error("信息不能为空！");
        }
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/users/edit",
            data: {
                id: id,
                username: username,
                password: password,
                sex: sex,
                superuser: superuser
            },
            success: (res) => {
                found_edit_error(res);
                $("#edit_close").click();
                window.location.reload();
            }
        })
    }
    function deleteButton(index) {
        let id = $("#" + index).children()[0].innerText;
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/users/delete",
            data: {
                id: id
            },
            success: (res) => {
                alert("删除成功！");
                window.location.reload();
            }
        })
    }
    function addUser() {
        let username = $("#username").val();
        let password = $("#password").val();
        let password_check = $("#password_check").val();

        if (username === "" || password === "" || password_check === "") {
            found_error("信息必须填写完整！");
            return ;
        }

        if (password !== password_check) {
            found_error("两次密码必须一致！");
            return ;
        }

        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/users",
            data: {
                username: username,
                password: password
            },
            success: (res) => {
                found_error(res);
                $("#close").click();
                window.location.reload();
            }
        })

    }
</script>