<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
</head>
<body>
<style>
  /*nav-item:hover{
    background-color:#b60f1e;
  }*/
  .cart-item{
    color: white;
  }
  .cart-item:hover{
    color: white;
  }
  .mySlides {display:none;}
  .btn-outline-success:hover {
    color: #fff;
    background-color: #ccc;
    border-color: /*#198754*/ black;
  }
  .flex-container {
    display: flex;
    flex-flow: row wrap;
    text-align: center;
    box-sizing: border-box;
    justify-content: space-around;
  }

</style>
<nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color:#dc3545 !important">
  <div class="container-fluid">
    <a class="navbar-brand text-white" href="#"><i class="fas fa-store" style="margin: 5px;"></i>VNFood</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active text-white" aria-current="page" href="/">Trang Chủ</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="#">Về Chúng Tôi</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle text-white" href="#" id="navbarLightDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Danh Mục
          </a>
          <ul class="dropdown-menu dropdown-menu-light" aria-labelledby="navbarLightDropdown">
            <c:forEach items="${listC}" var="o">
              <li><a class="dropdown-item" href="category?cid=${o.cID}">${o.cname}</a></li>
            </c:forEach>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="/suggestion">Gợi Ý Dành Cho Bạn</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="orders.jsp">Order</a>
        </li>
        <c:if test="${sessionScope.acc != null}">
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle text-white" href="#" id="navbarLightDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              Xin chào ${sessionScope.acc.username}
            </a>
            <ul class="dropdown-menu dropdown-menu-light" aria-labelledby="navbarLightDropdownMenuLink">
              <li><a class="dropdown-item" href="/loadProfile">Thiết Lập Tài Khoản</a></li>
              <c:if test="${sessionScope.acc.isSell == 1}">
                <li><a class="dropdown-item" href="managerP">Quản Lý Sản Phẩm</a></li>
              </c:if>
            </ul>
          </li>
        </c:if>
      </ul>
      <form class="d-flex" method="get" action="/search">
        <input name="txt" class="form-control me-2" type="search" placeholder="Tìm Kiếm" aria-label="Search" style="margin: 5px;">
        <button class="btn btn-light" type="submit" style="background-color: white; margin: 5px;"><i class="fas fa-search"></i></button>
      </form>
      <div class="text-end">
        <button type="button" class="btn btn-danger" title="Giỏ hàng"><a href="cart.jsp" class="cart-item"><i class="fas fa-shopping-cart"></i></a></button>
        <!--<button type="button" class="btn btn-primary" style="margin: 5px;">
          <a href="">Login</a>
        </button>-->
        <c:if test="${sessionScope.acc == null}">
          <a class="btn btn-primary" href="login.jsp" role="button">Đăng Nhập</a>
        </c:if>
        <c:if test="${sessionScope.acc != null}">
          <a class="btn btn-warning" href="/logout" role="button">Đăng Xuất</a>
        </c:if>
      </div>
    </div>
  </div>
</nav>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>