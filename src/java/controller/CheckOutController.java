/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import purchase.Cart;
import purchase.OrderDAO;
import purchase.OrderDTO;

/**
 *
 * @author Zane
 */
@WebServlet(name = "CheckOutController", urlPatterns = {"/CheckOutController"})
public class CheckOutController extends HttpServlet {

    private static final String ERROR = "404.html";
    private static final String SUCCESS = "invoice.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        String msg = "";
        try {
            HttpSession session = request.getSession();
            String orderID = request.getParameter("orderID");
            String userID = request.getParameter("userID");
            String address = request.getParameter("Address");
            String date = request.getParameter("date");
            String phone = request.getParameter("Phone");
            float total = Float.parseFloat(request.getParameter("Total"));
            OrderDTO order = new OrderDTO(orderID, date, userID, phone, address, total);
            Cart cart = (Cart) session.getAttribute("CART");
            boolean check = OrderDAO.insertOrder(cart, order);

            if (check) {
                session.setAttribute("ORDER", order);
                msg = "Order has been placed successfully!";
                url = SUCCESS;
            } else {
                msg = "Failed to place the order!";
                url = ERROR;
            }
        } catch (Exception e) {
            log("Error at CheckOutController: " + e + toString());
        } finally {
            request.setAttribute("msg", msg);
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

}
