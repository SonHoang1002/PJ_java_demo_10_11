package Entity;

public class Item {
    private int id;
    private float unitPrice;
    private int quantity;
    private Order order;
    private Food food;

    public Item() {

    }

    public Item(int id, float unitPrice, int quantity, Order order, Food food) {
        this.id = id;
        this.unitPrice = unitPrice;
        this.quantity = quantity;
        this.order = order;
        this.food = food;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(float unitPrice) {
        this.unitPrice = unitPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Food getFood() {
        return food;
    }

    public void setFood(Food food) {
        this.food = food;
    }

    @Override
    public String toString() {
        return "Item{" +
                "id=" + id +
                ", unitPrice=" + unitPrice +
                ", quantity=" + quantity +
                ", order=" + order +
                ", food=" + food +
                '}';
    }
}
