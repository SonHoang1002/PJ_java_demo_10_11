package Control;
/*
import DAO.BillDao;
import DAO.FoodDAO;
import Entity.Account;
import Entity.Food;
import Entity.Item;
import Entity.Order;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

@WebServlet(urlPatterns = "/member/add-order") // bat dang nhap thanh vien truoc
public class AddOrderControl extends HttpServlet {
    BillDao billDao = new BillDao();
    FoodDAO foodDAO = new FoodDAO();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //DOC TU SESSION RA GIO HANG TRUOC
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("acc");
        Order order = (Order) session.getAttribute("order");// luu tam vao session
        BillDao billDao = new BillDao();
        int order_id = order.getOrder_id();
        int uID = account.getuID();
        Date ngayDat = order.getBuyDate();
        String diachi = order.getDiachi();
        float priceTotal = order.getPriceTotal();
        if (account != null && order!=null) {//KIEM TRA XEM CO SP TRONG GIO HANG KO?
            order.setBuyer(account);
            billDao.insertHoadon(order_id, uID, ngayDat, diachi, priceTotal);
        }
    }
}
*/