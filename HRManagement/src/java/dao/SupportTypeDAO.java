/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.SupportType;

/**
 *
 * @author ZenBook
 */
public class SupportTypeDAO extends DBContext {

    public List<SupportType> getAllSupportTypes() {
        List<SupportType> list = new ArrayList();
        String sql = "select * from HR_Management.Support_Type";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                SupportType supportType = new SupportType();
                supportType.setId(rs.getInt("id"));
                supportType.setName(rs.getString("name"));
                supportType.setIn_charge_team(new GroupDAO().getGroupById(rs.getInt("in_charge_team_id")));
                supportType.setEmail(rs.getString("email"));
                supportType.setStatus(rs.getString("status"));
                supportType.setDes(rs.getString("description"));
                list.add(supportType);
            }
            return list;
        } catch (SQLException e) {
            return null;
        }

    }

    public List<SupportType> getAllSupportTypesName() {
        List<SupportType> list = new ArrayList();
        String sql = "select * from HR_Management.Support_Type";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                SupportType supportType = new SupportType();
                supportType.setId(rs.getInt("id"));
                supportType.setName(rs.getString("name"));
                list.add(supportType);
            }
            return list;
        } catch (SQLException e) {
            return null;
        }

    }

    public SupportType getSupportTypeById(int id) {
        SupportType supportType = new SupportType();
        String sql = "select * from HR_Management.Support_Type where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                supportType.setId(rs.getInt("id"));
                supportType.setName(rs.getString("name"));
                supportType.setIn_charge_team(new GroupDAO().getGroupById(rs.getInt("in_charge_team_id")));
                supportType.setEmail(rs.getString("email"));
                supportType.setStatus(rs.getString("status"));
                supportType.setDes(rs.getString("description"));
            }
            return supportType;
        } catch (SQLException e) {
            return null;
        }
    }

    public SupportType getSupportTypeNameById(int id) {
        SupportType supportType = new SupportType();
        String sql = "select * from HR_Management.Support_Type where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                supportType.setId(rs.getInt("id"));
                supportType.setName(rs.getString("name"));
            }
            return supportType;
        } catch (SQLException e) {
            return null;
        }
    }

    public int getSupportTypeIdByInchargeId(int inchargeId) {
        String sql = "select * from Request where incharge_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, inchargeId);
            ResultSet rs = st.executeQuery();
            int id = 0;
            while (rs.next()) {
                id = rs.getInt("support_type_id");
            }
            return id;
        } catch (SQLException e) {
            return 0;
        }
    }

    public void recoverDeletedSupportType(int id) {
        String sql = "update Support_Type set status=?"
                + " where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, "active");
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteActiveSupportType(int id) {
        String sql = "update Support_Type set status=?"
                + " where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, "inactive");
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addSupportType(String name, int in_charge_group_id, String email,
            String status, String description) {
        String sql = "insert into Support_Type (name, in_charge_team_id, email, status, description) \n"
                + "values(?,?,?,?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setInt(2, in_charge_group_id);
            st.setString(3, email);
            st.setString(4, status);
            st.setString(5, description);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public SupportType getSupportTypeByName(String name) {
        SupportType supportType = new SupportType();
        String sql = "select * from HR_Management.Support_Type where name like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                supportType.setId(rs.getInt("id"));
                supportType.setName(rs.getString("name"));
                supportType.setIn_charge_team(new GroupDAO().getGroupById(rs.getInt("in_charge_team_id")));
                supportType.setEmail(rs.getString("email"));
                supportType.setStatus(rs.getString("status"));
                supportType.setDes(rs.getString("description"));
                return supportType;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public SupportType getSupportTypeByEmail(String email) {
        SupportType supportType = new SupportType();
        String sql = "select * from HR_Management.Support_Type where email like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                supportType.setId(rs.getInt("id"));
                supportType.setName(rs.getString("name"));
                supportType.setIn_charge_team(new GroupDAO().getGroupById(rs.getInt("in_charge_team_id")));
                supportType.setEmail(rs.getString("email"));
                supportType.setStatus(rs.getString("status"));
                supportType.setDes(rs.getString("description"));
                return supportType;
            }
        } catch (SQLException e) {

        }
        return null;
    }

    public void updateSupportType(int id, String name, int in_charge_group_id, String email,
            String status, String description) {
        String sql = "update Support_Type set name=?, in_charge_team_id=? , email=?, \n"
                + "status = ?, description=? where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);

            st.setInt(2, in_charge_group_id);
            st.setString(3, email);
            st.setString(4, status);
            st.setString(5, description);
            st.setInt(6, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        SupportTypeDAO sp = new SupportTypeDAO();
        System.out.println(sp.getSupportTypeIdByInchargeId(163));
    }
}
