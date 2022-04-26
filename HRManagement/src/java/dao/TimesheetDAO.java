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
import model.Timesheet;

/**
 *
 * @author Minh Hieu Pham
 */
public class TimesheetDAO extends DBContext {

    public List<Timesheet> getAllTimesheet() { //Function for Timesheet List
        List<Timesheet> list = new ArrayList();
        String sql = "select id, timesheetDate, timesheetTitle, projectCode, process, duration, status from Timesheet";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Timesheet t = new Timesheet();
                t.setId(rs.getInt(("id")));
                t.setTimesheetDate(rs.getDate("timesheetDate"));
                t.setTimesheetTitle(rs.getString("timesheetTitle"));
                t.setProjectCode(rs.getString("projectCode"));
                t.setProcess(rs.getString("process"));
                t.setDuration(rs.getDouble("duration"));
                t.setStatus(rs.getString("status"));
                list.add(t);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //Function for Timesheet List
    public List<Timesheet> getTimesheetByStaff(int in_charge_staff_id, String title, String from, String to, String process,
            String project) {
        List<Timesheet> list = new ArrayList();
        String sql = "select id, timesheetDate, timesheetTitle, projectCode, process, duration, status from Timesheet"
                + " where in_charge_staff_id = ?";

        if (title != null && !title.equals("")) {
            sql += " and timesheetTitle like '%" + title + "%'";
        }

        if (from != null && !from.equals("") && !(to != null && !to.equals(""))) {
            sql += " and timesheetDate >= '" + from + "'";
        }

        if (to != null && !to.equals("") && !(from != null && !from.equals(""))) {
            sql += " and timesheetDate <= '" + to + "'";
        }

        if (from != null && !from.equals("") && to != null && !to.equals("")) {
            sql += " and timesheetDate between '" + from + "' and '" + to + "'";
        }

        if (process != null && !process.equals("") && !process.equals("All Process")) {
            sql += " and process like '" + process + "'";
        }

        if (project != null && !project.equals("") && !project.equals("All Projects")) {
            sql += " and projectCode like '" + project + "'";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, in_charge_staff_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Timesheet t = new Timesheet();
                t.setId(rs.getInt(("id")));
                t.setTimesheetDate(rs.getDate("timesheetDate"));
                t.setTimesheetTitle(rs.getString("timesheetTitle"));
                t.setProjectCode(rs.getString("projectCode"));
                t.setProcess(rs.getString("process"));
                t.setDuration(rs.getDouble("duration"));
                t.setStatus(rs.getString("status"));
                list.add(t);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //Function for Timesheet List
    public List<Timesheet> getTimesheetByManager(int manager_id, String title, String from, String to, String process,
            String project) {
        List<Timesheet> list = new ArrayList();
        String sql = "select ts.id, ts.timesheetDate, ts.timesheetTitle, ts.projectCode, ts.process, ts.duration, ts.status,  \n"
                + " t.manager_id, ts.in_charge_staff_id, tu.staff_id from Timesheet ts\n"
                + " inner join Team_User tu on ts.in_charge_staff_id = tu.staff_id\n"
                + " left join Team t on t.id = tu.team_id\n"
                + " where t.manager_id = ?";

        if (title != null && !title.equals("")) {
            sql += " and ts.timesheetTitle like '%" + title + "%'";
        }

        if (from != null && !from.equals("") && !(to != null && !to.equals(""))) {
            sql += " and ts.timesheetDate > '" + from + "'";
        }

        if (to != null && !to.equals("") && !(from != null && !from.equals(""))) {
            sql += " and ts.timesheetDate < '" + to + "'";
        }

        if (from != null && !from.equals("") && to != null && !to.equals("")) {
            sql += " and ts.timesheetDate between '" + from + "' and '" + to + "'";
        }

        if (process != null && !process.equals("") && !process.equals("All Process")) {
            sql += " and ts.process like '" + process + "'";
        }

        if (project != null && !project.equals("") && !project.equals("All Projects")) {
            sql += " and ts.projectCode like '" + project + "'";
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, manager_id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Timesheet t = new Timesheet();
                t.setId(rs.getInt(("id")));
                t.setTimesheetDate(rs.getDate("timesheetDate"));
                t.setTimesheetTitle(rs.getString("timesheetTitle"));
                t.setProjectCode(rs.getString("projectCode"));
                t.setProcess(rs.getString("process"));
                t.setDuration(rs.getDouble("duration"));
                t.setStatus(rs.getString("status"));
                t.setIn_charge_staff_id(rs.getInt("in_charge_staff_id"));
                list.add(t);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public String getTeamRoleByStaff(int staff_id) { //Function for Timesheet List
        String sql = "select tu.project_role from Timesheet ts inner join Team_User tu\n"
                + " on ts.in_charge_staff_id = tu.staff_id\n"
                + " where tu.staff_id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, staff_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getString("project_role");
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<String> getAllTimesheetProcess() {
        String sql = "select * from Setting_Value where setting_id=6";
        List<String> list = new ArrayList<>();

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Setting s = new Setting();
                s.setValue(rs.getString("value"));
                list.add(s.getValue());
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void deleteSubmittedTimesheet(int id) {
        String sql = "delete from Timesheet where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Timesheet getTimesheetById(int id) {
        String sql = "select * from Timesheet where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            Timesheet t = new Timesheet();
            if (rs.next()) {
                t.setId(rs.getInt(("id")));
                t.setTimesheetDate(rs.getDate("timesheetDate"));
                t.setTimesheetTitle(rs.getString("timesheetTitle"));
                t.setProjectCode(rs.getString("projectCode"));
                t.setProcess(rs.getString("process"));
                t.setDuration(rs.getDouble("duration"));
                t.setStatus(rs.getString("status"));
                t.setIn_charge_staff_id(rs.getInt("in_charge_staff_id"));
                t.setWorkResult(rs.getString("workResults"));
                t.setRejectReason(rs.getString("rejectReason"));
                
                return t;
            }
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean checkValidProject(int staff_id, String projectCode) {
        String sql = "select * from Team_User tu inner join Project p\n"
                + " on tu.team_id = p.teamId\n"
                + " where tu.staff_id = ? and p.projectCode = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, staff_id);
            st.setString(2, projectCode);
            ResultSet rs = st.executeQuery();
            String code = "";
            if (rs.next()) {
                code = rs.getString("projectCode");
            }
            if (!code.isEmpty()) {
                
                return true;
            }
            
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }

    public void addTimeSheet(String timesheetDate, String timesheetTitle, String projectCode, String process, double duration,
            int in_charge_staff_id, String workResult) {
        String sql = "insert into Timesheet (timesheetDate, timesheetTitle, projectCode, process, duration, status , in_charge_staff_id, "
                + " workResults)\n"
                + "values (?, ?, ?, ?, ?, ?, ?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, timesheetDate);
            st.setString(2, timesheetTitle);
            st.setString(3, projectCode);
            st.setString(4, process);
            st.setDouble(5, duration);
            st.setString(6, "Submitted");
            st.setString(8, workResult);
            st.setInt(7, in_charge_staff_id);
            st.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void updateTimesheet(String timesheetDate, String timesheetTitle, String projectCode, String process, double duration,
            int id) {
        String sql = "update Timesheet set timesheetDate = ?, timesheetTitle = ?, projectCode = ?, process = ?,\n"
                + "duration = ? where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, timesheetDate);

            st.setString(2, timesheetTitle);
            st.setString(3, projectCode);
            st.setString(4, process);
            st.setDouble(5, duration);
            st.setInt(6, id);
            st.executeUpdate();
            
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public static void main(String[] args) {
        TimesheetDAO t = new TimesheetDAO();
        System.out.println(t.getTeamRoleByStaff(169));
    }
}
