<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 10/12/2021
  Time: 5:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Title</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
</head>
<body>
<style>
  .inf-content{
    border:1px solid #DDDDDD;
    -webkit-border-radius:10px;
    -moz-border-radius:10px;
    border-radius:10px;
    box-shadow: 7px 7px 7px rgba(0, 0, 0, 0.3);
  }
</style>
<div class="container bootstrap snippets bootdey">
  <div class="panel-body inf-content">
    <div class="row">
      <div class="col-md-4">
        <img alt="" style="width:600px;" title="" class="img-circle img-thumbnail isTooltip" src="${profile.avatar}" data-original-title="Usuario">
        <ul title="Ratings" class="list-inline ratings text-center">
          <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
          <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
          <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
          <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
          <li><a href="#"><span class="glyphicon glyphicon-star"></span></a></li>
        </ul>
      </div>
      <div class="col-md-6">
        <strong><b style="font-size: 20px">THÔNG TIN CÁ NHÂN</b></strong><br>
        <div class="table-responsive">
          <table class="table table-user-information">
            <tbody>
            <tr>
              <td>
                <strong>
                  <span class="glyphicon glyphicon-asterisk text-primary"></span>
                  ID
                </strong>
              </td>
              <td class="text-primary">
                ${profile.uID}
              </td>
            </tr>
            <tr>
              <td>
                <strong>
                  <span class="glyphicon glyphicon-user  text-primary"></span>
                  Username
                </strong>
              </td>
              <td class="text-primary">
                ${profile.username}
              </td>
            </tr>
            <tr>
              <td>
                <strong>
                  <span class="glyphicon glyphicon-eye-open text-primary"></span>
                  Số điện thoại
                </strong>
              </td>
              <td class="text-primary">
                ${profile.soDT}
              </td>
            </tr>
            <tr>
              <td>
                <strong>
                  <span class="glyphicon glyphicon-envelope text-primary"></span>
                  Email
                </strong>
              </td>
              <td class="text-primary">
                ${profile.email}
              </td>
            </tr>
            <tr>
              <td>
                <strong>
                  <span class="glyphicon glyphicon-calendar text-primary"></span>
                  Vị trí
                </strong>
              </td>
              <td class="text-primary">
                <c:if test="${profile.isSell == 1}">
                  Người bán hàng
                </c:if>
                <br>
                <c:if test="${profile.isAdmin == 1}">
                  Quản trị viên
                </c:if>
              </td>
            </tr>
            </tbody>
          </table>
          <a href="profile?uID=${profile.uID}" class="edit" data-toggle="modal">Chỉnh sửa trang cá nhân</a>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
