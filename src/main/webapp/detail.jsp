<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Food Detail</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>

</head>
<html>
<body>
<style>
  #img{
    height: 400px;
    width:350px;
  }
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
  @media only screen and (min-width:540px ) and (max-width: 990px){
    .detail-div{
      display: flex;
      flex-direction: column;
    }
    .detail-content{
      text-align: justify;
    }
  }
  .dot {
    height: 6px;
    width: 6px;
    margin-left: 3px;
    margin-right: 3px;
    margin-top: 2px;
    background-color: rgb(91, 92, 91);
    border-radius: 50%;
    display: inline-block
  }

  .name {
    font-size: 14px
  }

  .date {
    font-size: 12px
  }

  .rating i {
    color: gold;
    font-size: 13px
  }

  .comment-text {
    font-size: 12px
  }
</style>
<header>
  <jsp:include page="menu.jsp"></jsp:include>
</header>
<main class="container mt-3" >

  <div>

    <div class="row detail-div mt-3">
      <div class="col-sm-5 order-sm-1 order-2">
        <img id="img" class="img-prd" src="${detail.image}" >
      </div>
      <div class="col-sm-7 order-sm-2 order-1">
        <h1 class="content-product-h3" style="margin-bottom:30px;">${detail.name}</h1>
        <div class="price">
          Price: <span style="margin-bottom:30px;font-size: 30px;" class="text-primary money" > ${detail.price} <svg xmlns="http://www.w3.org/2000/svg" width="27" height="27" fill="currentColor" class="bi bi-currency-dollar" viewBox="0 0 16 16">
                              <path d="M4 10.781c.148 1.667 1.513 2.85 3.591 3.003V15h1.043v-1.216c2.27-.179 3.678-1.438 3.678-3.3 0-1.59-.947-2.51-2.956-3.028l-.722-.187V3.467c1.122.11 1.879.714 2.07 1.616h1.47c-.166-1.6-1.54-2.748-3.54-2.875V1H7.591v1.233c-1.939.23-3.27 1.472-3.27 3.156 0 1.454.966 2.483 2.661 2.917l.61.162v4.031c-1.149-.17-1.94-.8-2.131-1.718H4zm3.391-3.836c-1.043-.263-1.6-.825-1.6-1.616 0-.944.704-1.641 1.8-1.828v3.495l-.2-.05zm1.591 1.872c1.287.323 1.852.859 1.852 1.769 0 1.097-.826 1.828-2.2 1.939V8.73l.348.086z"/>
                            </svg></span>
          <hr>
        </div>
        Number:      <input style="margin-left: 20px;" aria-label="quantity" class="input-qty" max="1000" min="1" name="" type="number" value="1"><br>
        <div id="button" style="margin-top: 20px;"><hr>
          <button id="btn-add-cart" type="button" class="btn btn-success btn-cart" style="margin-right: 15px;"><a href="add-to-cart?id=${o.id}">Thêm vào giỏ hàng</a></button>
        </div>
      </div>
    </div>
  </div>
  <div style="margin-top: 30px;color: red;">
    <p style="font-size: 40px">  Giới thiệu món ăn  </p><hr>
  </div>
  <div class="detail-content">${detail.script}</div>
  <hr>
  <div class="container mt-5">
    <div class="d-flex justify-content-center row">
      <div class="col-md-8">
        <div class="d-flex flex-column comment-section">
          <h5>Reviews</h5>
          <c:if test="${sessionScope.acc != null}">
            <form action="/addComment" method="post">
              <div class="bg-light p-2">
                <div class="d-flex flex-row align-items-start"><img class="rounded-circle" src="${sessionScope.acc.avatar}" width="40"><textarea class="form-control ml-1 shadow-none textarea" name="comment"></textarea></div>
                <div class="modal-footer">
                  <input type="submit" class="btn btn-success" value="Post">
                </div>
              </div>
            </form>
          </c:if>
          <c:if test="${sessionScope.acc == null}">
            <div class="alert-danger" role="alert">
              <p>Đăng nhập để review món ăn!</p>
            </div>
          </c:if>
          <c:forEach items="${cmt}" var="a">
            <div class="bg-white p-2">
              <div class="d-flex flex-row user-info"><img class="rounded-circle" src="${a.avatar}" width="40">
                <div class="d-flex flex-column justify-content-start ml-2"><span class="d-block font-weight-bold name">${a.username}</span></div>
              </div>
              <div class="mt-2">
                <p class="comment-text">${a.comment}</p>
              </div>
            </div>
          </c:forEach>
        </div>
      </div>
    </div>
  </div>
