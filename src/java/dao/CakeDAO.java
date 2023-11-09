/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.CakeDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author Zane
 */
public class CakeDAO {

    private static final String GET_CAKE = "SELECT [cakeID],[cakeName],[description],[price],[image] FROM [dbo].[tblCakes]";
    private static final String FIND = "SELECT [cakeID],[cakeName],[description],[price],[image] FROM [dbo].[tblCakes] WHERE [cakeID] LIKE ?";
    private static final String FIND2 = "SELECT [cakeID],[cakeName],[description],[price],[image] FROM [dbo].[tblCakes] WHERE [cakeName] LIKE ?";
    private static final String INSERT = "INSERT INTO [dbo].[tblCakes] ([cakeID], [cakeName], [description], [price], [image]) VALUES (?, ?, ?, ?, ?)";
    public static final String UPDATE = "UPDATE [dbo].[tblCakes] SET [cakeName] = ?, [description] = ?, [price] = ? WHERE [cakeID] LIKE ?";
    public static final String DELETE = "DELETE FROM [dbo].[tblCakes] WHERE [cakeID] = ?";

    public static List<CakeDTO> getListCake() throws SQLException, ClassNotFoundException {
        List<CakeDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ps = con.prepareStatement(GET_CAKE);
                rs = ps.executeQuery();
                while (rs.next()) {
                    String cakeID = rs.getString("cakeID");
                    String cakeName = rs.getString("cakeName");
                    String description = rs.getString("description");
                    float price = rs.getFloat("price");
                    String image = rs.getString("image");
                    CakeDTO cake = new CakeDTO(cakeID, cakeName, description, price, image);
                    list.add(cake);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }

    public List<CakeDTO> getListCakeByID(String submit) throws SQLException {
        List<CakeDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ps = con.prepareStatement(FIND);
                ps.setString(1, "%" + submit + "%");
                rs = ps.executeQuery();
                while (rs.next()) {
                    String cakeID = rs.getString("cakeID");
                    String cakeName = rs.getString("cakeName");
                    String description = rs.getString("description");
                    float price = rs.getFloat("price");
                    String image = rs.getString("image");
                    list.add(new CakeDTO(cakeID, cakeName, description, price, image));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                rs.close();
            }
            if (con != null) {
                rs.close();
            }
        }
        return list;
    }

    public List<CakeDTO> getListCakeByName(String find) throws SQLException {
        List<CakeDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ps = con.prepareStatement(FIND2);
                ps.setString(1, "%" + find + "%");
                rs = ps.executeQuery();
                while (rs.next()) {
                    String cakeID = rs.getString("cakeID");
                    String cakeName = rs.getString("cakeName");
                    String description = rs.getString("description");
                    float price = rs.getFloat("price");
                    String image = rs.getString("image");
                    list.add(new CakeDTO(cakeID, cakeName, description, price, image));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return list;
    }

    public static boolean insertCake(CakeDTO cake) throws SQLException {
        boolean checkInsert = false;
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ps = con.prepareStatement(INSERT);
                ps.setString(1, cake.getCakeID());
                ps.setString(2, cake.getCakeName());
                ps.setString(3, cake.getDescription());
                ps.setFloat(4, cake.getPrice());
                ps.setString(5, cake.getImage());

                checkInsert = ps.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return checkInsert;
    }

    public static boolean updateCake(CakeDTO cake) throws SQLException {
        boolean checkUpdate = false;
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ps = con.prepareStatement(UPDATE);
                ps.setString(1, cake.getCakeName());
                ps.setString(2, cake.getDescription());
                ps.setFloat(3, cake.getPrice());
                ps.setString(4, cake.getCakeID());

                checkUpdate = ps.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return checkUpdate;
    }

    public static boolean deleteCake(String cakeID) throws SQLException {
        boolean checkDelete = false;
        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                ps = con.prepareStatement(DELETE);
                ps.setString(1, cakeID);

                checkDelete = ps.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return checkDelete;
    }

    public static int getMaxCakeID() throws SQLException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int maxCakeID = 0;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT \n"
                        + "    MAX(CAST(SUBSTRING(cakeID, 2, LEN(cakeID)) AS INT)) AS maxCakeID\n"
                        + "FROM \n"
                        + "    tblCakes";
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                if (rs.next()) {
                    maxCakeID = rs.getInt("maxCakeID");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return maxCakeID;
    }

}
