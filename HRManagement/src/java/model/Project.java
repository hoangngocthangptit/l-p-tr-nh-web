/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author nghie
 */
public class Project {
    String projectCode;
    String teamCode;
    String projectName;
    Date startDate;
    Date endDate;
    String status;
    List<String> managers;
    String description;

    public Project(String projectCode, String teamCode, String projectName, Date startDate, Date endDate, String status, List<String> managerIds, String description) {
        this.projectCode = projectCode;
        this.teamCode = teamCode;
        this.projectName = projectName;
        this.startDate = startDate;
        this.endDate = endDate;
        this.status = status;
        this.managers = managerIds;
        this.description = description;
    }

    public Project() {
        managers = new  ArrayList<>();
    }

    public String getProjectCode() {
        return projectCode;
    }

    public void setProjectCode(String projectCode) {
        this.projectCode = projectCode;
    }

    public String getTeamCode() {
        return teamCode;
    }

    public void setTeamCode(String teamCode) {
        this.teamCode = teamCode;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public Date getStartDate() {
        return startDate;
    }
    
    public String getStartDateFormat() {
        SimpleDateFormat date = new SimpleDateFormat("dd/MM/yyyy");
        return date.format(startDate);
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }
    
    public String getEndDateFormat() {
        SimpleDateFormat date = new SimpleDateFormat("dd/MM/yyyy");
        return date.format(endDate);
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<String> getManagers() {
        return managers;
    }

    public void setManagers(List<String> managers) {
        this.managers = managers;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
}
