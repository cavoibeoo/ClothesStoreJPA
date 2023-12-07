package Service;

import model.OrderEntity;

import java.util.List;

public interface OrderService {
    void update(OrderEntity order);

    void delete(int orderId) throws Exception;

    OrderEntity findById(int orderId);

    List<OrderEntity> findAll();

    int count();
}
