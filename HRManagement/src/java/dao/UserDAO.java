/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Date;
import model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Email;
import model.Hash;

/**
 *
 * @author ZenBook
 */
public class UserDAO extends DBContext {

    //Tien - Register
    public void register(String firstname, String middlename, String lastname, String email, String mobile, String gender, String username, String password) {
        String sql = "insert into User (username, password, first_name, middle_name, last_name, email, gender, role, mobile)\n"
                + "values (?, ?, ?, ?, ?, ?, ?, ?, ?);";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, new Hash().HashPassword(password));
            ps.setString(3, firstname);
            ps.setString(4, middlename);
            ps.setString(5, lastname);
            ps.setString(6, email);
            ps.setString(7, gender);
            ps.setString(8, "Staff");
            ps.setString(9, mobile);
            ps.executeUpdate();
            new Email().verifiedAccount(email, new Hash().HashPassword(username));
        } catch (SQLException e) {
        }
    }

    public User usernameExist(String username) {
        String sql
                = "select * from User where username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                return user;
            }
            return null;
        } catch (SQLException e) {
            return null;
        }
    }

    public User emailExist(String email) {
        String sql
                = "select * from User where email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                return user;
            }
            return null;
        } catch (SQLException e) {
            return null;
        }
    }

    public User mobileExist(String mobile) {
        String sql
                = "select * from User where mobile = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, mobile);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUsername(rs.getString("mobile"));
                return user;
            }
            return null;
        } catch (SQLException e) {
            return null;
        }
    }

    public void verifyUserById(int id) {
        String sql = "update User \n"
                + "set status = ?\n"
                + "where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, "Registered");
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public User getManagerByRequestId(int id) {
        String sql = "select \n"
                + "	u.id,\n"
                + "    u.username\n"
                + "from Request r inner join Support_Type st on r.support_type_id = st.id\n"
                + "inner join Team t on t.id = st.in_charge_team_id\n"
                + "inner join User u on t.manager_id = u.id\n"
                + "where st.status != 'inactive'\n"
                + "and r.id = ?;";

        User u = new User();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;

    }

    public int getManagerIdBySupportTypeId(int spId) {
        String sql = "SELECT \n"
                + "	t.manager_id\n"
                + "FROM Support_Type st inner join Team t\n"
                + "on st.in_charge_team_id = t.id\n"
                + "where st.id = ?;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, spId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return rs.getInt("manager_id");
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return 0;
    }

    //new commits
    public User getUserInformation(int id) {
        String sql
                = "select u.*, t.code  from User u \n"
                + "left join Team_User tu on u.id = tu.staff_id \n"
                + "left join Team t on t.id = tu.team_id \n"
                + "where u.id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User user = new User();
                GroupDAO g = new GroupDAO();
                user.setId(rs.getInt("id"));
                user.setGroup_code(g.getAllGroupFromUserId(id));
                user.setUsername(rs.getString("username"));
                user.setFirstname(rs.getNString("first_name"));
                user.setMiddlename(rs.getNString("middle_name"));
                user.setLastname(rs.getNString("last_name"));
                user.setBirthdate(rs.getDate("birthdate"));
                user.setEmail(rs.getString("email"));
                user.setMobile(rs.getString("mobile"));
                user.setGender(rs.getString("gender"));
                user.setRole(rs.getString("role"));
                user.setStatus(rs.getString("status"));
                user.setNote(rs.getString("note"));
                user.setGroup_code(rs.getString("code"));
                return user;
            }
            return null;
        } catch (SQLException e) {
            return null;
        }
    }

    public User getUserUsernameById(int id) {
        String sql = "SELECT * FROM User where id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                return user;
            }
            st.close();
            return null;
        } catch (SQLException e) {
            return null;
        }
    }

    public void DeleteAllGroupCode(int UserId) {
        String sql = "delete from Team_User where staff_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, UserId);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Delete Error: " + e);
        }
    }

    public void AddGroupCode(int UserId, String GroupCode) {
        String sql = "insert into Team_User (staff_id, team_id) value (?, (select id from Team where code = ?));";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, UserId);
            ps.setString(2, GroupCode);
            ps.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public void UpdateGroupCode(String GroupCode, int UserId) {
        DeleteAllGroupCode(UserId);
        if (!GroupCode.equals("None")) {
            AddGroupCode(UserId, GroupCode);
        }
    }

    public void UpdateMobile(String mobile, int UserId) throws NumberFormatException {
        String sql = "update User \n"
                + "set mobile = ?\n"
                + "where id = ?";
        try {
            Integer.parseInt(mobile);
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, mobile);
            ps.setInt(2, UserId);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void UpdateEmail(String email, int UserId) {
        String sql = "update User \n"
                + "set email = ?\n"
                + "where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.setInt(2, UserId);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void UpdateUsername(String username, int UserId) {
        String sql = "update User \n"
                + "set username = ?\n"
                + "where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setInt(2, UserId);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void UpdateUserInformation(User user) {
        String sql
                = "update User\n"
                + "set first_name = ?, middle_name = ?, last_name = ?,\n"
                + "role = ?, gender = ?, status = ?, note = ?\n"
                + "where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user.getFirstname());
            ps.setString(2, user.getMiddlename());
            ps.setString(3, user.getLastname());
            ps.setString(4, user.getRole());
            ps.setString(5, user.getGender());
            ps.setString(6, user.getStatus());
            ps.setString(7, user.getNote());
            ps.setInt(8, user.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public User login(String user, String pass) {
        String sql = "select * from User where username = ? and password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            st.setString(2, new Hash().HashPassword(pass));
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setPassword(rs.getString("password"));
                u.setFirstname(rs.getString("first_name"));
                u.setMiddlename(rs.getString("middle_name"));
                u.setLastname(rs.getString("last_name"));
                u.setEmail(rs.getString("email"));
                u.setMobile(rs.getString("mobile"));
                u.setBirthdate(rs.getDate("birthdate"));
                u.setGender(rs.getString("gender"));
                u.setRole(rs.getString("role"));
                u.setStatus(rs.getString("status"));
                u.setNote(rs.getString("note"));
                u.setAva(rs.getString("avata"));
                st.close();
                return u;
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<User> searchByOption(String option, String str, int mid, String gr_code, String gender, String status) {
        List<User> list = new ArrayList<>();
        String sql = "select * from User u inner join Team_User tu on u.id = tu.staff_id\n"
                + "inner join Team t on tu.team_id = t.id  where manager_id = ?";
        try {
            if (gr_code != null && !gr_code.equals("")) {
                sql += " and tu.team_id = " + gr_code;
            }
        } catch (Exception e) {
        }

        if (gender != null && !gender.equals("select") && !gender.equals("")) {
            sql += " and u.gender = '" + gender + "'";
        }
        if (status != null && !status.equals("select") && !status.equals("")) {
            sql += " and u.status = '" + status + "'";
        }
        if (str != null && !str.equals("")) {
            switch (option) {
                case "username":
                    sql += " and username like '%" + str + "%'";
                    break;
                case "full name":
                    sql += " and concat(u.last_name,\" \" , u.middle_name,\" \", \n"
                            + "u.first_name) like '%" + str + "%'";
                    break;
                case "email":
                    sql += " and email like '" + str + "'";
                    break;
                case "mobile":
                    sql += " and mobile like '" + str + "'";
                    break;
            }

        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, mid);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setGroup_code(rs.getString("team_id"));
                u.setUsername(rs.getString("username"));
                u.setFirstname(rs.getString("first_name"));
                u.setMiddlename(rs.getString("middle_name"));
                u.setLastname(rs.getString("last_name"));
                u.setGender(rs.getString("gender"));
                u.setEmail(rs.getString("email"));
                u.setMobile(rs.getString("mobile"));
                u.setStatus(rs.getString("status"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        System.out.println(sql);
        return list;
    }

    public List<User> getAllUserInfo(String option, String str, int mid, String gr_code, String gender, String status) {
        List<User> list = new ArrayList<>();
        String sql = "select * from User u left join Team_User tu on u.id = tu.staff_id\n"
                + "left join Team t on tu.team_id = t.id where 1=1";
        try {
            if (gr_code != null && !gr_code.equals("")) {
                sql += " and tu.team_id = " + gr_code;
            }
        } catch (Exception e) {
        }

        if (gender != null && !gender.equals("select") && !gender.equals("")) {
            sql += " and u.gender = '" + gender + "'";
        }
        if (status != null && !status.equals("select") && !status.equals("")) {
            sql += " and u.status = '" + status + "'";
        }
        if (str != null && !str.equals("")) {
            switch (option) {
                case "username":
                    sql += " and username like '%" + str + "%'";
                    break;
                case "full name":
                    sql += " and concat(u.last_name,\" \" , u.middle_name,\" \", \n"
                            + "u.first_name) like '%" + str + "%'";
                    break;
                case "email":
                    sql += " and email like '" + str + "'";
                    break;
                case "mobile":
                    sql += " and mobile like '" + str + "'";
                    break;
            }

        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setGroup_code(rs.getString("team_id"));
                u.setUsername(rs.getString("username"));
                u.setFirstname(rs.getString("first_name"));
                u.setMiddlename(rs.getString("middle_name"));
                u.setLastname(rs.getString("last_name"));
                u.setGender(rs.getString("gender"));
                u.setEmail(rs.getString("email"));
                u.setMobile(rs.getString("mobile"));
                u.setStatus(rs.getString("status"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        System.out.println(sql);
        return list;
    }

    public List<User> getAllUserByGroupId(int id) {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * \n"
                + "FROM HR_Management.Team t \n"
                + "	inner join Team_User ut on t.id = ut.team_id\n"
                + "	inner join User u on ut.staff_id = u.id\n"
                + "where t.manager_id != ut.staff_id \n"
                + "    and u.status != 'inactive'\n"
                + "	and t.id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt(13));
                u.setUsername(rs.getString("username"));
                u.setFirstname(rs.getString("first_name"));
                u.setMiddlename(rs.getString("middle_name"));
                u.setLastname(rs.getString("last_name"));
                u.setEmail(rs.getString("email"));
                u.setMobile(rs.getString("mobile"));
                u.setGender(rs.getString("gender"));
                u.setRole(rs.getString("role"));
                u.setStatus(rs.getString("status"));
                u.setNote(rs.getString("note"));
                list.add(u);
            }
            return list;
        } catch (SQLException e) {
            return null;
        }
    }

    public List<User> getAllUserExceptStaffByGroupId(int id, int staffId) {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * \n"
                + "FROM HR_Management.Team t \n"
                + "	inner join Team_User ut on t.id = ut.team_id\n"
                + "	inner join User u on ut.staff_id = u.id\n"
                + "where t.manager_id != ut.staff_id \n"
                + "    and u.status != 'inactive'\n"
                + "	and t.id = ? and ut.staff_id != ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.setInt(2, staffId);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt(13));
                u.setUsername(rs.getString("username"));
                list.add(u);
            }
            return list;
        } catch (SQLException e) {
            return null;
        }
    }

    public List<User> getAllUserByRequestId(int id) {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM Request r \n"
                + "inner join Support_Type st on r.support_type_id = st.id\n"
                + "inner join Team t on  st.in_charge_team_id = t.id\n"
                + "inner join Team_User ut on t.id = ut.team_id\n"
                + "inner join User u on ut.staff_id = u.id\n"
                + "and u.status != 'inactive'\n"
                + "and r.id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt(28));
                u.setUsername(rs.getString("username"));
                list.add(u);
            }
            return list;
        } catch (SQLException e) {
            return null;
        }
    }

    public List<User> getAllUserExceptManagerByRequestId(int id) {
        List<User> list = new ArrayList<>();
        String sql = "SELECT \n"
                + "	u.id,\n"
                + "    u.username\n"
                + "FROM Request r \n"
                + "inner join Support_Type st on r.support_type_id = st.id\n"
                + "inner join Team t on  st.in_charge_team_id = t.id\n"
                + "inner join Team_User ut on t.id = ut.team_id\n"
                + "inner join User u on ut.staff_id = u.id\n"
                + "and u.status != 'inactive'\n"
                + "and r.id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                list.add(u);
            }
            return list;
        } catch (SQLException e) {
            return null;
        }
    }

    public List<User> getAllUserExceptStaffByRequestId(int id) {
        List<User> list = new ArrayList<>();
        String sql = "SELECT \n"
                + "	u.id, u.username\n"
                + "FROM Request r \n"
                + "inner join Support_Type st on r.support_type_id = st.id\n"
                + "inner join Team t on  st.in_charge_team_id = t.id\n"
                + "inner join Team_User ut on t.id = ut.team_id\n"
                + "inner join User u on ut.staff_id = u.id\n"
                + "where t.manager_id != ut.staff_id \n"
                + "and u.status != 'inactive'\n"
                + "and r.incharge_id != u.id\n"
                + "and r.id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                list.add(u);
            }
            return list;
        } catch (SQLException e) {
            return null;
        }
    }

    public List<User> getAllStaffByRole(String role) {
        List<User> list = new ArrayList<>();
        String sql = "select * from User where role = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, role);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    
    public void updateStatus(int id, String status) {
        String sql = "update User \n"
                + "set status = ?\n"
                + "where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void updateNote(int id, String note) {
        String sql = "update User \n"
                + "set note = ?\n"
                + "where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, note);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public User userNoteGetById(int id) {
        String sql = "select * from User where id = ?";
        User u = new User();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                u.setId(rs.getInt("id"));
                u.setNote(rs.getString("note"));
            }
        } catch (SQLException e) {
        }
        return u;
    }

    public List<User> getUserListByPage(List<User> list,
            int start, int end) {
        ArrayList<User> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public void changePassword(int id, String pass) {
        String sql = "update User set password = ? Where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, pass);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public boolean checkToChangePassword(int id, String pass) {
        String sql = "select * from User where id = ? and password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
        }
        return false;
    }

    public int checkToVerifyAccount(String code) {
        String sql = "select * from User where username = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, new Hash().RevertPassword(code));
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("id");
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public int checkToResetPassword(String username, String email) {
        String sql = "select * from User where username = ? and email = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("id");
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public List<User> getAllUsers() {
        List<User> list = new ArrayList<>();
        String sql = "select * from User";
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setFirstname(rs.getString("first_name"));
                u.setMiddlename(rs.getString("middle_name"));
                u.setLastname(rs.getString("last_name"));
                u.setGender(rs.getString("gender"));
                u.setEmail(rs.getString("email"));
                u.setMobile(rs.getString("mobile"));
                u.setRole(rs.getString("role"));
                u.setStatus(rs.getString("status"));
                list.add(u);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public boolean UpdateUserProfile(User user) {
        boolean f = false;
        String sql
                = "update User\n"
                + "set first_name = ?, mobile = ?,\n"
                + "gender = ?, birthdate = ? , avata = ?\n"
                + "where id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, user.getFirstname());
            ps.setString(2, user.getMobile());
            ps.setString(3, user.getGender());
            ps.setDate(4, user.getBirthdate());
            ps.setString(5, user.getAva());
            ps.setInt(6, user.getId());
            ps.executeUpdate();
            f = true;
            ps.close();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return f;
    }

    public void AddNewUser(String username, String firstname, String email, String mobile, String gender, String role , String password) {
        String sql = "insert into User (username, first_name, email, mobile, gender, role, password)\n"
                + "values (?, ?, ?, ?, ?, ? , ?);";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, firstname);
            ps.setString(3, email);
            ps.setString(4, mobile);
            ps.setString(5, gender);
            ps.setString(6, role);
            ps.setString(7, password);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public User managerGetByGroupId(int id) {
        String sql = "select u.* from User u \n"
                + "inner join Team t on t.manager_id = u.id\n"
                + "where t.id = ?";
        User u = new User();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setFirstname(rs.getString("first_name"));
                u.setMiddlename(rs.getString("middle_name"));
                u.setLastname(rs.getString("last_name"));
                return u;
            }

        } catch (SQLException e) {
        }
        return null;
    }

    public static void main(String[] args) {
        UserDAO u = new UserDAO();
        System.out.println(u.getUserInformation(135));
    }
    //DATA CREATION
//    Random r = new Random();
//
//    int ranNum(int to) {
//        return r.nextInt(to);
//    }
//
//    String firstName() {
//        String[] names = {"Acacia", "Adela", "Griselda", "Guinevere", "Hebe", "Imelda", "Jena",
//            "Brenna", "Bridget", "Cosima", "Cleopatra", "Daria", "Delwyn",
//            "Dilys", "Eira", "Farah", "Euphemia", "Fiona", "Keisha"};
//        return names[ranNum(names.length)];
//    }
//
//    String lastName() {
//        String[] names = {"Smith", "Jones", "Williams", "Taylor", "Brown", "Davies", "Evans",
//            "Wilson", "Thomas", "Johnson", "Roberts", "Robinson", "Thompson", "Wright",
//            "Walker", "White", "Edwards", "Hughes", "Green", "Hall", "Carney"};
//        return names[ranNum(names.length)];
//    }
//
//    String username(String first, String last) {
//        String username = (first.charAt(0) + "" + last.charAt(0) + "").toLowerCase();
//        String username1 = username;
//        int num = 0;
//        while (usernameExist(username1) != null) {
//            username1 = username + num;
//            num++;
//        }
//        return username1;
//    }
//
//    String email(String username) {
//        return username + "@gmail.com";
//    }
//
//    String password() {
//        String c = "qwertyuiopasdfghjklzxcvbnm";
//        String n = "1234567890";
//        String character = c + c.toUpperCase() + n;
//        String pass = "";
//        for (int i = 0; i < 8; i++) {
//            pass += character.charAt(ranNum(character.length()));
//        }
//        return pass;
//    }
//
//    String mobile() {
//        String character = "1234567890";
//        String pass = "0";
//        pass += character.charAt(ranNum(character.length() - 1));
//        for (int i = 1; i < 9; i++) {
//            pass += character.charAt(ranNum(character.length()));
//        }
//        return pass;
//    }
//
//    String gender() {
//        String[] names = {"Male", "Female", "Other"};
//        return names[ranNum(names.length)];
//    }
//
//    String birthdate() {
//        GregorianCalendar gc = new GregorianCalendar();
//        int year = 1960 + ranNum(50);
//        gc.set(gc.YEAR, year);
//        int dayOfYear = 1 + ranNum(gc.getActualMaximum(gc.DAY_OF_YEAR));
//        gc.set(gc.DAY_OF_YEAR, dayOfYear);
//        return gc.get(gc.YEAR) + "/" + (gc.get(gc.MONTH) + 1) + "/" + gc.get(gc.DAY_OF_MONTH);
//    }
//
//    String status() {
//        String[] names = {"Registered", "Verified", "Inactive"};
//        return names[ranNum(names.length)];
//    }
//
//    String role() {
//        String[] names = {"Admin", "Manager", "HR", "Staff", "Staff", "Staff", "Staff", "Staff", "Staff", "Staff", "Staff", "Staff",
//            "Staff", "Staff", "Staff", "Staff", "Staff", "Staff", "Staff", "Staff", "Staff", "Staff"};
//        return names[ranNum(names.length)];
//    }
//
//    void createNew() {
//        String firstname = firstName();
//        String lastname = lastName();
//        String username = username(firstname, lastname);
//        String sql = "insert into User (username, password, first_name, middle_name, last_name, email, gender, role, mobile, birthdate)\n"
//                + "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
//        try {
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ps.setString(1, username);
//            ps.setString(2, new Hash().HashPassword(password()));
//            ps.setString(3, firstname);
//            ps.setString(4, "");
//            ps.setString(5, lastname);
//            ps.setString(6, email(username));
//            ps.setString(7, gender());
//            ps.setString(8, role());
//            ps.setString(9, mobile());
//            ps.setString(10, birthdate());
//            ps.executeUpdate();
//        } catch (SQLException e) {
//        }
//    }
//
//    void updateStatus(int id) {
//        String sql = "update User\n"
//                + "set status = ?"
//                + "where id = ?;";
//        try {
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ps.setString(1, status());
//            ps.setInt(2, id);
//            ps.executeUpdate();
//        } catch (SQLException e) {
//        }
//    }
}
