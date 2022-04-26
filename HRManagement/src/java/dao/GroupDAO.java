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
import model.User;

/**
 *
 * @author nghie
 */
public class GroupDAO extends DBContext {

    public String getAllGroupFromUserId(int id) {
        String listGroup = "";
        String sql = "select *from Team_User where staff_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                if (!listGroup.isEmpty()) {
                    listGroup = listGroup + ", ";
                }
                listGroup = listGroup + rs.getInt("team_id");
            }
        } catch (SQLException e) {
            System.out.println(e);

        }
        return listGroup;
    }

    public int getGroupIdBySupportTypeId(int spId) {
        String sql = "select * from Support_Type where id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, spId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("in_charge_team_id");
            }
        } catch (SQLException e) {
            System.out.println(e);

        }
        return 0;
    }

    public int getGroupIdByStaffId(int staffId) {
        String sql = "SELECT * FROM User u inner join Team_User tu\n"
                + "on u.id = tu.staff_id\n"
                + "where u.id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, staffId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("team_id");
            }
        } catch (SQLException e) {
            System.out.println(e);

        }
        return 0;
    }

    public List<Group> searchGroupByOption(String str, String parent_gr_code, String gr_type, String status) {
        List<Group> list = new ArrayList<>();
        String sql = "select t1.*, u.first_name,u.middle_name,u.last_name, t2.code parent_team\n"
                + "from Team t1 left join User u\n"
                + "on manager_id = u.id\n"
                + "left join Team t2 on t1.parent_team_id = t2.id where 1=1";

        if (str != null && !str.equals("")) {
            sql += " and (t1.name like '%" + str + "%' or t1.code like '%" + str + "%')";
        }

        if (parent_gr_code != null && !parent_gr_code.equals("") && !parent_gr_code.equals("Parent Group")) {

            sql += " and t2.code like '" + parent_gr_code + "'";

        }

        if (gr_type != null && !gr_type.equals("") && !gr_type.equals("Group Type")) {
            sql += " and t1.team_type like '" + gr_type + "'";
        }
        if (status != null && !status.equals("") && !status.equals("Status")) {
            sql += " and t1.status like '" + status + "'";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User manager = new User();
                manager.setFirstname(rs.getString("first_name"));
                manager.setMiddlename(rs.getString("middle_name"));
                manager.setLastname(rs.getString("last_name"));
                Group g = new Group();
                g.setId(rs.getInt("id"));
                g.setCode(rs.getString("code"));
                g.setName(rs.getString("name"));
                g.setManager(manager);
                g.setParent_team_id(rs.getInt("parent_team_id"));
                g.setParent_team_code(rs.getString("parent_team"));
                g.setTeam_type(rs.getString("team_type"));
                g.setStatus(rs.getString("status"));
                g.setUpdate_date(rs.getDate("update_date"));
                list.add(g);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Group> getAllGroupByUserId(int id) {
        String sql = "SELECT * FROM Team_User tu inner join Team t\n"
                + "on tu.team_id = t.id\n"
                + "where staff_id = ?;";
        List<Group> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Group g = new Group();
                g.setId(rs.getInt("id"));
                g.setName(rs.getString("name"));
                list.add(g);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Group getGroupById(int id) {
        String sql = "select t.*, u.first_name, u.middle_name, u.last_name, u.id uid\n"
                + " from Team t inner join User u on t.manager_id = u.id where t.id = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Group g = new Group();
                g.setId(rs.getInt("id"));
                g.setCode(rs.getString("code"));
                g.setName(rs.getString("name"));
                User u = new User();
                u.setId(rs.getInt("uid"));
                u.setFirstname(rs.getString("first_name"));
                u.setMiddlename(rs.getString("middle_name"));
                u.setLastname(rs.getString("last_name"));
                g.setManager(u);
                g.setParent_team_id(rs.getInt("parent_team_id"));
                g.setTeam_type(rs.getString("team_type"));
                g.setStatus(rs.getString("status"));
                g.setUpdate_date(rs.getDate("update_date"));
                g.setDescription(rs.getString("description"));
                return g;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Group getGroupByName(String name) {
        String sql = "select t.*, u.first_name, u.middle_name, u.last_name\n"
                + " from Team t inner join User u on t.manager_id = u.id where t.name like ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Group g = new Group();
                g.setId(rs.getInt("id"));
                g.setCode(rs.getString("code"));
                g.setName(rs.getString("name"));
                User u = new User();
                u.setFirstname(rs.getString("first_name"));
                u.setMiddlename(rs.getString("middle_name"));
                u.setLastname(rs.getString("last_name"));
                g.setManager(u);
                g.setParent_team_id(rs.getInt("parent_team_id"));
                g.setTeam_type(rs.getString("team_type"));
                g.setStatus(rs.getString("status"));
                g.setUpdate_date(rs.getDate("update_date"));
                g.setDescription(rs.getString("description"));
                return g;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Group getGroupByCode(String code) {
        String sql = "select t.*, u.first_name, u.middle_name, u.last_name\n"
                + " from Team t inner join User u on t.manager_id = u.id where t.code like ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, code);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Group g = new Group();
                g.setId(rs.getInt("id"));
                g.setCode(rs.getString("code"));
                g.setName(rs.getString("name"));
                User u = new User();
                u.setFirstname(rs.getString("first_name"));
                u.setMiddlename(rs.getString("middle_name"));
                u.setLastname(rs.getString("last_name"));
                g.setManager(u);
                g.setParent_team_id(rs.getInt("parent_team_id"));
                g.setTeam_type(rs.getString("team_type"));
                g.setStatus(rs.getString("status"));
                g.setUpdate_date(rs.getDate("update_date"));
                g.setDescription(rs.getString("description"));
                return g;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateGroupInGroupDetail(int id, String code, String name, int manager_id, int parent_team_id,
            String status, String description, String grType) {
        String sql = "update Team set name=?, manager_id=?, parent_team_id=?,status=?, description=?, update_date=?, code=?, team_type=? "
                + " where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            if (manager_id == 0) {
                st.setString(2, null);
            } else {
                st.setInt(2, manager_id);
            }
            if (parent_team_id == 0) {
                st.setString(3, null);
            } else {
                st.setInt(3, parent_team_id);
            }
            st.setString(4, status);
            st.setString(5, description);
//            System.out.println(java.time.LocalDate.now().toString());
            long millis = System.currentTimeMillis();
            st.setDate(6, new java.sql.Date(millis));
            st.setString(7, code);
            st.setString(8, grType);
            st.setInt(9, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void addGroupInGroupDetail(String code, String name, int manager_id, int parent_team_id,
            String status, String description, String grType) {
        String sql = "insert into Team (code, name, manager_id, parent_team_id, status, description, team_type) \n"
                + "values(?,?,?,?,?,?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, code);
            st.setString(2, name);
            if (manager_id == 0) {
                st.setString(3, null);
            } else {
                st.setInt(3, manager_id);
            }
            if (parent_team_id == 0) {
                st.setString(4, null);
            } else {
                st.setInt(4, parent_team_id);
            }
            st.setString(5, status);
            st.setString(6, description);
            st.setString(7, grType);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void recoverDeletedGroup(int id) {
        String sql = "update Team set status=?"
                + " where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, "Active");
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void deleteActiveGroup(int id) {
        String sql = "update Team set status=?"
                + " where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, "Inactive");
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Group> getAllGroups() {
        String sql = "select t1.*, u.first_name,u.middle_name,u.last_name, t2.code parent_team\n"
                + "from Team t1 left join User u\n"
                + "on manager_id = u.id\n"
                + "left join Team t2 on t1.parent_team_id = t2.id";
        List<Group> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Group g = new Group();
                g.setId(rs.getInt("id"));
                g.setCode(rs.getString("code"));
                g.setName(rs.getString("name"));
                User u = new User();
                u.setFirstname(rs.getString("first_name"));
                u.setMiddlename(rs.getString("middle_name"));
                u.setLastname(rs.getString("last_name"));
                g.setManager(u);
                g.setParent_team_code(rs.getString("parent_team"));
                g.setParent_team_id(rs.getInt("parent_team_id"));
                g.setTeam_type(rs.getString("team_type"));
                g.setStatus(rs.getString("status"));
                g.setUpdate_date(rs.getDate("update_date"));
                g.setDescription(rs.getString("description"));
                list.add(g);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<String> getAllGroupsCode(int userId) {
        String sql = "select * from Team ";
        if (userId != 0) {
            sql = sql + " t inner join Team_User tu on t.id = tu.team_id where tu.staff_id  = " + userId;
        }
        List<String> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(rs.getString("code"));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Group> getAllBAGroups() {
        String sql = "select t.*, u.first_name, u.middle_name, u.last_name\n"
                + " from Team t inner join User u on t.manager_id = u.id where t.team_type like 'BA'";
        List<Group> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Group g = new Group();
                g.setId(rs.getInt("id"));
                g.setCode(rs.getString("code"));
                g.setName(rs.getString("name"));
                User u = new User();
                u.setFirstname(rs.getString("first_name"));
                u.setMiddlename(rs.getString("middle_name"));
                u.setLastname(rs.getString("last_name"));
                g.setManager(u);

                g.setParent_team_id(rs.getInt("parent_team_id"));
                g.setTeam_type(rs.getString("team_type"));
                g.setStatus(rs.getString("status"));
                g.setUpdate_date(rs.getDate("update_date"));
                g.setDescription(rs.getString("description"));
                list.add(g);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<User> getAllTeamLeader() {
        List<User> list = new ArrayList<>();
        String sql = "select u.id, u.first_name, u.middle_name, u.last_name from Team_User tu inner join User u\n"
                + "on tu.staff_id = u.id\n"
                + "where tu.project_role like 'Manager'";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setFirstname(rs.getString("first_name"));
                u.setMiddlename(rs.getString("middle_name"));
                u.setLastname(rs.getString("last_name"));
                list.add(u);
            }
            st.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public static void main(String[] args) {
        GroupDAO g = new GroupDAO();
        System.out.println(g.getAllGroupByUserId(131));
    }
}
