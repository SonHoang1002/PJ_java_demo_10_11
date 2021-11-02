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
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "AddToCartControl",urlPatterns = "/addtoCart")
public class AddToCartControl extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("id");
        FoodDAO dao = new FoodDAO();
        Food food = dao.getFoodByID(id);

        HttpSession session = request.getSession();
        Object obj = session.getAttribute("cart");// luu tam vao session
        if (obj == null) {// tao moi
            // Tao mat hang
            Item item = new Item();
            item.setFood(food);
            item.setQuantity(1);
            item.setUnitPrice(food.getPrice());
            // gio hang co nhieu mat hang
            Map<String, Item> map = new HashMap<>();
            map.put(id, item);// them mat hang vao ds

            session.setAttribute("cart", map);// luu tam vao session
        } else {
            Map<String, Item> map = (Map<String, Item>) obj;

            Item item = map.get(id);

            if (item == null) {
                item = new Item();
                item.setFood(food);
                item.setQuantity(1);
                item.setUnitPrice(food.getPrice());

                map.put(id, item);
            } else {

                item.setQuantity(item.getQuantity() + 1);
            }

            session.setAttribute("cart", map);// luu tam vao session
        }

        response.sendRedirect(request.getContextPath() + "/cart");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
