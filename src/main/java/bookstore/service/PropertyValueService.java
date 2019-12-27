package bookstore.service;

import java.util.List;
import java.util.Map;

import bookstore.pojo.Product;
import bookstore.pojo.Property;
import bookstore.pojo.PropertyValue;

public interface PropertyValueService extends BaseService{
    /**
     * 初始化一个产品的所有参数，即预先插入空数据
     * @param product 要修改的产品
     */
    public void init(Product product) throws Exception;
}