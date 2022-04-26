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
import model.Absence;
import model.DateConvert;

/**
 *
 * @author ZenBook
 */
public class AbsenceDAO extends DBContext {

    public List<Absence> getAbsenceByStaffId(int id) {
        List<Absence> list = new ArrayList<>();
        String sql = "SELECT * FROM Absence where staffId = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Absence a = new Absence();
                a.setId(rs.getInt("id"));
                a.setTitle(rs.getString("title"));
                a.setStartDate(rs.getDate("startDate"));
                a.setEndDate(rs.getDate("endDate"));
                a.setRequestDate(rs.getDate("request_date"));
                a.setDuration(rs.getInt("duration"));
                a.setStatus(rs.getString("status"));
                a.setType(rs.getString("type"));
                list.add(a);
            }
            return list;
        } catch (SQLException e) {
            return null;
        }
    }

    public List<Absence> getAbsenceByStaffIdAndFilter(int id, String title, String type, 
            String requestDate, String startDate, String endDate, String status) {
        List<Absence> list = new ArrayList<>();
        String sql = "SELECT * FROM Absence where staffId = ?\n";

        if (title != null && !title.equals("")) {
            sql += "and title LIKE '%" + title + "%'\n";
        }
        
        if (type != null && !type.equals("")) {
            sql += "and type = '" + type + "'\n";
        }

        if (requestDate != null && !requestDate.equals("")) {
            sql += "and request_date like '%" + requestDate + "%'\n";
        }

        if (startDate != null && !startDate.equals("")) {
            sql += "and startDate like '%" + startDate + "%'\n";
        }
        
        if (endDate != null && !endDate.equals("")) {
            sql += "and endDate like '%" + endDate + "%'\n";
        }

        if (status != null && !status.equals("")) {
            sql += "and status = '" + status + "'\n";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Absence a = new Absence();
                a.setId(rs.getInt("id"));
                a.setTitle(rs.getString("title"));
                a.setStartDate(rs.getDate("startDate"));
                a.setEndDate(rs.getDate("endDate"));
                a.setRequestDate(rs.getDate("request_date"));
                a.setDuration(rs.getInt("duration"));
                a.setStatus(rs.getString("status"));
                a.setType(rs.getString("type"));
                list.add(a);
            }
            return list;
        } catch (SQLException e) {
            return null;
        }
    }
    
    public List<Absence> getSubmittedAbsenceByManagerId(int managerId) {
        List<Absence> list = new ArrayList<>();
        String sql = "SELECT * FROM Absence a inner join Team t\n"
                + "on a.teamId = t.id\n"
                + "where t.manager_id = ? and a.status = 'Submitted';";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, managerId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Absence a = new Absence();
                a.setId(rs.getInt("id"));
                a.setTitle(rs.getString("title"));
                a.setStartDate(rs.getDate("startDate"));
                a.setEndDate(rs.getDate("endDate"));
                a.setRequestDate(rs.getDate("request_date"));
                a.setDuration(rs.getInt("duration"));
                a.setStatus(rs.getString("status"));
                a.setType(rs.getString("type"));
                list.add(a);
            }
            return list;
        } catch (SQLException e) {
            return null;
        }
    }

    public Absence getAbsenceById(int id) {
        String sql = "SELECT * FROM Absence where id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            Absence a = new Absence();
            while (rs.next()) {
                a.setId(id);
                a.setTitle(rs.getString("title"));
                a.setStaff(new UserDAO().getUserInformation(rs.getInt("staffId")));
                a.setTeam(new GroupDAO().getGroupById(rs.getInt("teamId")));
                a.setStartDate(rs.getDate("startDate"));
                a.setEndDate(rs.getDate("endDate"));
                a.setRequestDate(rs.getDate("request_date"));
                a.setDuration(rs.getInt("duration"));
                a.setStatus(rs.getString("status"));
                a.setType(rs.getString("type"));
            }
            return a;
        } catch (SQLException e) {
            return null;
        }
    }

    public void updateGroupIdById(int id, int groupId) {
        String sql = "update Absence\n"
                + "set teamId = ?\n"
                + "where id = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, groupId);
            ps.setInt(2, id);
//            ps.setString(8, des);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void updateTitleById(int id, String title) {
        String sql = "update Absence\n"
                + "set title = ?\n"
                + "where id = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, title);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void updateTypeById(int id, String type) {
        String sql = "update Absence\n"
                + "set type = ?\n"
                + "where id = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, type);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void updateStartDateById(int id, String startDate) {
        String sql = "update Absence\n"
                + "set startDate = ?\n"
                + "where id = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, startDate);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void updateEndDateById(int id, String endDate) {
        String sql = "update Absence\n"
                + "set endDate = ?\n"
                + "where id = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, endDate);
            ps.setInt(2, id);
//            ps.setString(8, des);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void updateDurationById(int id, int duration) {
        String sql = "update Absence\n"
                + "set duration = ?\n"
                + "where id = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, duration);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }
    
    public void updateStatusById(int id, String status) {
        String sql = "update Absence\n"
                + "set status = ?\n"
                + "where id = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void addNewAbsence(int userId, String title, String type, int groupId,
            String from, String to, int duration) {
        String sql = "INSERT INTO Absence "
                + "(staffId, teamId, startDate, endDate, status, type, title, request_date, duration) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, now(), ?);";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, groupId);
            ps.setString(3, from);
            ps.setString(4, to);
            ps.setString(5, "Submitted");
            ps.setString(6, type);
            ps.setString(7, title);
            ps.setInt(8, duration);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteAbsenceById(int id) {
        String sql = "delete from Absence\n"
                + "where id = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public List<Absence> getAllAbsenceRequest(int id) {
        List<Absence> list = new ArrayList();
        String sql = "SELECT * FROM Absence where teamId = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            Absence a = new Absence();
            while (rs.next()) {
                a.setId(id);
                a.setTitle(rs.getString("title"));
                a.setStaff(new UserDAO().getUserInformation(rs.getInt("staffId")));
                a.setTeam(new GroupDAO().getGroupById(rs.getInt("teamId")));
                a.setStartDate(rs.getDate("startDate"));
                a.setEndDate(rs.getDate("endDate"));
                a.setRequestDate(rs.getDate("request_date"));
                a.setDuration(rs.getInt("duration"));
                a.setStatus(rs.getString("status"));
                a.setType(rs.getString("type")); 
                list.add(a);
            }
            return list;
        } catch (SQLException e) {
            return null;
        }
    }

    public static void main(String[] args) {
        AbsenceDAO a = new AbsenceDAO();
        a.updateTypeById(25, "Late Arriving");
    }
}
