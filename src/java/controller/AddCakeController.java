package controller;

import dao.CakeDAO;
import dto.CakeDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AddCakeController", urlPatterns = {"/AddCakeController"})
public class AddCakeController extends HttpServlet {

    private static final String ERROR = "addCake.jsp";
    private static final String SUCCESS = "SearchController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;

        try {
            int maxCakeID = CakeDAO.getMaxCakeID();
            String cakeID = "C" + (maxCakeID + 1);
            String cakeName = request.getParameter("cakeName");
            String description = request.getParameter("description");
            float price = Float.parseFloat(request.getParameter("price"));
            String imageLink = request.getParameter("image");

            if (cakeName != null && !cakeName.isEmpty() && description != null && description.length() <= 50
                    && price >= 0) {
                CakeDTO cake = new CakeDTO(cakeID, cakeName, description, price, imageLink); 
                CakeDAO dao = new CakeDAO();
                boolean checkInsert = dao.insertCake(cake);

                if (checkInsert) {
                    url = SUCCESS;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
