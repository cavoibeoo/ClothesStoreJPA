package Service;

import model.OrderDetail;
import model.OrderEntity;

import java.util.List;

public interface OrderDetailsService {
    
    void create(OrderDetail order);
    
    void update(OrderDetail order);
    
    OrderDetail findById(long orderDetailId);
    
    List<OrderDetail> findByOrderId (int orderId);
    
    List<OrderDetail> findAll();
    
    int count();
    
}