</main>
<jsp:include page="footer.jsp"></jsp:include>
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
<script>
  // Modal
  var modal = document.getElementById("myModal");
  var btn = document.getElementById("cart");
  var close = document.getElementsByClassName("close")[0];
  var close_footer = document.getElementsByClassName("close-footer")[0];
  var order = document.getElementsByClassName("order")[0];
  btn.onclick = function () {
    modal.style.display = "block";
  }
  close.onclick = function () {
    modal.style.display = "none";
  }
  close_footer.onclick = function () {
    modal.style.display = "none";
  }
  order.onclick = function () {
    alert("Cảm ơn bạn đã thanh toán đơn hàng")
  }

  window.onclick = function (event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  }

  // xóa cart
  var remove_cart = document.getElementsByClassName("btn-danger");
  for (var i = 0; i < remove_cart.length; i++) {
    var button = remove_cart[i]
    button.addEventListener("click", function () {
      var button_remove = event.target
      button_remove.parentElement.parentElement.remove()
      updatecart()
    })
  }
  // thay đổi số lượng sản phẩm
  var quantity_input = document.getElementsByClassName("cart-quantity-input");
  for (var i = 0; i < quantity_input.length; i++) {
    var input = quantity_input[i];
    input.addEventListener("change", function (event) {
      var input = event.target
      if (isNaN(input.value) || input.value <= 0) {
        input.value = 1;
      }
      updatecart()
    })
  }
  // update cart
  function updatecart() {
    var cart_item = document.getElementsByClassName("cart-items")[0];
    var cart_rows = cart_item.getElementsByClassName("cart-row");
    var total = 0;
    for (var i = 0; i < cart_rows.length; i++) {
      var cart_row = cart_rows[i]
      var price_item = cart_row.getElementsByClassName("cart-price ")[0]
      var quantity_item = cart_row.getElementsByClassName("cart-quantity-input")[0]
      var price = parseFloat(price_item.innerText)
      var quantity = quantity_item.value
      total = total + (price * quantity)
    }
    document.getElementsByClassName("cart-total-price")[0].innerText = total + 'VNĐ'

  }





  //them vào giỏ
  var add_cart = document.getElementsByClassName("btn-cart");
  for(var i = 0;i<add_cart.length;i++){
    var add = add_cart[i]
    add.addEventListener("click",function(event){
      var button = event.target
      var product = button.parentElement.parentElement
      var img = product.parentElement.getElementsByClassName("img-prd")[0].src
      var title = product.getElementsByClassName("content-product-h3")[0].innerText
      var price = product.getElementsByClassName("money")[0].innerText
      addItemToCart(title, price, img)
      modal.style.display="block"
      updatecart()

    })
  }
  function addItemToCart(title, price, img){
    var cartRow = document.createElement('div')
    cartRow.classList.add('cart-row')
    var cartItems = document.getElementsByClassName('cart-items')[0]
    var cart_title = cartItems.getElementsByClassName('cart-item-title')
    for (var i = 0; i < cart_title.length; i++) {
      if (cart_title[i].innerText == title) {
        alert('Sản Phẩm Đã Có Trong Giỏ Hàng')
        return
      }
    }
    var cartRowContents = `
  <div class="cart-item cart-column">
      <img class="cart-item-image" src="${img}" width="100" height="100">
      <span class="cart-item-title">${title}</span>
  </div>
  <span class="cart-price cart-column">${price}</span>
  <div class="cart-quantity cart-column">
      <input class="cart-quantity-input" type="number" value="1">
      <button class="btn btn-danger" type="button">Xóa</button>
  </div>`
    cartRow.innerHTML = cartRowContents
    cartItems.append(cartRow)
    cartRow.getElementsByClassName('btn-danger')[0].addEventListener('click', function () {
      var button_remove = event.target
      button_remove.parentElement.parentElement.remove()
      updatecart()
    })
    cartRow.getElementsByClassName('cart-quantity-input')[0].addEventListener('change', function (event) {
      var input = event.target
      if (isNaN(input.value) || input.value <= 0) {
        input.value = 1;
      }
      updatecart()
    })
  }

</script>
</body>
</html>
