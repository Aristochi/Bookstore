package bookstore.pojo.extension;

import java.util.List;

import bookstore.annotation.ORMAnnotation.JoinColumn;
import bookstore.annotation.ORMAnnotation.ManyToOne;
import bookstore.annotation.ORMAnnotation.OneToMany;
import bookstore.pojo.Category;
import bookstore.pojo.ProductImage;
import bookstore.pojo.base.BasePOJO;

public class ProductExtension extends BasePOJO {

    @ManyToOne
    @JoinColumn(name = "cid")
    private Category category;

    @ManyToOne
    @JoinColumn(name="imgid")
    private ProductImage image;
    @OneToMany
    @JoinColumn(name="pid")
    private List<ProductImage> productImages;

    public ProductImage getImage() {
        return image;
    }

    public void setImage(ProductImage image) {
        this.image = image;
    }

    public List<ProductImage> getProductImages() {
        return productImages;
    }

    public void setProductImages(List<ProductImage> productImages) {
        this.productImages = productImages;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
