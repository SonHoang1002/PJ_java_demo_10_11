
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="DAO.*"%>
<%@page import="Entity.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>

<%
  DecimalFormat dcf = new DecimalFormat("#.##");
  request.setAttribute("dcf", dcf);
  Account auth = (Account) request.getSession().getAttribute("acc");
  if (auth != null) {
    request.setAttribute("person", auth);
  }
  ArrayList<Item> cart_list = (ArrayList<Item>) session.getAttribute("cart-list");
  List<Item> cartProduct = null;
  if (cart_list != null) {
    FoodDAO pDao = new FoodDAO();
    cartProduct = pDao.getCartProducts(cart_list);
    double total = pDao.getTotalCartPrice(cart_list);
    request.setAttribute("total", total);
    request.setAttribute("cart_list", cart_list);
  }
%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <title>Cart</title>
  <style type="text/css">
    .table tbody td{
      vertical-align: middle;
    }
    .btn-incre, .btn-decre{
      box-shadow: none;
      font-size: 25px;
    }
  </style>
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>

<div class="container my-3">
  <div class="d-flex py-3"><h3>Total Price: vnd ${(total>0)?dcf.format(total):0} </h3> <a class="mx-3 btn btn-primary" href="cart-check-out">Check Out</a></div>
  <table class="table table-light">
    <thead>
    <tr>
      <th scope="col">Name</th>
      <th scope="col">Price</th>
      <th scope="col">Quantity</th>
    </tr>
    </thead>
    <tbody>
    <%
      if (cart_list != null) {
        for (Item c : cartProduct) {
    %>
    <tr>
      <td><%=c.getName()%></td>
      <td><%= dcf.format(c.getPrice())%></td>
      <td>
        <form action="order-now" method="post" class="form-inline">
          <input type="hidden" name="id" value="<%= c.getId()%>" class="form-input">
          <div class="form-group d-flex justify-content-between">
            <a class="btn bnt-sm btn-incre" href="quantity-inc-dec?action=inc&id=<%=c.getId()%>"><i class="fas fa-plus-square"></i></a>
            <input type="text" name="quantity" class="form-control"  value="<%=c.getQuantity()%>" readonly>
            <a class="btn btn-sm btn-decre" href="quantity-inc-dec?action=dec&id=<%=c.getId()%>"><i class="fas fa-minus-square"></i></a>
          </div>
          <td><button type="submit" class="btn btn-primary btn-sm">Buy</button></td>
        </form>
      </td>
      <td><a href="remove-from-cart?id=<%=c.getId() %>" class="btn btn-sm btn-danger">Remove</a></td>
    </tr>

    <%
        }}%>
    </tbody>
  </table>
</div>


</body>
</html>