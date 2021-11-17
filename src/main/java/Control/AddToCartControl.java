package Control;

import DAO.FoodDAO;
import Entity.Food;
import Entity.Item;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "AddToCartControl",urlPatterns = "/add-to-cart")
public class AddToCartControl extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    @SuppressWarnings("unchecked")
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.setContentType("text/html;charset=UTF-8");
        try(PrintWriter out = response.getWriter()) {
            ArrayList<Item> cartList = new ArrayList<>();

            int id = Integer.parseInt(request.getParameter("id"));
            Item i = new Item();
            i.setId(id);
            i.setQuantity(1);

            HttpSession session = request.getSession();
            ArrayList<Item> item_list = (ArrayList<Item>) session.getAttribute("cart-list");
            if (item_list == null) {
                cartList.add(i);
                session.setAttribute("cart-list", cartList);
                response.sendRedirect("/");
            } else {
                cartList = item_list;

                boolean exist = false;
                for (Item it : item_list) {
                    if (it.getId() == id) {
                        exist = true;
//                        out.println("<h3 style='color:crimson; text-align: center'>Item Already in Cart. <a href='cart.jsp'>GO to Cart Page</a></h3>");
                        out.println("<div style='margin:auto;width: 400px;height: 250px; border: red 2px; background-color: tomato; display: flex;align-items: center;flex-direction: column;border: black solid 2px;border-radius:8px;'>");
                        out.println("<div style='margin-top:50px;'>");
                        out.println("<h2 style='color:green; font-size:35px'>Item Already in Cart. </h2>");
                        out.println("</div>");
                        out.println("<div  style='margin-top: 30px;'>");
                        out.println("<button id='close' type='button' style='background-color: aqua;height: 30px;'><a style='text-decoration: none;color:white;' href='cart.jsp'>Đi Đến Giỏ Hàng</a> </button>");
                        out.println("<button id=send type='button' style='background-color: gray;height:30px'><a style='text-decoration: none;color:white;' href='/'>Trở Về Trang Chủ</a> </button>");
                        out.println("</div></div>");
                    }
                }

                if (!exist) {
                    cartList.add(i);
                    response.sendRedirect("/");
                }
            }
        }catch(Exception e) {

        }
    }

}


