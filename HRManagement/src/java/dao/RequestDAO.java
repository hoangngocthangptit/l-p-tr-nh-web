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
import model.Group;
import model.Request;
import model.SupportType;
import model.User;

/**
 *
 * @author ZenBook
 */
public class RequestDAO extends DBContext {
    public List<Request> getAllRequestsByRaisedStaffId(int id) {
        List<Request> list = new ArrayList<>();
        String sql = "SELECT * FROM Request r inner join Support_Type st\n"
                + "on r.support_type_id = st.id\n"
                + "where r.raised_staff_id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Request request = new Request();
                request.setId(rs.getInt("id"));
                request.setTitle(rs.getString("title"));
                request.setStatus(rs.getString("status"));
                request.setRequestDate(rs.getDate("request_date"));
                request.setUpdatedDate(rs.getDate("updated_date"));
                request.setDes(rs.getString("description"));

                SupportType sp = new SupportType();
                sp.setId(rs.getInt(7));
                sp.setName(rs.getString(11));

                request.setSupportType(sp);
                list.add(request);
            }
            return list;
        } catch (SQLException e) {
            return null;
        }
    }

    public List<Request> getAllRequestsByRaisedStaffIdAndFilter(int id, String spId, String requestDate,
            String updatedDate, String status, String title) {
        List<Request> list = new ArrayList<>();
        String sql = "SELECT * FROM Request r inner join Support_Type st\n"
                + "on r.support_type_id = st.id\n"
                + "where r.raised_staff_id = ? \n";

        if (spId != null && !spId.equals("")) {
            sql += "and r.support_type_id = " + spId + "\n";
        }

        if (requestDate != null && !requestDate.equals("")) {
            sql += "and r.request_date like '%" + requestDate + "%'\n";
        }

        if (updatedDate != null && !updatedDate.equals("")) {
            sql += "and r.updated_date like '%" + updatedDate + "%'\n";
        }

        if (status != null && !status.equals("")) {
            sql += "and r.status = '" + status + "'\n";
        }

        if (title != null && !title.equals("")) {
            sql += "and r.title LIKE '%" + title + "%'";
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Request request = new Request();
                request.setId(rs.getInt("id"));
                request.setTitle(rs.getString("title"));
                request.setStatus(rs.getString("status"));
                request.setRequestDate(rs.getDate("request_date"));
                request.setUpdatedDate(rs.getDate("updated_date"));

                SupportType sp = new SupportType();
                sp.setId(rs.getInt(7));
                sp.setName(rs.getString(11));

                request.setSupportType(sp);
                list.add(request);
            }
            return list;
        } catch (SQLException e) {
            return null;
        }
    }

    public List<Request> getAllAssignedRequestsByInchargeStaffId(int id) {
        List<Request> list = new ArrayList<>();
        String sql = "select * from Request r inner join Support_Type st\n"
                + "on r.support_type_id = st.id\n"
                + "inner join Team t\n"
                + "on st.in_charge_team_id = t.id\n"
                + "where r.incharge_id = ? and ( r.status = 'Submitted' or r.status = 'Assigned');";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                UserDAO userDAO = new UserDAO();
                Request request = new Request();
                request.setId(rs.getInt("id"));
                request.setTitle(rs.getString("title"));
                request.setStatus(rs.getString("status"));
                request.setRequestDate(rs.getDate("request_date"));
                request.setUpdatedDate(rs.getDate("updated_date"));
                if (rs.getString(9) == null) {
                    request.setDes("");
                } else {
                    request.setDes(rs.getString(9));
                }

                request.setRaisedStaff(userDAO.getUserInformation(rs.getInt("raised_staff_id")));

                SupportType sp = new SupportType();
                sp.setId(rs.getInt(10));
                sp.setName(rs.getString(11));

                Group g = new Group();
                g.setId(rs.getInt("in_charge_team_id"));
                g.setMembers(new UserDAO().getAllUserExceptStaffByRequestId(request.getId()));

                sp.setIn_charge_team(g);

                request.setSupportType(sp);
                list.add(request);
                userDAO.close();
            }
            return list;
        } catch (SQLException e) {
            return null;
        }
    }

    public List<Request> getAllAssignedRequestsByInchargeStaffIdAndFilter(int inchargeId,
            String requestDate, String updatedDate, String spId, String status, String title) {
        List<Request> list = new ArrayList<>();
        String sql = "select * from Request r inner join Support_Type st\n"
                + "on r.support_type_id = st.id\n"
                + "inner join Team t\n"
                + "on st.in_charge_team_id = t.id\n"
                + "where r.incharge_id = ? and r.status != 'Submitted'\n";

        if (requestDate != null && !requestDate.equals("")) {
            sql += "and r.request_date like '%" + requestDate + "%'\n";
        }

        if (updatedDate != null && !updatedDate.equals("")) {
            sql += "and r.updated_date like '%" + updatedDate + "%'\n";
        }

        if (spId != null && !spId.equals("")) {
            sql += "and r.support_type_id = " + spId + "\n";
        }

        if (status != null && !status.equals("")) {
            sql += "and r.status = '" + status + "'\n";
        }

        if (title != null && !title.equals("")) {
            sql += "and r.title LIKE '%" + title + "%'";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, inchargeId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                UserDAO userDAO = new UserDAO();

                Request request = new Request();
                request.setId(rs.getInt(1));
                request.setTitle(rs.getString("title"));
                request.setStatus(rs.getString("status"));
                request.setRequestDate(rs.getDate("request_date"));
                request.setUpdatedDate(rs.getDate("updated_date"));
                if (rs.getString(9) == null) {
                    request.setDes("None");
                } else {
                    request.setDes(rs.getString(9));
                }

                request.setRaisedStaff(userDAO.getUserInformation(rs.getInt("raised_staff_id")));
                request.setInchargeStaff(userDAO.getUserUsernameById(rs.getInt("incharge_id")));

                SupportType sp = new SupportType();
                sp.setId(rs.getInt(10));
                sp.setName(rs.getString(11));
                request.setSupportType(sp);
                list.add(request);
                userDAO.close();
            }
            return list;
        } catch (SQLException e) {
            return null;
        }
    }

    public List<Request> getAllAssignedRequestsByManagerId(int managerId) {
        List<Request> list = new ArrayList<>();
        String sql = "SELECT * FROM Request r \n"
                + "inner join Support_Type st on r.support_type_id = st.id\n"
                + "inner join Team t on  st.in_charge_team_id = t.id\n"
                + "inner join User u on r.raised_staff_id = u.id\n"
                + "where (r.status = 'Assigned'\n"
                + "or r.status = 'Completed')\n"
                + "and t.manager_id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, managerId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                UserDAO userDAO = new UserDAO();

                Request request = new Request();
                request.setId(rs.getInt(1));
                request.setTitle(rs.getString("title"));
                request.setStatus(rs.getString("status"));
                request.setRequestDate(rs.getDate("request_date"));
                request.setUpdatedDate(rs.getDate("updated_date"));
                if (rs.getString(9) == null) {
                    request.setDes("None");
                } else {
                    request.setDes(rs.getString(9));
                }

                request.setRaisedStaff(userDAO.getUserInformation(rs.getInt("raised_staff_id")));
                request.setInchargeStaff(userDAO.getUserUsernameById(rs.getInt("incharge_id")));

                SupportType sp = new SupportType();
                sp.setId(rs.getInt(10));
                sp.setName(rs.getString(11));
                request.setSupportType(sp);
                list.add(request);
                userDAO.close();
            }
            return list;
        } catch (SQLException e) {
            return null;
        }
    }

    public List<Request> getAllAssignedRequestsByManagerIdAndFilter(int managerId,
            String requestDate, String updatedDate, String inchargeId, String spId,
            String status, String title) {
        List<Request> list = new ArrayList<>();
        String sql = "SELECT * FROM Request r \n"
                + "inner join Support_Type st on r.support_type_id = st.id\n"
                + "inner join Team t on  st.in_charge_team_id = t.id\n"
                + "inner join User u on r.raised_staff_id = u.id\n"
                + "where (r.status = 'Assigned'\n"
                + "or r.status = 'Completed')\n"
                + "and t.manager_id = ?\n";

        if (requestDate != null && !requestDate.equals("")) {
            sql += "and r.request_date = '" + requestDate + "'\n";
        }

        if (updatedDate != null && !updatedDate.equals("")) {
            sql += "and r.updated_date = '" + updatedDate + "'\n";
        }

        if (inchargeId != null && !inchargeId.equals("")) {
            sql += "and r.incharge_id = " + inchargeId + "\n";
        }

        if (spId != null && !spId.equals("")) {
            sql += "and r.support_type_id = " + spId + "\n";
        }

        if (status != null && !status.equals("")) {
            sql += "and r.status = '" + status + "'\n";
        }

        if (title != null && !title.equals("")) {
            sql += "and r.title LIKE '%" + title + "%'";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, managerId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                UserDAO userDAO = new UserDAO();

                Request request = new Request();
                request.setId(rs.getInt(1));
                request.setTitle(rs.getString("title"));
                request.setStatus(rs.getString("status"));
                request.setRequestDate(rs.getDate("request_date"));
                request.setUpdatedDate(rs.getDate("updated_date"));
                if (rs.getString(9) == null) {
                    request.setDes("None");
                } else {
                    request.setDes(rs.getString(9));
                }

                request.setRaisedStaff(userDAO.getUserInformation(rs.getInt("raised_staff_id")));
                request.setInchargeStaff(userDAO.getUserUsernameById(rs.getInt("incharge_id")));

                SupportType sp = new SupportType();
                sp.setId(rs.getInt(10));
                sp.setName(rs.getString(11));
                request.setSupportType(sp);
                list.add(request);
                userDAO.close();
            }
            return list;
        } catch (SQLException e) {
            return null;
        }
    }

    public List<Request> getAllRequestsByManagerId(int id) {
        List<Request> list = new ArrayList<>();
        String sql = "select * from Support_Type st inner join Team t\n"
                + "on st.in_charge_team_id = t.id\n"
                + "inner join Request r\n"
                + "on st.id = r.support_type_id\n"
                + "where t.manager_id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Request request = new Request();
                request.setId(rs.getInt(16));
                request.setTitle(rs.getString("title"));
//                request.setSupportType(rs.getString("support_type"));
//                request.setInchargeStaff(new UserDAO().getUserInformation(rs.getInt("incharge_id")));
//                request.setRaisedStaff(new UserDAO().getUserInformation(rs.getInt("raised_staff_id")));
                request.setStatus(rs.getString("status"));
                request.setRequestDate(rs.getDate("request_date"));
                request.setUpdatedDate(rs.getDate("updated_date"));
                request.setDes(rs.getString("description"));
                list.add(request);
            }
            return list;
        } catch (SQLException e) {
            return null;
        }
    }

    public Request checkAccess(int id, int raised_staff_id) {
        String sql
                = "select * from Request a left join Feedback b\n"
                + "on a.id = b.request_id\n"
                + "where a.id= ? and raised_staff_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.setInt(2, raised_staff_id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Request request = new Request();
                request.setId(rs.getInt("id"));
                request.setTitle(rs.getNString("title"));
                request.setStar(rs.getInt("star"));
                request.setComment(rs.getNString("comment"));
                return request;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public int Feedback(int star, String comment, int id) {
        String sql = "insert into Feedback(request_id,star,comment,feedback_date) values (?,?,?,date(now()));";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setInt(2, star);
            ps.setString(3, comment);
            closeRequest(id);
            return ps.executeUpdate();
        } catch (SQLException e) {
        }
        return 0;
    }

    public int editFeedback(int star, String comment, int id) {
        String sql = "update Feedback set star = ? , comment = ? ,\n"
                + "feedback_date = date(now()) \n"
                + "where request_id =?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(3, id);
            ps.setInt(1, star);
            ps.setString(2, comment);
            return ps.executeUpdate();
        } catch (SQLException e) {
        }
        return 0;
    }

    public int closeRequest(int id) {
        String sql = "update Request set status = 'Closed'\n"
                + "where id =?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            return ps.executeUpdate();
        } catch (SQLException e) {
        }
        return 0;
    }

    public Request getRequestById(int id) {
        String sql = "select * from Request where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Request request = new Request();
                request.setId(rs.getInt("id"));
                request.setTitle(rs.getString("title"));
                request.setSupportType(new SupportTypeDAO().getSupportTypeNameById(rs.getInt("support_type_id")));
                request.setInchargeStaff(new UserDAO().getUserUsernameById(rs.getInt("incharge_id")));
                request.setRaisedStaff(new UserDAO().getUserUsernameById(rs.getInt("raised_staff_id")));
                request.setStatus(rs.getString("status"));
                request.setRequestDate(rs.getDate("request_date"));
                request.setUpdatedDate(rs.getDate("updated_date"));
                request.setDes(rs.getString("description"));
                return request;
            }
        } catch (SQLException e) {
            return null;
        }
        return null;
    }

    public void addNewRequest(String title, String sp_id, int raisedStaffId, String des, int managerId) {
        String sql = "insert into HR_Management.Request(title, status, request_date, updated_date, raised_staff_id, support_type_id, description, incharge_id)\n"
                + "values(?, 'Submitted', DATE(NOW()) , DATE(NOW()), ?, ?, ?, ?);";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, title);
            ps.setInt(2, raisedStaffId);
            ps.setString(3, sp_id);
            ps.setString(4, des);
            ps.setInt(5, managerId);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public void deleteRequestById(int id) {
        String sql = "delete from HR_Management.Request where id = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public void updateStatusById(int id, String status) {
        String sql = "update HR_Management.Request\n"
                + "set status = ?, updated_date = now()\n"
                + "where id = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public void updateSupportTypeById(int id, String spId) {
        String sql = "update HR_Management.Request\n"
                + "set support_type_id = ?, updated_date = now()\n"
                + "where id = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, spId);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public void updateInchargeStaffById(int id, int inchargeId) {
        String sql = "update HR_Management.Request\n"
                + "set incharge_id = ?, updated_date = now()\n"
                + "where id = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, inchargeId);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public void updateDescriptionById(int id, String des) {
        String sql = "update HR_Management.Request\n"
                + "set description = ?, updated_date = now()\n"
                + "where id = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, des);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.err.println(e);
        }
    }

    public static void main(String[] args) {
        RequestDAO r = new RequestDAO();

        System.out.println(r.getAllAssignedRequestsByManagerId(163));

    }
}
