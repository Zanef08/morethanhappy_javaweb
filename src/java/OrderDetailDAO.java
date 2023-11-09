import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import purchase.OrderDetailDTO;
import utils.DBUtils;

public class OrderDetailDAO {
        public List<OrderDetailDTO> getOrdersWithDetails() throws SQLException {
            List<OrderDetailDTO> orderDetailsList = new ArrayList<>();
            Connection connection = null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;

            try {
                connection = DBUtils.getConnection();
                if (connection != null) {
                    // Câu truy vấn SQL
                    String query = "SELECT O.*, OD.* " +
                                   "FROM [dbo].[tblOrders] AS O " +
                                   "JOIN [dbo].[tblOrderDetails] AS OD ON O.orderID = OD.orderID";

                    preparedStatement = connection.prepareStatement(query);
                    resultSet = preparedStatement.executeQuery();

                    while (resultSet.next()) {
                        // Lấy thông tin từ kết quả truy vấn
                        int orderDetailID = resultSet.getInt("orderDetailID");
                        String cakeID = resultSet.getString("cakeID");
                        int quantity = resultSet.getInt("quantity");
                        String status = resultSet.getString("status");
                        String orderID = resultSet.getString("orderID");
                        String date = resultSet.getString("date");
                        String userID = resultSet.getString("userID");
                        String phone = resultSet.getString("phone");
                        String address = resultSet.getString("address");
                        float total = resultSet.getFloat("total");

                        // Tạo các đối tượng OrderDTO và OrderDetailDTO
                        OrderDetailDTO orderDetail = new OrderDetailDTO(orderDetailID, cakeID, quantity, status, orderID, phone, phone, phone, address, total);
                        orderDetailsList.add(orderDetail);
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
                throw e;
            } finally {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            }

            return orderDetailsList;
        }
}