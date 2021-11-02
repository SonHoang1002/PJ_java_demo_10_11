package Entity;

import java.io.Serializable;
import java.util.List;

public class Order implements Serializable {
    private int order_id;
    private Account buyer;// nguoi mua
    private List<Item> items;
    private String buyDate;// ngay mua
    private float priceTotal;

    public Order() {

    }

    public Order(int order_id, Account buyer, List<Item> items, String buyDate, float priceTotal) {
        this.order_id = order_id;
        this.buyer = buyer;
        this.items = items;
        this.buyDate = buyDate;
        this.priceTotal = priceTotal;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public Account getBuyer() {
        return buyer;
    }

    public void setBuyer(Account buyer) {
        this.buyer = buyer;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public String getBuyDate() {
        return buyDate;
    }

    public void setBuyDate(String buyDate) {
        this.buyDate = buyDate;
    }

    public float getPriceTotal() {
        return priceTotal;
    }

    public void setPriceTotal(float priceTotal) {
        this.priceTotal = priceTotal;
    }

    @Override
    public String toString() {
        return "Order{" +
                "order_id=" + order_id +
                ", buyer=" + buyer +
                ", buyDate='" + buyDate + '\'' +
                ", priceTotal=" + priceTotal +
                '}';
    }
}
