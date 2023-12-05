
import JpaConfig.JpaConfig;
import Service.*;
import Service.impl.*;
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
        EntityManager entityManager = JpaConfig.getEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        ReviewService reviewService = new ReviewServiceImpl();
        CategoryService categoryService = new CategoryServiceImpl();
        
        String jpql = "SELECT c from CustomerEntity c";
        TypedQuery<CustomerEntity> query = entityManager.createQuery(jpql, CustomerEntity.class);
        
        List<CustomerEntity> customerEntities = query.getResultList();
//        CustomerEntity customerEntity = JpaConfig.getEntityManager().find(CustomerEntity.class, 6);
//        ProductEntity productEntity = JpaConfig.getEntityManager().find(ProductEntity.class, 3);

        System.out.println(customerEntities.get(0));
        
        //
//        List<CategoryEntity> categoryEntityList = categoryService.findAllByActivated();
//        for (CategoryEntity categoryEntity:categoryEntityList){
//            System.out.println(categoryEntity.getCategoryName());
//        }
    }
}
