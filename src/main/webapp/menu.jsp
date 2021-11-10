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
  .card-img-top{
    height: 350px;
    weight: 800px
  }
  @media only screen and (min-width: 400px) and (max-width:990px){
    .all-button{
      display: flex;
      flex-direction: column;
      align-items: center;
      text-align: center;
      margin: auto;
    }
    .button-1{
      margin-left: 13px;
      margin-bottom: 10px;
    }

  }


</style>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid" style="background-color: gray;">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarScroll">
      <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll" style="--bs-scroll-height: 100px;">
        <li class="nav-item" style="line-height: 80px;">
          <a class="nav-link active"  href="/">Trang chủ</a>
        </li>
        <li class="nav-item" style="line-height: 80px;">
          <a class="nav-link" href="#">Về chúng tôi</a>
        </li>
        <li class="nav-item dropdown" style="line-height: 80px;">
          <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="true">
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
              Xin chào ${sessionScope.acc.username}
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
              <li><a class="dropdown-item" href="/loadProfile">Thiết lập tài khoản</a></li>
              <li><hr class="dropdown-divider"></li>
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
      <form class="d-flex" method="get" action="/search">
        <input name="txt" class="form-control me-2" type="search" placeholder="Tìm kiếm" aria-label="Search">
        <button class="btn btn-success" >Tìm</button>
        <div class="btn-group ms-3">
          <a href="cart.jsp">Giỏ hàng</a>
        <c:if test="${sessionScope.acc == null}">
          <button id="login" type="button" style="background-color: lightcoral" ><span ><a href="login.jsp">Login</a></span></button>
        </c:if>
        <c:if test="${sessionScope.acc != null}">
          <button id="logout" type="button" style="background-color: lightcoral" ><span ><a href="/logout">Logout</a></span></button>
        </c:if>
      </form>
    </div>
  </div>
</nav>
<style>
  /* modal */
  .modal {
    display: none;
    position: fixed;
    z-index: 1;
    padding-top: 100px;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgb(0, 0, 0);
    background-color: rgba(0, 0, 0, 0.4);
  }

  .modal-content {
    margin: 0 auto;
    width: 50%;
    position: relative;
    display: flex;
    flex-direction: column;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid rgba(0, 0, 0, .2);
    border-radius: .3rem;
    outline: 0;

  }

  .modal-body {
    padding: 1rem;
  }

  .modal-footer {
    display: flex;
    border-top: 1px solid #aaaaaa;
    padding: 1rem;
    flex-direction: row;
    justify-content: flex-end;
    border-top: 1px solid #aaaaaa;
    padding: 1rem;
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

  .btn-secondary {
    color: #292b2c;
    background-color: #fff;
    border-color: #ccc;
  }

  .btn-primary {
    color: #fff;
    background-color: #0275d8;
    border-color: #0275d8;
  }

  .modal-header {
    align-items: center;
    display: flex;
    justify-content: space-between;
    border-bottom: 1px solid #aaaaaa;
    padding: 1rem;
  }

  h5.modal-title {
    font-size: 1.5rem;
  }

  .close {
    color: #aaaaaa;
    font-size: 28px;
    font-weight: bold;
    display: flex;
    flex-direction: row;
    justify-content: flex-end;
  }

  .close:hover,
  .close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
  }

  #cart {
    font-size: 15px;
    color: #fff;
    background: #c7b200;
    border: 1px solid transparent;
    border-radius: 10px;
    outline: none;
    margin-left: 1rem;
    padding: 12px;
    cursor: pointer;
  }

  #cart:hover {
    border-color: #fff;
  }
  /* cart */
  .cart-header {
    font-weight: bold;
    font-size: 1.25em;
    color: #333;
  }

  .cart-column {
    display: flex;
    align-items: center;
    border-bottom: 1px solid black;
    margin-right: 1.5em;
    padding-bottom: 10px;
    margin-top: 10px;
  }

  .cart-row {
    display: flex;
  }

  .cart-item {
    width: 45%;
  }

  .cart-price {
    width: 20%;
    font-size: 1.2em;
    color: #333;
  }

  .cart-quantity {
    width: 35%;
  }

  .cart-item-title {
    color: #333;
    margin-left: .5em;
    font-size: 1.2em;
  }

  .cart-item-image {
    width: 75px;
    height: auto;
    border-radius: 10px;
  }

  .btn-danger {
    color: white;
    background-color: #EB5757;
    border: none;
    border-radius: .3em;
    font-weight: bold;
  }

  .btn-danger:hover {
    background-color: #CC4C4C;
  }

  .cart-quantity-input {
    height: 34px;
    width: 50px;
    border-radius: 5px;
    border: 1px solid #56CCF2;
    background-color: #eee;
    color: #333;
    padding: 0;
    text-align: center;
    font-size: 1.2em;
    margin-right: 25px;
  }

  .cart-row:last-child {
    border-bottom: 1px solid black;
  }

  .cart-row:last-child .cart-column {
    border: none;
  }

  .cart-total {
    text-align: end;
    margin-top: 10px;
    margin-right: 10px;
  }

  .cart-total-title {
    font-weight: bold;
    font-size: 1.5em;
    color: black;
    margin-right: 20px;
  }

  .cart-total-price {
    color: #333;
    font-size: 1.1em;
  }

  .hotline-phone-ring-wrap {
    position: fixed;
    bottom: 0;
    left: 0;
    z-index: 999999;
  }

  .hotline-bar {
    position: absolute;
    background: rgba(230, 8, 8, 0.75);
    height: 40px;
    width: 180px;
    line-height: 40px;
    border-radius: 3px;
    padding: 0 10px;
    background-size: 100%;
    cursor: pointer;
    z-index: 9;
    box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.1);
    left: 33px;
    bottom: 37px;
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
    background-color:cornflowerblue;
  }
  @media (min-width:980px) and (max-width:1024px) {
    .nav-link{
      height: 100%;
    }
  }
  .float-contact {
    position: fixed;
    bottom: 20px;
    left: 20px;
    z-index: 99999;
  }
  .chat-zalo {
    background: #8eb22b;
    border-radius: 20px;
    padding: 0 18px;
    color: white;
    display: block;
    margin-bottom: 6px;
  }
  .chat-face {
    background: #125c9e;
    border-radius: 20px;
    padding: 0 18px;
    color: white;
    display: block;
    margin-bottom: 6px;
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
  .social-icon{
    margin-top: 20px;
    display: flex;
  }
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
  .links{
    position: relative;
    width: 25%;
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
  .contact{
    width: calc(35% - 60px);
    margin-right: 0 !important;
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