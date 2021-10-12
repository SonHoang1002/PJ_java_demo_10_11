package Control;

import DAO.FoodDAO;
import Entity.Account;
import Entity.Food;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "AddComment", urlPatterns = {"/addComment"})
public class AddComment extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String comment = request.getParameter("comment");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        Food food = (Food) session.getAttribute("f");
        int uID = account.getuID();
        int id = food.getId();


        FoodDAO dao = new FoodDAO();
        dao.insertComment(id, uID, comment);
        request.getRequestDispatcher("/detail").forward(request,response);

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