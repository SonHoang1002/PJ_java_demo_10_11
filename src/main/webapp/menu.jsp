<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 9/14/2021
  Time: 1:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
</head>
<body>
<style>

  @media only screen and (min-width: 970px) and (max-width:1150px){
    #con-fluid{
      background-color:tomato;
      font-size: 15px;
      disPlay:flex;
    }
  }
  .href_link{
    color: white;
    text-decoration: none;
  }
  .href_link:hover{
    color:white;
  }
  #con-fluid{
    background-color:tomato;
    font-size: 23px;
  }


</style>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid" id="con-fluid" >
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarScroll">
      <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
        <li class="nav-item"  style="line-height: 80px;">
          <a class="nav-link active"  href="/" style="color:black">Trang chủ</a>
        </li>
        <li class="nav-item" style="line-height: 80px;">
          <a class="nav-link" href="#" style="color:black">Về chúng tôi</a>
        </li>
        <li class="nav-item dropdown" style="line-height: 80px;">
          <a style="color:black" class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="true">
            Danh mục
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
            <c:forEach items="${listC}" var="o">
              <li><a class="dropdown-item" href="category?cid=${o.cID}">${o.cname}</a></li>
            </c:forEach>
          </ul>
        </li>
        <c:if test="${sessionScope.acc != null}">
          <li class="nav-item dropdown" style="line-height: 80px;">
            <a class="nav-link dropdown-toggle" href="#" style="font-family: Arial Rounded MT Bold; font-size: 20px" role="button" data-bs-toggle="dropdown" aria-expanded="true">
              <span style="font-size:23px;color:black;">Xin chào ${sessionScope.acc.username}</span>
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
              <li><a class="dropdown-item" href="/loadProfile">Thiết lập tài khoản</a></li>
              <c:if test="${sessionScope.acc.isAdmin == 1}">
                <li><a class="dropdown-item" href="#">Quản lý người dùng</a></li>
              </c:if>
              <c:if test="${sessionScope.acc.isSell == 1}">
                <li><a class="dropdown-item" href="managerP">Quản lý sản phẩm</a></li>
              </c:if>
            </ul>
          </li>
        </c:if>
      </ul>
      <form class="d-flex" method="get" action="/search" >
          <input name="txt" class="form-control me-2" type="search" placeholder="Tìm Kiếm" aria-label="Search">
        <button class="btn btn-success" >Tìm Kiếm</button>
        <div class="btn-group ms-3" style="color:yellow">

          <button id="cart" type="button" class="btn btn-warning dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" >
            <svg style="margin-bottom: 4px;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
              <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
            </svg><a class="href_link" href="cart.jsp" style="">Giỏ Hàng</a>
          </button>
        <c:if test="${sessionScope.acc == null}">
<%--          <button id="login" type="button" style="background-color: lightcoral" ><span ><a href="login.jsp">Login</a></span></button>--%>
          <button id="login" type="button" class="guest btn btn-primary ms-3" data-bs-toggle="modal" data-bs-target="#modal-login"><span ><a class="href_link" href="login.jsp">Đăng Nhập</a></span></button>
        </c:if>
        <c:if test="${sessionScope.acc != null}">
          <button id="logout" type="button" class="guest btn btn-primary ms-3" data-bs-toggle="modal" data-bs-target="#modal-login"><span ><a class="href_link" href="/logout">Đăng Xuất</a></span></button>
<%--          <button id="logout" type="button" style="background-color: lightcoral" ><span ><a href="/logout">Logout</a></span></button>--%>
        </c:if>
      </form>
    </div>
  </div>
