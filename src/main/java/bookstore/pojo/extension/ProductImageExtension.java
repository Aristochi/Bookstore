package bookstore.pojo.extension;

import bookstore.annotation.ORMAnnotation.JoinColumn;
import bookstore.annotation.ORMAnnotation.ManyToOne;
import bookstore.pojo.Product;
import bookstore.pojo.base.BasePOJO;

public class ProductImageExtension extends BasePOJO {
    @ManyToOne
    @JoinColumn(name = "pid")
    private Product product;

    public enum Type{
        top,detail,cover;
    }
    public String getPath(){
        return getId()+".jpg";
    }


    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}

