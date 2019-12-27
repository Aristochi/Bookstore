package bookstore.pojo.extension;

import bookstore.annotation.ORMAnnotation.JoinColumn;
import bookstore.annotation.ORMAnnotation.ManyToOne;
import bookstore.pojo.Category;
import bookstore.pojo.base.BasePOJO;

public class PropertyExtension extends BasePOJO {
    @ManyToOne
    @JoinColumn(name="cid")
    private Category category;

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