</nav>
<style>
  #navbarScroll{
    display: flex;
    justify-content: space-between;
  }

  .modal-footer>:not(:first-child) {
    margin-left: .25rem;
  }

  .btn {
    cursor: pointer;
    outline: none;
    font-weight: 400;
    line-height: 1.25;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    border: 1px solid transparent;
    padding: .5rem 1rem;
    font-size: 1rem;
    border-radius: .25rem;
    transition: all .2s ease-in-out;
  }

  .btn-primary {
    color: #fff;
    background-color: #0275d8;
    border-color: #0275d8;
  }
  #cart {
    font-size: 15px;
    color: #fff;
    background: #c7b200;
    border: 1px solid transparent;
    outline: none;
    margin-left: 1rem;
    padding: 12px;
    cursor: pointer;
  }
  #cart:hover {
    border-color: #fff;
  }
  .cart-row:last-child .cart-column {
    border: none;
  }
  .hotline-bar > a {
    color: #fff;
    text-decoration: none;
    font-size: 15px;
    font-weight: bold;
    text-indent: 50px;
    display: block;
    letter-spacing: 1px;
    line-height: 40px;
    font-family: Arial;
  }
  @media only screen and (min-width:590px)  and (max-width: 990px) {
    .button{
      display:flex;
      flex-direction:column;
      align-items: center;
      text-align: center;
      margin: auto;
    }
    .button #btn-add-cart{
      margin-left: 13px;
      margin-bottom: 10px;
    }

  }
  .nav-item:hover{
    background-color:lightyellow;

  }
  @media (min-width:980px) and (max-width:1024px) {
    .nav-link{
      height: 100%;
    }
  }

  .float-contact .hotline {
    background: #d11a59!important;
    border-radius: 20px;
    padding: 0 18px;
    color: white;
    display: block;
    margin-bottom: 6px;
  }
  .chat-zalo a, .chat-face a, .hotline a {
    font-size: 15px;
    color: white;
    font-weight: 400;
    text-transform: none;
    line-height: 0;
  }
  @media (max-width: 549px){
    .float-contact{
      display:none
    }
  }

  footer{
    position: relative;
    width: 100%;
    height: auto;
    padding: 50px 100px;
    background: #111;
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
  }
  footer .container{
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
    flex-direction: row;
  }

  footer .container .noi-dung{
    margin-right: 30px;
  }
  footer  .container .noi-dung.about{
    width:40%;
  }
  footer .container .noi-dung.about h2{
    position: relative;
    color: #fff;
    font-weight: 500;
    margin-bottom: 15px;
  }
  footer .container .noi-dung.about h2:before{
    content: '';
    position: absolute;
    bottom: -5px;
    left: 0;
    width: 50px;
    height: 2px;
    background: #f00;
  }
  footer .container .noi-dung.about p{
    color: #999;
  }
  /*Thiết Lập Cho Thành Phần Icon Mạng Xã Hội*/

  .social-icon li {
    list-style: none;
  }
  .social-icon li a{
    display: inline-block;
    width: 40px;
    height: 40px;
    background: #222;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-right: 10px;
    text-decoration: none;
    border-radius: 4px;
  }
  .social-icon li a:hover{
    background: #f00;
  }
  .social-icon li a .fa{
    color: #fff;
    font-size: 20px;
  }
  .links h2{
    position: relative;
    color: #fff;
    font-weight: 500;
    margin-bottom: 15px;
  }

  .links h2::before{
    content: '';
    position: absolute;
    bottom: -5px;
    left: 0;
    width: 50px;
    height: 2px;
    background: #f00;
  }

  .links ul li{
    list-style: none;
  }
  .links ul li a{
    color: #999;
    text-decoration: none;
    margin-bottom: 10px;
    display: inline-block;
  }
  .links ul li a:hover{
    color: #fff;
  }
  .contact h2{
    position: relative;
    color: #fff;
    font-weight: 500;
    margin-bottom: 15px;
  }
  .contact h2::before{
    content: '';
    position: absolute;
    bottom: -5px;
    left: 0;
    width: 50px;
    height: 2px;
    background: #f00;
  }

  .contact .info{
    position: relative;
  }
  .contact .info li{
    display: flex;
    margin-bottom: 16px;
  }
  .contact .info li span:nth-child(1) {
    color: #fff;
    font-size: 20px;
    margin-right: 10px;
  }
  .contact .info li span{
    color: #999;
  }
  .contact .info li a{
    color: #999;
    text-decoration: none;
  }
  @media  (max-width: 768px){
    footer{
      padding: 40px;
    }
    footer .container{
      flex-direction: column;
    }
    footer .container .noi-dung{
      margin-right: 0;
      margin-bottom: 40px;
    }
    footer .container, .noi-dung.about, .links, .contact{
      width: 100%;
    }
  }

</style>

</body>
</html>