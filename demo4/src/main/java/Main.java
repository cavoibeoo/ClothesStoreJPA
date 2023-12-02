
import JpaConfig.JpaConfig;
import Service.CartItemService;
import Service.OrderDetailsService;
import Service.OrderService;
import Service.impl.CartItemServiceImpl;
import Service.impl.OrderDetailServiceImpl;
import Service.impl.OrderServiceImpl;
import model.*;
import org.hibernate.Transaction;

import javax.persistence.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        OrderService orderService = new OrderServiceImpl();
        OrderDetailsService orderDetailsService = new OrderDetailServiceImpl();
        CartItemService cartItemService = new CartItemServiceImpl();
        
        
/*        CustomerService customerService = new CustomerServiceImpl();
        CustomerEntity customerEntity = customerService.findById(6);
 
        Cart cart = new Cart();
        cart.setCustomer(customerEntity);
        EntityManager entityManager = JpaConfig.getEntityManager();
        entityManager.getTransaction().begin();
        entityManager.merge(cart);
        entityManager.getTransaction().commit();*/
        
/*        EntityManager entityManager = JpaConfig.getEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        
        entityManager.getTransaction().begin();
        long in = 12;
        String jpql = "DELETE  FROM CartItem where cartItemId = :id";
        Query query = entityManager.createQuery(jpql);
        query.setParameter("id",in);
        int row = query.executeUpdate();
        entityManager.getTransaction().commit();*/
    
        EntityManager enma = JpaConfig.getEntityManager();
        String jpql = "SELECT p FROM ProductEntity p WHERE p.productName = :productName " +
                              "AND p.size.sizeId = :sizeId AND p.color.colorId = :colorId ";
        TypedQuery<ProductEntity> query = enma.createQuery(jpql,ProductEntity.class);
        query.setParameter("productName", "Quan 1");
        query.setParameter("sizeId", 2);
        query.setParameter("colorId", 1);
        List<ProductEntity> productEntityList = query.getResultList();
        for (ProductEntity productEntity : productEntityList){
            System.out.println(productEntity.getProductId());
        }
    }
}
