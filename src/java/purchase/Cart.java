/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package purchase;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Zane
 */
public class Cart {

    private Map<String, Item> cart;

    public Cart() {
    }

    public Cart(Map<String, Item> cart) {
        this.cart = cart;
    }

    public Map<String, Item> getCart() {
        return cart;
    }

    public void setCart(Map<String, Item> cart) {
        this.cart = cart;
    }

    public boolean add(String id, Item item) {
        boolean check = false;
        try {
            if (this.cart == null) {
                this.cart = new HashMap<>();
            }
            if (this.cart.containsKey(id)) {
                int currentQuantity = this.cart.get(id).getQuantity();
                item.setQuantity(currentQuantity + item.getQuantity());
            }
            this.cart.put(id, item);
            check = true;
        } catch (Exception e) {

        }
        return check;
    }

    public boolean remove(String id) {
        boolean check = false;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(id)) {
                    this.cart.remove(id);
                    check = true;
                }
            }
        } catch (Exception e) {

        }
        return check;
    }

    public boolean edit(String id, Item item) {
        boolean check = false;
        try {
            if (this.cart != null) {
                if (this.cart.containsKey(id)) {
                    this.cart.replace(id, item);
                    check = true;
                }
            }
        } catch (Exception e) {

        }
        return check;
    }
}
