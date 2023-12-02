
import JpaConfig.JpaConfig;
import model.*;
import org.hibernate.Transaction;

import javax.persistence.*;

public class Main {
    public static void main(String[] args) {
/*        CustomerService customerService = new CustomerServiceImpl();
        CustomerEntity customerEntity = customerService.findById(6);
 
        Cart cart = new Cart();
        cart.setCustomer(customerEntity);
        EntityManager entityManager = JpaConfig.getEntityManager();
        entityManager.getTransaction().begin();
        entityManager.merge(cart);
        entityManager.getTransaction().commit();*/
        
        EntityManager entityManager = JpaConfig.getEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        
        entityManager.getTransaction().begin();
        long in = 12;
        /*String jpql = "DELETE  FROM CartItem where cartItemId = :id";
        Query query = entityManager.createQuery(jpql);
        query.setParameter("id",in);
        int row = query.executeUpdate();*/
        
        
        
        entityManager.getTransaction().commit();
    }
}
