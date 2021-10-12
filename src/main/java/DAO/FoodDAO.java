package DAO;

import Entity.Account;
import Entity.Category;
import Entity.Comment;
import Entity.Food;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class FoodDAO {
    public static Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodweb", "root", "Phambaongoc2221");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }

    public static List<Food> getAllFood() {
        List<Food> list = new ArrayList<Food>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from food");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Food food = new Food();
                food.setId(rs.getInt("id"));
                food.setName(rs.getString("name"));
                food.setImage(rs.getString("image"));
                food.setPrice(rs.getFloat("price"));
                food.setScript(rs.getString("script"));
                list.add(food);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static List<Category> getAllCategory() {
        List<Category> list = new ArrayList<Category>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from category");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category category = new Category();
                category.setcID(rs.getInt("cID"));
                category.setCname(rs.getString("cname"));
                list.add(category);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static List<Food> getAllCategoryByID(String cID) {
        List<Food> list = new ArrayList<Food>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from food where cid=?");
            ps.setString(1, cID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Food food = new Food();
                food.setId(rs.getInt("id"));
                food.setName(rs.getString("name"));
                food.setImage(rs.getString("image"));
                food.setPrice(rs.getFloat("price"));
                food.setScript(rs.getString("script"));
                list.add(food);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;

    }


    public static Food getFoodByID(String id) {
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from food where id = ?;");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Food(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getFloat(4),
                        rs.getString(5));
            }
        } catch (Exception e) {

        }
        return null;
    }

    public static List<Food> getFoodByName(String txtSearch) {
        List<Food> list = new ArrayList<Food>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from food where name like ?");
            ps.setString(1, "%" + txtSearch + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Food food = new Food();
                food.setId(rs.getInt("id"));
                food.setName(rs.getString("name"));
                food.setImage(rs.getString("image"));
                food.setPrice(rs.getFloat("price"));
                food.setScript(rs.getString("script"));
                list.add(food);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public Account login(String username, String password) {
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT*FROM account WHERE username=? AND password=?");
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5));
            }
        } catch (Exception e) {

        }
        return null;
    }

    public Account checkAccount(String username) {
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT*FROM account WHERE username=?");
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5));
            }
        } catch (Exception e) {

        }
        return null;
    }

    public void signup(String username, String password) {
        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO account (username, password, isSell, isAdmin) VALUES (?, ?, 0, 0);");
            ps.setString(1, username);
            ps.setString(2, password);
            ps.executeUpdate();
        } catch (Exception e) {

        }
    }

    public static List<Food> getFoodBySellID(int uID) {
        List<Food> list = new ArrayList<Food>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT*FROM food where uID=?");
            ps.setInt(1,uID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Food food = new Food();
                food.setId(rs.getInt("id"));
                food.setName(rs.getString("name"));
                food.setImage(rs.getString("image"));
                food.setPrice(rs.getFloat("price"));
                food.setScript(rs.getString("script"));
                list.add(food);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public void deleteFoodByID(String id) {
        try{
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM food WHERE id = ?");
            ps.setString(1, id);
            ps.executeUpdate();
        }catch (Exception e){

        }
    }

    public void insertFood(String name, String image, String price, String script, String cID, int uID){
        try{
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO food (name, image, price, script, cID, uID) VALUES (?,?,?,?,?,?)");
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, script);
            ps.setString(5, cID);
            ps.setInt(6, uID);
            ps.executeUpdate();
        }catch (Exception e){

        }
    }

    public void editFood(String name, String image, String price, String script, String cID, String id){
        try{
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE food SET name=?, image=?, price=?, script=?, cID=? WHERE id=?");
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, script);
            ps.setString(5, cID);
            ps.setString(6, id);
            ps.executeUpdate();
        }catch (Exception e){

        }
    }
    public static List<Comment> getAllComment(String id) {
        List<Comment> list = new ArrayList<Comment>();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select cmtID,id, comment.uID, comment, username from comment, account where comment.uID = account.uID  and id=?");
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Comment comment = new Comment();
                comment.setCmtID(rs.getInt("cmtID"));
                comment.setId(rs.getInt("id"));
                comment.setuID(rs.getInt("uID"));
                comment.setUsername(rs.getString("username"));
                comment.setComment(rs.getString("comment"));
                list.add(comment);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;

    }
    public void insertComment(int id, int uID, String comment){
        try{
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO comment (id, uID, comment ) VALUES (?,?,?)");
            ps.setInt(1, id);
            ps.setInt(2, uID);
            ps.setString(3, comment);
            ps.executeUpdate();
        }catch (Exception e){

        }
    }

}
