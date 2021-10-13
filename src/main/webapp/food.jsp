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
            <div class="all-button" style="margin-top: 20px;"><hr>
              <button  type="button" class="btn button-1 btn-success btn-cart" style="margin-right: 15px;min-width: 100px;">Add To Cart</button>
              <button  type="button" class="btn  btn-success" style="float: right;min-width: 100px;">Order</button>
            </div>
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
  //Modal
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

  //them vao gio
  var add_cart = document.getElementsByClassName("btn-cart");
  for(var i = 0;i<add_cart.length;i++){
    var add = add_cart[i]
    add.addEventListener("click",function(event){
      var button = event.target
      var product = button.parentElement.parentElement
      var img = product.parentElement.parentElement.getElementsByClassName("img-prd")[0].src
      var title = product.getElementsByClassName("food-title")[0].innerText
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
