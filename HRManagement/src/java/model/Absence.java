/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author ZenBook
 */
public class Absence {

    private int id;
    private String title;
    private User staff;
    private Group team;
    private Date startDate;
    private Date endDate;
    private int duration;
    private Date requestDate;
    private String status;
    private String type;

    public Absence() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public User getStaff() {
        return staff;
    }

    public void setStaff(User staff) {
        this.staff = staff;
    }

    public Group getTeam() {
        return team;
    }

    public void setTeam(Group team) {
        this.team = team;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public Date getStartDate() {
        return startDate;
    }

    public String getDMYRequestDate() {
        return new DateConvert(this.requestDate).getDMY();
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public String getDMYStartDate() {
        return new DateConvert(this.startDate).getDMY();
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getDMYEndDate() {
        return new DateConvert(this.endDate).getDMY();
    }

    public Date getRequestDate() {
        return requestDate;
    }

    public void setRequestDate(Date requestDate) {
        this.requestDate = requestDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "Absence{" + "id=" + id + ", title=" + title + ", staff=" + staff + ", team=" + team + ", startDate=" + startDate + ", endDate=" + endDate + ", duration=" + duration + ", requestDate=" + requestDate + ", status=" + status + ", type=" + type + '}';
    }

}
