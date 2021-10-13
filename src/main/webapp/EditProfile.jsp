<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 10/12/2021
  Time: 2:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Thiết lập tài khoản</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
</head>
<body>
<style>
    .form-control:focus {
        box-shadow: none;
        border-color: #BA68C8
    }

    .profile-button {
        background: #BA68C8;
        box-shadow: none;
        border: none
    }

    .profile-button:hover {
        background: #682773
    }

    .profile-button:focus {
        background: #682773;
        box-shadow: none
    }

    .profile-button:active {
        background: #682773;
        box-shadow: none
    }

    .back:hover {
        color: #682773;
        cursor: pointer
    }
</style>
<div class="container rounded bg-white mt-5">
    <div class="row">
        <div class="col-md-4 border-right">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" src="${profile.avatar}" width="90"><span>${profile.username}</span></div>
        </div>
        <div class="col-md-8">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <div class="d-flex flex-row align-items-center back"><i class="fa fa-long-arrow-left mr-1 mb-1"></i>
                        <a href="/">Back to home</a>
                    </div>
                </div>
                <form action="editProfile" method="post">
                    <div class="row mt-2">
                        Tên đăng nhập
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="username" value="${profile.username}" readonly></div>
                    </div>
                    <div class="row mt-3">
                        Mật khẩu
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="password" value="${profile.password}"></div>
                    </div>
                    <div class="row mt-3">
                        Số điện thoại
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="soDT" value="${profile.soDT}"></div>
                    </div>
                    <div class="row mt-3">
                        Email
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="email" value="${profile.email}"></div>
                    </div>
                    <div class="row mt-3">
                        Ảnh đại diện
                        <div class="col-md-6"><input type="text" class="form-control" placeholder="avatar" value="${profile.avatar}"></div>
                    </div>
                    <div class="row mt-3">
                        Đăng ký bán hàng
                        <select name="" class="form-select" aria-label="Default select example">
                            <option value="${profile.isSell}==0">Không</option>
                            <option value="${profile.isSell}==1">Đăng ký</option>
                        </select>
                    </div>
                    <div class="row mt-3">
                        Đăng ký quản trị viên
                        <select name="" class="form-select" aria-label="Default select example">
                            <option value="${profile.isAdmin}==0">Không</option>
                            <option value="${profile.isAdmin}==1">Đăng ký</option>
                        </select>
                    </div>
                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Hủy">
                    <input type="submit" class="btn btn-success" value="Lưu thay đổi">
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>