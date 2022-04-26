/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.util.List;

/**
 *
 * @author Minh Hieu Pham
 */
public class Group {

    private int id;
    private String code;
    private String name;
    private User manager;
    private List<User> members;
    private int parent_team_id;
    private String parent_team_code;
    private String team_type;
    private String status;
    private Date update_date;
    private String description;

    public Group() {
    }

    public Group(int id, String code, String name, User manager, List<User> members, int parent_team_id, String team_type, String status, Date update_date, String description) {
        this.id = id;
        this.code = code;
        this.name = name;
        this.manager = manager;
        this.members = members;
        this.parent_team_id = parent_team_id;
        this.team_type = team_type;
        this.status = status;
        this.update_date = update_date;
        this.description = description;
    }

    public String getParent_team_code() {
        return parent_team_code;
    }

    public void setParent_team_code(String parent_team_code) {
        this.parent_team_code = parent_team_code;
    }

    public List<User> getMembers() {
        return members;
    }

    public void setMembers(List<User> members) {
        this.members = members;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public User getManager() {
        return manager;
    }

    public void setManager(User manager) {
        this.manager = manager;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getParent_team_id() {
        return parent_team_id;
    }

    public void setParent_team_id(int parent_team_id) {
        this.parent_team_id = parent_team_id;
    }

    public String getTeam_type() {
        return team_type;
    }

    public void setTeam_type(String team_type) {
        this.team_type = team_type;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getUpdate_date() {
        return update_date;
    }

    public void setUpdate_date(Date update_date) {
        this.update_date = update_date;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Group{" + "id=" + id + ", code=" + code + ", name=" + name + ", manager=" + manager + ", members=" + members + ", parent_team_id=" + parent_team_id + ", team_type=" + team_type + ", status=" + status + ", update_date=" + update_date + ", description=" + description + '}';
    }

}
