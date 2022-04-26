/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author Minh Hieu Pham
 */
public class Timesheet {
    private int id;
    private Date timesheetDate;
    private String timesheetTitle;
    private String projectCode;
    private String process;
    private double duration;
    private String workResult;
    private String status;
    private String rejectReason;
    private int in_charge_staff_id;

    public Timesheet() {
    }

    public Timesheet(int id, Date timesheetDate, String timesheetTitle, String projectCode, String process, double duration, String workResult, String status, String rejectReason, int in_charge_staff_id) {
        this.id = id;
        this.timesheetDate = timesheetDate;
        this.timesheetTitle = timesheetTitle;
        this.projectCode = projectCode;
        this.process = process;
        this.duration = duration;
        this.workResult = workResult;
        this.status = status;
        this.rejectReason = rejectReason;
        this.in_charge_staff_id = in_charge_staff_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getTimesheetDate() {
        return timesheetDate;
    }

    public void setTimesheetDate(Date timesheetDate) {
        this.timesheetDate = timesheetDate;
    }

    public String getTimesheetTitle() {
        return timesheetTitle;
    }

    public void setTimesheetTitle(String timesheetTitle) {
        this.timesheetTitle = timesheetTitle;
    }

    public String getProjectCode() {
        return projectCode;
    }

    public void setProjectCode(String projectCode) {
        this.projectCode = projectCode;
    }

    public String getProcess() {
        return process;
    }

    public void setProcess(String process) {
        this.process = process;
    }

    public double getDuration() {
        return duration;
    }

    public void setDuration(double duration) {
        this.duration = duration;
    }

    public String getWorkResult() {
        return workResult;
    }

    public void setWorkResult(String workResult) {
        this.workResult = workResult;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRejectReason() {
        return rejectReason;
    }

    public void setRejectReason(String rejectReason) {
        this.rejectReason = rejectReason;
    }

    public int getIn_charge_staff_id() {
        return in_charge_staff_id;
    }

    public void setIn_charge_staff_id(int in_charge_staff_id) {
        this.in_charge_staff_id = in_charge_staff_id;
    }
    
    
}
