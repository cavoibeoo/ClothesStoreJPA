package model;

import javax.persistence.*;
import java.awt.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class CustomerEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int customerId;
    private String customerFName;
    private String customerLName;
    private String customerPhone;
    private String customerAddress;
    private String customerMail;
    private String customerPwd;
    
    @OneToMany(mappedBy = "customer",cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    private List<OrderEntity> orders;
    @OneToOne(mappedBy = "customer", cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    private Cart cart;

    public CustomerEntity() {
        this.cart = new Cart();
        this.orders= new ArrayList<>();
    }
    public CustomerEntity(int customerId, String customerFName, String customerLName, String customerPhone, String customerAddress, String customerMail, String customerPwd, List<OrderEntity> orders, Cart cart) {
        this.customerId = customerId;
        this.customerFName = customerFName;
        this.customerLName = customerLName;
        this.customerPhone = customerPhone;
        this.customerAddress = customerAddress;
        this.customerMail = customerMail;
        this.customerPwd = customerPwd;
        this.orders = orders;
        this.cart = cart;
    }

    public int getCustomerId() {
        return customerId;
    }
    
    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }
    
    public String getCustomerFName() {
        return customerFName;
    }
    
    public void setCustomerFName(String customerFName) {
        this.customerFName = customerFName;
    }
    
    public String getCustomerLName() {
        return customerLName;
    }
    
    public void setCustomerLName(String customerLName) {
        this.customerLName = customerLName;
    }
    
    public String getCustomerPhone() {
        return customerPhone;
    }
    
    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }
    
    public String getCustomerAddress() {
        return customerAddress;
    }
    
    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }
    
    public String getCustomerMail() {
        return customerMail;
    }
    
    public void setCustomerMail(String customerMail) {
        this.customerMail = customerMail;
    }
    
    public String getCustomerPwd() {
        return customerPwd;
    }
    
    public void setCustomerPwd(String customerPwd) {
        this.customerPwd = customerPwd;
    }
    
    public List<OrderEntity> getOrders() {
        return orders;
    }
    
    public void setOrders(List<OrderEntity> orders) {
        this.orders = orders;
    }


    public Cart getCart() {
        return cart;
    }

    public void setCart(Cart cart) {
        this.cart = cart;
    }
}
