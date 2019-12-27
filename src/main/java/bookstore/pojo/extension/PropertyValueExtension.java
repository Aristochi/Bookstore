package bookstore.pojo.extension;

import bookstore.annotation.ORMAnnotation.JoinColumn;
import bookstore.annotation.ORMAnnotation.ManyToOne;
import bookstore.pojo.Product;
import bookstore.pojo.Property;
import bookstore.pojo.base.BasePOJO;

public class PropertyValueExtension extends BasePOJO {
    @ManyToOne
    @JoinColumn(name="pid")
    private Product product;
    @ManyToOne
    @JoinColumn(name="ptid")
    private Property property;

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Property getProperty() {
        return property;
    }

    public void setProperty(Property property) {
        this.property = property;
    }
}
