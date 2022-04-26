/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author ZenBook
 */
public class SupportType {
    private int id;
    private String name;
    private Group in_charge_team;
    private String email;
    private String status;
    private String des;

    public SupportType() {
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

    public Group getIn_charge_team() {
        return in_charge_team;
    }

    public void setIn_charge_team(Group in_charge_team) {
        this.in_charge_team = in_charge_team;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    @Override
    public String toString() {
        return "SupportType{" + "id=" + id + ", name=" + name + ", in_charge_team=" + in_charge_team + ", email=" + email + ", status=" + status + ", des=" + des + '}';
    }
}
