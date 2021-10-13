package Control;

import DAO.FoodDAO;
import Entity.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "EditProfile", urlPatterns = {"/editProfile"})
public class EditProfile extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        int uID = account.getuID();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String soDT = request.getParameter("soDT");
        String avatar = request.getParameter("avatar");
        String email = request.getParameter("email");
        String isSell = request.getParameter("isSell");
        String isAdmin = request.getParameter("isAdmin");


        FoodDAO dao = new FoodDAO();
        dao.editAcount(username,password,soDT,avatar,email,isSell, isAdmin);
        response.sendRedirect("/loadProfile");

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

