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
          <button id="cart" type="button" class="btn btn-warning dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
            <svg style="margin-bottom: 4px;" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
              <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
            </svg>  Giỏ hàng
          </button>
          <div id="myModal" class="modal">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">Giỏ Hàng</h5>
                <span  class="close">&times;</span>
              </div>
              <div class="modal-body">
                <div class="cart-row">
                  <span class="cart-item cart-header cart-column">Sản Phẩm</span>
                  <span class="cart-price cart-header cart-column">Giá</span>
                  <span class="cart-quantity cart-header cart-column">Số Lượng</span>
                </div>
                <div class="cart-items">
                  <div class="cart-row">
                    <div class="cart-item cart-column">
                      <img class="cart-item-image" src="https://cdn3.ivivu.com/2017/08/bay-mon-an-noi-tieng-co-ten-doc-la-o-viet-nam-ivivu-3.jpg" width="100" height="100">
                      <span class="cart-item-title">Do An</span>
                    </div>
                    <span class="cart-price cart-column">25000đ</span>
                    <div class="cart-quantity cart-column">
                      <input class="cart-quantity-input" type="number" value="1">
                      <button class="btn btn-danger" type="button">Xóa</button>
                    </div>
                  </div>
                  <div class="cart-row">
                    <div class="cart-item cart-column">
                      <img class="cart-item-image" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsRie3z8Wfb-xxB29eL5docgKYfTZ5iVQ6tQ&usqp=CAU" width="120" height="100">
                      <span class="cart-item-title">Do An</span>
                    </div>
                    <span class="cart-price cart-column">1599000đ</span>
                    <div class="cart-quantity cart-column">
                      <input class="cart-quantity-input" type="number" value="2">
                      <button class="btn btn-danger" type="button">Xóa</button>
                    </div>
                  </div>
                </div>
                <div class="cart-total">
                  <strong class="cart-total-title">Tổng Cộng:</strong>
                  <span class="cart-total-price">0VNĐ</span>
                </div>
              </div>

              <div class="modal-footer">
                <button  type="button" class="btn btn-secondary close-footer">Đóng</button>
                <button  type="button" class="btn btn-primary order">Thanh Toán</button>
              </div>
            </div>
          </div>
        </div>
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
</body>
</html>