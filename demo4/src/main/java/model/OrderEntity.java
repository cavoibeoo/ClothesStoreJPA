package model;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
public class OrderEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int orderId;
    private Date orderDate;
    private Date orderDeliveryDate;
    private float orderTotal;
    private float orderDiscount;
    private String orderStatus; //cancel, is delivery, 2 is done
    private boolean isAccepted;
    private String orderPaymentMethod;
    
    @ManyToOne
    @JoinColumn(name = "customerId")
    private CustomerEntity customer;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "order",fetch = FetchType.EAGER)
    private List<OrderDetail> orderDetailList;

    public OrderEntity() {
    }

    public OrderEntity(int orderId, Date orderDate, Date orderDeliveryDate, float orderTotal, float orderDiscount, String orderStatus, boolean isAccepted, String orderPaymentMethod, CustomerEntity customer, List<OrderDetail> orderDetailList) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.orderDeliveryDate = orderDeliveryDate;
        this.orderTotal = orderTotal;
        this.orderDiscount = orderDiscount;
        this.orderStatus = orderStatus;
        this.isAccepted = isAccepted;
        this.orderPaymentMethod = orderPaymentMethod;
        this.customer = customer;
        this.orderDetailList = orderDetailList;
    }

    public int getOrderId() {
        return orderId;
    }
    
    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }
    
    public Date getOrderDate() {
        return orderDate;
    }
    
    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }
    
    public Date getOrderDeliveryDate() {
        return orderDeliveryDate;
    }
    
    public void setOrderDeliveryDate(Date orderDeliveryDate) {
        this.orderDeliveryDate = orderDeliveryDate;
    }
    
    public float getOrderTotal() {
        return orderTotal;
    }
    
    public void setOrderTotal(float orderTotal) {
        this.orderTotal = orderTotal;
    }
    
    public float getOrderDiscount() {
        return orderDiscount;
    }
    
    public void setOrderDiscount(float orderDiscount) {
        this.orderDiscount = orderDiscount;
    }
    
    public String getOrderStatus() {
        return orderStatus;
    }
    
    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }
    
    public boolean isAccepted() {
        return isAccepted;
    }
    
    public void setAccepted(boolean accepted) {
        isAccepted = accepted;
    }
    
    public String getOrderPaymentMethod() {
        return orderPaymentMethod;
    }
    
    public void setOrderPaymentMethod(String orderPaymentMethod) {
        this.orderPaymentMethod = orderPaymentMethod;
    }
    
    public CustomerEntity getCustomer() {
        return customer;
    }
    
    public void setCustomer(CustomerEntity customer) {
        this.customer = customer;
    }


    public List<OrderDetail> getOrderDetailList() {
        return orderDetailList;
    }

    public void setOrderDetailList(List<OrderDetail> orderDetailList) {
        this.orderDetailList = orderDetailList;
    }
}
