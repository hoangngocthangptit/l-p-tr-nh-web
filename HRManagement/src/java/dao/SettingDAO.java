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
import model.Setting;

/**
 *
 * @author nghie
 */
public class SettingDAO extends DBContext {

    public List<Setting> getAllSettings(String Type, String Status, String value) {
        List<Setting> list = new ArrayList<>();
        String sql = "select s.*, sv.id 'settingvalueid', sv.value, sv.status, "
                + "sv.order_number, sv.note from Setting s \n"
                + "inner join Setting_Value sv on s.id = sv.setting_id\n"
                + "where sv.value like ? ";
        try {
            if (!Type.equals("")){
                sql = sql + "and s.type = ? ";
            }
            if (!Status.equals("")){
                sql = sql + "and sv.status = ? ";
            }
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + value + "%");
            int i = 1;
            if (!Type.equals("")){
                st.setString(++i, Type);
            }
            if (!Status.equals("")){
                st.setString(++i, Status);
            }
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Setting setting = new Setting();
                setting.setId(rs.getInt("id"));
                setting.setOrder(rs.getInt("order_number"));
                setting.setType(rs.getString("type"));
                setting.setNote(rs.getString("note"));
                setting.setValueid(rs.getInt("settingvalueid"));
                setting.setValue(rs.getString("value"));
                setting.setStatus(rs.getString("status"));
                list.add(setting);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }
    }

    public void UpdateStatus(String currentStatus, int id) {
        String sql = "update Setting_Value \n"
                + "set status = ?\n"
                + "where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            String status;
            if (currentStatus.equals("Active")) {
                status = "Inactive";
            } else {
                status = "Active";
            }
            ps.setString(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public Setting getSettingByValueId(int id) {
        String sql = "select s.*, sv.id 'settingvalueid', sv.value, sv.status, "
                + "sv.order_number, sv.note from Setting s\n"
                + "inner join Setting_Value sv on s.id = sv.setting_id\n"
                + "where sv.id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Setting setting = new Setting();
                setting.setId(rs.getInt("id"));
                setting.setOrder(rs.getInt("order_number"));
                setting.setType(rs.getString("type"));
                setting.setNote(rs.getString("note"));
                setting.setValueid(rs.getInt("settingvalueid"));
                setting.setValue(rs.getString("value"));
                setting.setStatus(rs.getString("status"));
                return setting;
            }
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }
        return null;
    }

    public int getSettingIdByType(String type) {
        String sql = "select id from Setting where type = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, type);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("id");
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public void AddSettingType(String type) {
        String sql = "insert into Setting(type) values (?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, type);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void UpdateSettingValue(Setting setting) {
        String sql = "update Setting_Value\n"
                + "set setting_id = ?, value = ?, status = ?, order_number = ?, note = ?\n"
                + "where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, setting.getId());
            ps.setString(2, setting.getValue());
            ps.setString(3, setting.getStatus());
            ps.setInt(4, setting.getOrder());
            ps.setString(5, setting.getNote());
            ps.setInt(6, setting.getValueid());
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void AddSettingValue(Setting setting) {
        String sql = "insert into Setting_Value (setting_id, value, status, order_number, note)\n"
                + "values (?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, setting.getId());
            ps.setString(2, setting.getValue());
            ps.setString(3, setting.getStatus());
            ps.setInt(4, setting.getOrder());
            ps.setString(5, setting.getNote());
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public int checkValueExist(Setting setting) {
        String sql = "select sv.id from Setting s left join Setting_Value sv on s.id = sv.setting_id\n"
                + "where s.id = ? and sv.value =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, setting.getId());
            st.setString(2, setting.getValue());
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("id");
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public List<String> getAllValueSettingByType(String type) {
        String sql = "select *from Setting s inner join Setting_Value sv\n"
                + "on s.id = sv.setting_id\n"
                + "where s.type = ? and sv.status = \"Active\"";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, type);
            ResultSet rs = st.executeQuery();
            List<String> list = new ArrayList<>();
            while (rs.next()) {
                list.add(rs.getString("value"));
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) {
        SettingDAO s = new SettingDAO();
        System.out.println(s.getAllSettings("","",""));

    }
}
