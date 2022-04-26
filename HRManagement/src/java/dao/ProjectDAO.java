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
import model.Project;
import model.Resource;
import model.User;

/**
 *
 * @author nghie
 */
public class ProjectDAO extends DBContext {

    public List<Project> getAllProject(String code, String name, String group, String manager, String status, int staffId) {
        List<Project> list = new ArrayList<>();
        String sql = " FROM Project p\n"
                + "left join (select * from Resource where resourceRole = 'PM') r on p.projectCode = r.projectCode\n"
                + "left join User u on r.staffId = u.id \n"
                + "left join Team t on p.teamId = t.id ";
        boolean needAnd = false;
        if (staffId != 0) {
            sql = "SELECT * " + sql + " where p.projectCode in ( SELECT p.projectCode FROM Project p "
                    + "left join Team t on p.teamId = t.id "
                    + "left join Team_User tu on t.id = tu.team_id where  tu.staff_id = ? or t.manager_id = ? ) ";
        } else {
            sql = "SELECT * " + sql;
        }
        if (code != null || name != null || group != null || manager != null || status != null) {
            sql = sql + (sql.contains("where") ? " and " : " where ");
        }
        if (code != null) {
            sql = sql + "p.projectCode like ?";
            needAnd = true;
        }
        if (name != null) {
            sql = sql + (needAnd ? "and " : "") + "p.projectName like ? ";
            needAnd = true;
        }
        if (group != null) {
            sql = sql + (needAnd ? "and " : "") + "t.code = ? ";
            needAnd = true;
        }
        if (manager != null) {
            sql = sql + (needAnd ? "and " : "") + "u.id = ? ";
            needAnd = true;
        }
        if (status != null) {
            sql = sql + (needAnd ? "and " : "") + "p.status = ? ";
        }
        System.out.println(sql);
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            int i = 1;
            if (staffId != 0) {
                st.setInt(i++, staffId);
                st.setInt(i++, staffId);
            }
            if (code != null) {
                st.setString(i++, "%" + code + "%");
            }
            if (name != null) {
                st.setString(i++, "%" + name + "%");
            }
            if (group != null) {
                st.setString(i++, group);
            }
            if (manager != null) {
                int id = Integer.parseInt(manager);
                st.setInt(i++, id);
            }
            if (status != null) {
                st.setString(i++, status);
            }
            ResultSet rs = st.executeQuery();
            Project project = null;
            List<String> names = new ArrayList<>();
            while (rs.next()) {
                String projectCode = rs.getString("projectCode");
                if (project == null || !project.getProjectCode().equals(projectCode)) {
                    if (project != null) {
                        project.setManagers(names);
                        list.add(project);
                    }
                    names = new ArrayList<>();
                    project = new Project();
                    project.setProjectCode(projectCode);
                    project.setTeamCode(rs.getString("code"));
                    project.setProjectName(rs.getString("projectName"));
                    project.setStartDate(rs.getDate("startDate"));
                    project.setEndDate(rs.getDate("endDate"));
                    project.setStatus(rs.getString("status"));
                }
                String firstname = rs.getString("first_name");
                String midname = rs.getString("middle_name");
                String lastname = rs.getString("last_name");
                if (firstname != null && midname != null && lastname != null) {
                    names.add((firstname + " " + midname + " " + lastname).replaceAll("\\s+", " "));
                }
            }
            if (project != null) {
                project.setManagers(names);
                list.add(project);
            }

            return list;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }
    }

    public List<User> getAllManagerGroup(int userId) {
        List<User> list = new ArrayList<>();
        String sql = "SELECT distinct u.*  FROM Project p\n"
                + "left join Resource r on r.projectCode = p.projectCode\n"
                + "left join User u on r.staffId = u.id \n"
                + "where r.resourceRole = 'PM' ";
        System.out.println(sql);
        if (userId != 0) {
            sql = sql + "and u.id in (select staff_id from Team_User where "
                    + "team_id in (select team_id from Team_User where staff_id = " + userId + "))";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            System.out.println(sql + "\n");
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

    public Project getProjectByCode(String code) {
        List<Project> list = new ArrayList<>();
        String sql = " select * from Project p\n"
                + "left join (select * from Resource where resourceRole = 'PM' ) r on p.projectCode = r.projectCode\n"
                + "left join User u on r.staffId = u.id\n"
                + "left join Team t on t.id = p.teamId\n"
                + "where p.projectCode = ?  ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, code);
            ResultSet rs = st.executeQuery();
            Project project = null;
            List<String> names = new ArrayList<>();
            while (rs.next()) {
                String projectCode = rs.getString("projectCode");
                if (project == null || !project.getProjectCode().equals(projectCode)) {
                    if (project != null) {
                        project.setManagers(names);
                        list.add(project);
                    }
                    names = new ArrayList<>();
                    project = new Project();
                    project.setProjectCode(projectCode);
                    project.setTeamCode(rs.getString("code"));
                    project.setProjectName(rs.getString("projectName"));
                    project.setStartDate(rs.getDate("startDate"));
                    project.setEndDate(rs.getDate("endDate"));
                    project.setStatus(rs.getString("status"));
                    project.setDescription(rs.getString("description"));
                }
                String firstname = rs.getString("first_name");
                String midname = rs.getString("middle_name");
                String lastname = rs.getString("last_name");
                if (firstname != null && midname != null && lastname != null) {
                    names.add((firstname + " " + midname + " " + lastname).replaceAll("\\s+", " "));
                }
            }
            if (project != null) {
                project.setManagers(names);
                list.add(project);
            }
            //System.out.println(sql);
            if (list.size() > 0) {
                return list.get(0);
            }
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }
        return null;
    }

    public boolean projectCodeExist(String code) {
        String sql = " select * from Project p\n"
                + "where p.projectCode = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, code);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
        }
        return false;
    }

    public void addProject(Project project) {
        String sql = "insert into Project (projectCode, teamId, projectName, startDate, endDate, status, description)\n"
                + "values (?,(select id from Team where code = ?), ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, project.getProjectCode());
            st.setString(2, project.getTeamCode());
            st.setString(3, project.getProjectName());
            st.setDate(4, project.getStartDate());
            st.setDate(5, project.getEndDate());
            st.setString(6, project.getStatus());
            st.setString(7, project.getDescription());
            st.executeUpdate();
            addResourceDefaule(project);
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    private void addResourceDefaule(Project project) {
        String sql = "insert into Resource (staffId, resourceRole, fromDate, toDate, percentOfEffort, projectCode)\n"
                + "values ((select manager_id from Team where code = ?), ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, project.getTeamCode());
            st.setString(2, "PM");
            st.setDate(3, project.getStartDate());
            st.setDate(4, project.getEndDate());
            st.setDouble(5, 0);
            st.setString(6, project.getProjectCode());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void editProject(Project project, String code) {
        if (code.equals(project.getProjectCode())) {
            updateProject(project, code);
        } else {
            addProject(project);
            changeResource(code, project.getProjectCode());
            deleteProject(code);
        }
    }

    private void updateProject(Project project, String code) {
        String sql = "update Project\n"
                + "set TeamId =  (select id from Team where code = ? ), projectName = ?,\n"
                + "startDate = ?, endDate = ?,\n"
                + "status = ?, Description = ?\n"
                + "where projectCode = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, project.getTeamCode());
            st.setString(2, project.getProjectName());
            st.setDate(3, project.getStartDate());
            st.setDate(4, project.getEndDate());
            st.setString(5, project.getStatus());
            st.setString(6, project.getDescription());
            st.setString(7, code);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    private void deleteProject(String code) {
        String sql = "delete from Project where projectCode = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, code);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    private void changeResource(String codeOld, String codeNew) {
        String sql = "update Resource set projectCode = ?\n"
                + "where projectCode = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, codeNew);
            st.setString(2, codeOld);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Resource> getAllResourceByCode(String code) {
        List<Resource> list = new ArrayList<>();
        String sql = "select * from Resource r\n"
                + "inner join User u on r.staffId = u.id\n"
                + "where projectCode = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, code);
            System.out.println(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Resource resource = new Resource();
                String firstname = rs.getString("first_name");
                String midname = rs.getString("middle_name");
                String lastname = rs.getString("last_name");
                if (firstname != null && midname != null && lastname != null) {
                    resource.setStaffName((firstname + " " + midname + " " + lastname).replaceAll("\\s+", " "));
                }
                resource.setResourceRole(rs.getString("resourceRole"));
                resource.setFromDate(rs.getDate("fromDate"));
                resource.setToDate(rs.getDate("toDate"));
                resource.setPercentOfEffort(rs.getDouble("percentOfEffort"));
                list.add(resource);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public List<Project> getAllProjectForTimesheet() {
        List<Project> list = new ArrayList<>();
        String sql = " select * from Team_User tu inner join Project p\n"
                + " on tu.team_id = p.teamId\n"
                + " where tu.staff_id = 131";
        try {

            PreparedStatement st = connection.prepareStatement(sql);

            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Project project = new Project();
                project.setProjectCode(rs.getString("projectCode"));
                project.setProjectName(rs.getString("projectName"));
                project.setStartDate(rs.getDate("startDate"));
                project.setEndDate(rs.getDate("endDate"));
                project.setStatus(rs.getString("status"));
                list.add(project);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
            return null;
        }
    }

    public static void main(String[] args) {
        ProjectDAO p = new ProjectDAO();
        System.out.println(p.getAllManagerGroup(0));
    }
}
