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
public class OrderDTO {
    
    private String orderID;
    private String date;
    private String userID;
    private String phone;
    private String address;
    private float total;

    public OrderDTO() {
    }

    public OrderDTO(String orderID, String date, String userID, String phone, String address, float total) {
        this.orderID = orderID;
        this.date = date;
        this.userID = userID;
        this.phone = phone;
        this.address = address;
        this.total = total;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

   
    
    
    
    
}
