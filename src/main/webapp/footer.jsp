<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 9/14/2021
  Time: 1:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
</head>

<body>
<style>



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

    .button #btn-add-cart{
      margin-left: 13px;
      margin-bottom: 10px;
    }

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
    background: gray;
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
<footer style="margin-top:30px;color:white">
  <div class="container" >
    <div class="noi-dung about">
      <h2>Về Chúng Tôi</h2>
      <p style="color:white">Chúng tôi mang đến khách hàng  </p>
      <ul class="social-icon">
        <img  style="margin-top: 8px;margin-right: 10px; height: 45px;width: 45px; border-radius: 30px;" src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/Facebook-icon-1.png/240px-Facebook-icon-1.png" alt="">
        <img  style="margin-top: 8px;margin-right: 10px; height: 45px;width: 45px; border-radius: 30px;" src="data:image/jpeg;base64,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" alt="">
        <img  style="margin-top: 8px;margin-right: 1px; height: 45px;width: 45px; border-radius: 30px;" src="https://png.pngtree.com/png-clipart/20190516/original/pngtree-twitter-creative-icon-png-image_3562045.jpg" alt="">
        <img  style="  height: 60px;width: 60px; border-radius: 50px;" src="https://cliply.co/wp-content/uploads/2019/04/371903520_SOCIAL_ICONS_YOUTUBE.png" alt="">
      </ul>
    </div>

    <div class="noi-dung links">
      <h2>Danh Mục</h2>
      <ul>
        <li><a href="#" style="color:white">Trang Chủ</a></li>
        <li><a href="#" style="color:white">Về Chúng Tôi</a></li>
        <li><a href="#" style="color:white">Dịch Vụ</a></li>
        <li><a href="#" style="color:white">Điều Kiện Chính Sách</a></li>
      </ul>
    </div>

    <div class="noi-dung contact">
      <h2>Thông Tin Liên Hệ</h2>
      <ul class="info">
        <li >
          <span><i class="fa fa-map-marker" style="color:white"></i></span>
          <span style="color:white">Đường Số 1<br />
                      Quận 1, Thành Phố Hồ Chí Minh<br />
                      Việt Nam</span>
        </li>
        <!-- <li>
            <span><i class="fa fa-phone"></i></span>
            <p><a href="#">+84 123 456 789</a>
                <br />
                <a href="#">+84 987 654 321</a></p>
        </li> -->
        <li>
          <span><i class="fa fa-envelope" style="color:white"></i></span>
          <p><a href="#" style="color:white">diachiemail@gmail.com</a></p>
        </li>
        <!-- <li>
            <form class="form">
                <input type="email" class="form__field" placeholder="Đăng Ký Subscribe Email" />
                <button type="button" class="btn btn--primary  uppercase">Gửi</button>
            </form>
        </li> -->
      </ul>
    </div>
  </div>
</footer>

<div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
  © 2021 Copyright:
  <a class="text-reset fw-bold" href="https://mdbootstrap.com/">MDBootstrap.com</a>
</div>

</footer>
</body>
</html>