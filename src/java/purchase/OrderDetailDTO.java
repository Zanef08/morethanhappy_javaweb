/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package purchase;

import java.sql.Date;

/**
 *
 * @author Zane
 */
public class OrderDetailDTO extends OrderDTO{
    
    private int orderDetailID;
    private String cakeID;
    private int quantity;
    private String status;

    public OrderDetailDTO() {
    }

    public OrderDetailDTO(int orderDetailID, String cakeID, int quantity, String status) {
        this.orderDetailID = orderDetailID;
        this.cakeID = cakeID;
        this.quantity = quantity;
        this.status = status;
    }

    public OrderDetailDTO(int orderDetailID, String cakeID, int quantity, String status, String orderID, String date, String userID, String phone, String address, float total) {
        super(orderID, date, userID, phone, address, total);
        this.orderDetailID = orderDetailID;
        this.cakeID = cakeID;
        this.quantity = quantity;
        this.status = status;
    }

    public int getOrderDetailID() {
        return orderDetailID;
    }

    public void setOrderDetailID(int orderDetailID) {
        this.orderDetailID = orderDetailID;
    }

    public String getCakeID() {
        return cakeID;
    }

    public void setCakeID(String cakeID) {
        this.cakeID = cakeID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    
    
    
}
