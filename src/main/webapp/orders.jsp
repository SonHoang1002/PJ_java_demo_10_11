<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.text.DecimalFormat"%>
<%@page import="DAO.*"%>
<%@page import="Entity.*"%>
<%@page import="java.util.*"%>

<%
  DecimalFormat dcf = new DecimalFormat("#.##");
  request.setAttribute("dcf", dcf);
  Account auth = (Account) request.getSession().getAttribute("acc");
  List<Cart> orders = null;
  if (auth != null) {
    request.setAttribute("person", auth);
    FoodDAO orderDao  = new FoodDAO();
    orders =orderDao.userOrders(String.valueOf(auth.getuID()));
  }else{
    response.sendRedirect("login.jsp");
  }
  ArrayList<Item> cart_list = (ArrayList<Item>) session.getAttribute("cart-list");
  if (cart_list != null) {
    request.setAttribute("cart_list", cart_list);
  }

%>
<!DOCTYPE html>
<html>
<head><meta name="viewport" content="width=device-width,initial-scale=1">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <title>Check out</title>
</head>
<body>
<jsp:include page="menu.jsp"></jsp:include>

<div class="container">
  <div class="card-header my-3">All Orders</div>
  <table class="table table-light">
    <thead>
    <tr>
      <th scope="col">Date</th>
      <th scope="col">Name</th>

      <th scope="col">Quantity</th>
      <th scope="col">Price</th>
      <th scope="col">Cancel</th>
    </tr>
    </thead>
    <tbody>

    <%
      if(orders != null){
        for(Cart o:orders){%>
    <tr>
      <td><%=o.getDateCreate() %></td>
      <td><%=o.getName() %></td>

      <td><%=o.getQuantity() %></td>
      <td><%=dcf.format(o.getPrice()) %></td>
      <td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderID()%>">Cancel Order</a></td>
    </tr>
    <%}
    }
    %>

    </tbody>
  </table>
</div>


</body>
</html>