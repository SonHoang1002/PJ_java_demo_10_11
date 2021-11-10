<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 9/11/2021
  Time: 9:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"crossorigin="anonymous">
  <link rel="stylesheet" href="../style.css">
  <title>VNFood</title>

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

<header>
  <jsp:include page="menu.jsp"></jsp:include>
  <section class="jumbotron text-center">
    <div class="container">
      <h1 class="jumbotron-heading">Món ăn truyền thống Việt Nam qua các vùng miền</h1>
      <p class="lead text-muted mb-0">Nét đặc trưng riêng của ẩm thực Việt Nam</p>
      <c:if test="${sessionScope.acc == null}">
        <div class="alert-danger" role="alert">
          <p>Đăng nhập để đặt món ăn!</p>
        </div>
      </c:if>
    </div>
  </section>
  <!--end of menu-->
</header>

<main>


  <div class="container pt-5">
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
      <c:forEach items="${list}" var="o">
      <div class="col">
        <div class="card p-0">
          <div class="card-img-top"><a href="detail?id=${o.id}"> <img style="height: 100%;width: 100%;" src="${o.image}"></a></div>
          <div class="card-body ">
            <div style="text-align: center;" >
              <h4 class="card-title show_txt"> </h4>
              <h3 class="card-text food-title" style="color:green;"><a href="detail?id=${o.id}" title="View Food">${o.name}</a></h3>
              <p style="font-size: 20px; color: red;" class="money">${o.price} VNĐ</p>
            </div>
            <c:if test="${sessionScope.acc != null}">
              <div class="all-button" style="margin-top: 20px;"><hr>
                <button  type="button" class="btn button-1 btn-success btn-cart"  style="margin-right: 15px;min-width: 100px;"><a href="add-to-cart?id=${o.id}">Thêm vào giỏ hàng</a></button>
              </div>
            </c:if>
          </div>
        </div>
      </div>
      </c:forEach>


    </div>
  </div>
  <div class="hotline-phone-ring-wrap">
    <div class="hotline-bar">
      <a href="tel:0123456789">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telephone" viewBox="0 0 16 16">
          <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.568 17.568 0 0 0 4.168 6.608 17.569 17.569 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.678.678 0 0 0-.58-.122l-2.19.547a1.745 1.745 0 0 1-1.657-.459L5.482 8.062a1.745 1.745 0 0 1-.46-1.657l.548-2.19a.678.678 0 0 0-.122-.58L3.654 1.328zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"/>
        </svg>
      </a>
    </div>
  </div>
</main>

<jsp:include page="footer.jsp"></jsp:include>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>


</body>
</html>
