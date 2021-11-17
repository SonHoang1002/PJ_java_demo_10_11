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
  @media only screen and (min-width: 400px) and (max-width:990px){

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
          <div class="card-body " style="align-items: center">
            <div style="text-align: center;" >
              <h3 class="card-text food-title" style="color:green;"><a style="text-decoration: none" href="detail?id=${o.id}" title="View Food">${o.name}</a></h3>
              <p style="font-size: 20px; color: red;" class="money">${o.price} VNĐ</p>
            </div>
            <c:if test="${sessionScope.acc != null}">
              <div  style="display:flex;align-items: center;justify-content: center"><hr>
<%--                <button  type="button" class="btn button-1 btn-success btn-cart"  style="right:50%;min-width: 100px;"></button>--%>
                  <button type="button" class=" btn btn-success"><a href="add-to-cart?id=${o.id}" style="text-decoration: none;color:white;">Thêm vào giỏ hàng</a></button>
              </div>
            </c:if>

          </div>
        </div>
      </div>
      </c:forEach>


    </div>
  </div>

</main>

<jsp:include page="footer.jsp"></jsp:include>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>


</body>
</html>
