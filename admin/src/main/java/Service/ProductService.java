package Service;


import model.ColorEntity;
import model.ProductEntity;
import model.SizeEntity;

import java.util.List;

public interface ProductService {
    void insert(ProductEntity product);

    void update(ProductEntity product);

    void delete(int productId);
    ProductEntity findById(int productId);
    ColorEntity findColorsById(int colorId);

    SizeEntity findSizeById(int sizeId);
    List<ProductEntity> findAll();
    List<ProductEntity> findByName(String productName);
    List<ColorEntity> findAllColors();

    List<SizeEntity> findAllSizes();

    List<ProductEntity> findAllPage(int index);

    List<ProductEntity> search(String keyword, int index);

    int countSearch(String keyword);
    int count();
}
