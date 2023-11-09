package purchase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import purchase.Cart;
import purchase.Item;
import purchase.OrderDTO;
import utils.DBUtils;

public class OrderDAO {

    private static final String INSERT_ORDER = "insert into [dbo].[tblOrders]([dateBuy], [total], [userID], [phone], [address]) values(?, ?, ?, ?, ?)";
    private static final String INSERT_ORDER_DETAIL = "insert into [dbo].[tblOrderDetails]([cakeID], [orderID], [price], [quantity], [total]) values(?, ?, ?, ?, ?)";
    private static final String LIST_ORDER = "SELECT o.[orderID], o.dateBuy,o.userID,o.phone,o.address, od.cakeID,od.quantity, od.total FROM [dbo].[tblOrders] o JOIN [dbo].[tblOrderDetails] od ON o.orderID = od.orderID WHERE o.dateBuy LIKE ? ORDER BY o.dateBuy DESC";

    public static Boolean insertOrder(Cart cart, OrderDTO order) throws SQLException, ClassNotFoundException {
        Boolean check = true;
        Connection conn = DBUtils.getConnection();
        PreparedStatement ptm = null;

        try {
            conn.setAutoCommit(false);
            int result = 0;
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT_ORDER);
                ptm.setString(1, order.getDate());
                ptm.setFloat(2, order.getTotal());
                ptm.setString(3, order.getUserID());
                ptm.setString(4, order.getPhone());
                ptm.setString(5, order.getAddress());

                result = ptm.executeUpdate();
                if (result > 0) {
                    String sql = "select Max([orderID]) as 'id' from [dbo].[tblOrders]";
                    ptm = conn.prepareStatement(sql);
                    ResultSet rs = ptm.executeQuery();
                    if (rs != null && rs.next()) {
                        int orderID = rs.getInt("id");
                        for (Item i : cart.getCart().values()) {
                            ptm = conn.prepareStatement(INSERT_ORDER_DETAIL);
                            ptm.setString(1, i.getId());
                            ptm.setInt(2, orderID);
                            ptm.setFloat(3, i.getPrice());
                            ptm.setInt(4, i.getQuantity());
                            ptm.setFloat(5, i.getPrice() * i.getQuantity());

                            result = ptm.executeUpdate();
                            if (result == 0) {
                                throw new SQLException("Failed to insert order detail.");
                            }
                        }
                    }
                }
            }
            conn.commit();
        } catch (SQLException e) {
            check = false;
            conn.rollback();
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return check;
    }

    public List<OrderDetailDTO> getOrdersAndOrderDetailsByDateBuy(String show) throws SQLException, ClassNotFoundException {
        List<OrderDetailDTO> orders = new ArrayList<>();
        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                psmt = conn.prepareStatement(LIST_ORDER);
                psmt.setString(1, "%" + show + "%");
                rs = psmt.executeQuery();

                while (rs.next()) {
                    String orderID = rs.getString("orderID");
                    String dateBuy = rs.getString("dateBuy");
                    String userID = rs.getString("userID");
                    String phone = rs.getString("phone");
                    String address = rs.getString("address");
                    String cakeID = rs.getString("cakeID");
                    int quantity = rs.getInt("quantity");
                    float total = rs.getFloat("total");
                    orders.add(new OrderDetailDTO(0, cakeID, quantity, "", orderID, dateBuy, userID, phone, address, total));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (psmt != null) {
                psmt.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return orders;
    }

}
