/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dto.CakeDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import purchase.Cart;
import purchase.Item;

/**
 *
 * @author Zane
 */
@WebServlet(name = "BuyController", urlPatterns = {"/BuyController"})
public class BuyController extends HttpServlet {

    private static final String ERROR = "cake.jsp";
    private static final String SUCCESS = "cake.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String cmbCake = request.getParameter("cmbCake");
            String tmp[] = cmbCake.split("-");
            String id = tmp[0];
            String description = tmp[1];
            float price = Float.parseFloat(tmp[2]);
            int quantity = Integer.parseInt(request.getParameter("cmbQuantity"));
            HttpSession session = request.getSession();
            if (session != null) {
                Cart cart = (Cart) session.getAttribute("CART");
                if (cart == null) {
                    cart = new Cart();
                }
                Item item = new Item();
                item.setId(id);
                item.setDescription(description);
                item.setPrice(price);
                item.setQuantity(quantity);
                String imageUrl = getImageUrlById(id);
                item.setImage(imageUrl);
                boolean check = cart.add(id, item);
                if (check) {
                    session.setAttribute("CART", cart);
                    request.setAttribute("MESSAGE", quantity + " - " + description + ": successfully !");
                    url = SUCCESS;
                }
            }
        } catch (Exception e) {
            log("Error at BuyController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

     private String getImageUrlById(String id) {
        String imageUrl = "";

        if (id.equals("C1")) {
            imageUrl = "https://i.pinimg.com/564x/c8/91/b5/c891b53019cff444cc1cf2f0bfaf8894.jpg";
        } else if (id.equals("C2")) {
            imageUrl = "https://i.pinimg.com/236x/d9/8f/66/d98f6679d5b8e7196e99259ef4c01e8c.jpg";
        } else if (id.equals("C3")) {
            imageUrl = "https://i.pinimg.com/564x/1f/bb/67/1fbb6702d5800ef3de9d20ab73486f5d.jpg";
        } else if (id.equals("C4")) {
            imageUrl = "https://i.pinimg.com/736x/f7/3c/1c/f73c1cc15c569d4f8f4f5e84b092c84e.jpg";
        } else if (id.equals("C5")) {
            imageUrl = "https://i.pinimg.com/564x/61/e1/97/61e197ee9d503bd549875fe6313aa233.jpg";
        } else if (id.equals("C6")) {
            imageUrl = "https://i.pinimg.com/564x/5c/e2/1a/5ce21abc4151627a27525ee0214617f5.jpg";
        } else if (id.equals("C7")) {
            imageUrl = "https://i.pinimg.com/736x/01/81/b8/0181b804c892f0c8ac6d788ddacce560.jpg";
        } else if (id.equals("C8")) {
            imageUrl = "https://i.pinimg.com/736x/e0/fa/61/e0fa61d649e631b100ab2c80b2e4d5a0.jpg";
        } else if (id.equals("C9")) {
            imageUrl = "https://i.pinimg.com/564x/58/37/61/583761582b475e5c32544ecac7a4e7e4.jpg";
        } else if (id.equals("C10")) {
            imageUrl = "https://i.pinimg.com/564x/32/f7/de/32f7de3196d12bf6b10ddb86d263da3c.jpg";
        }

        return imageUrl;
    }
}
