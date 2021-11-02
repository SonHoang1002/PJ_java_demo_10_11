package Entity;

import java.io.Serializable;

public class Food implements Serializable {
    int id;
    String name;
    String image;
    float price;
    String script;

    public Food() {

    }

    public Food(int id, String name, String image, float price, String script) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.price = price;
        this.script = script;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getScript() {
        return script;
    }

    public void setScript(String script) {
        this.script = script;
    }

    @Override
    public String toString() {
        return "Food{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", image='" + image + '\'' +
                ", price=" + price +
                ", script='" + script + '\'' +
                '}';
    }
}
