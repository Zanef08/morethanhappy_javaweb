/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author Zane
 */
public class CakeDTO {
    
    private String cakeID;
    private String cakeName;
    private String description;
    private float price;
    private String image;

    public CakeDTO() {
    }

    public CakeDTO(String cakeID, String cakeName, String description, float price, String image) {
        this.cakeID = cakeID;
        this.cakeName = cakeName;
        this.description = description;
        this.price = price;
        this.image = image;
    }
     public CakeDTO( String cakeName, String description, float price) {
        this.cakeName = cakeName;
        this.description = description;
        this.price = price;
    }
    

    public String getCakeID() {
        return cakeID;
    }

    public void setCakeID(String cakeID) {
        this.cakeID = cakeID;
    }

    public String getCakeName() {
        return cakeName;
    }

    public void setCakeName(String cakeName) {
        this.cakeName = cakeName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
    
}
