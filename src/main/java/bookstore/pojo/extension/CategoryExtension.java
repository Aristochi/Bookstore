package bookstore.pojo.extension;

import java.util.List;

import bookstore.annotation.ORMAnnotation.JoinColumn;
import bookstore.annotation.ORMAnnotation.OneToMany;
import bookstore.pojo.Product;
import bookstore.pojo.base.BasePOJO;

public class CategoryExtension extends BasePOJO {
    @OneToMany
    @JoinColumn(name = "cid")
    private List<Product> products;


    public String getImgPath() {
        return getId() + ".jpg";
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }
}