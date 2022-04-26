/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.text.SimpleDateFormat;

/**
 *
 * @author nghie
 */
public class Resource {
    String staffName;
    String resourceRole;
    Date fromDate;
    Date toDate;
    double percentOfEffort;

    public Resource() {
    }   

    public Resource(String staffName, String resourceRole, Date fromDate, Date toDate, double percentOfEffort) {
        this.staffName = staffName;
        this.resourceRole = resourceRole;
        this.fromDate = fromDate;
        this.toDate = toDate;
        this.percentOfEffort = percentOfEffort;
    }

    public String getStaffName() {
        return staffName;
    }

    public void setStaffName(String staffName) {
        this.staffName = staffName;
    }

    public String getResourceRole() {
        return resourceRole;
    }

    public void setResourceRole(String resourceRole) {
        this.resourceRole = resourceRole;
    }

    public Date getFromDate() {
        return fromDate;
    }

    public void setFromDate(Date fromDate) {
        this.fromDate = fromDate;
    }

    public Date getToDate() {
        return toDate;
    }

    public void setToDate(Date toDate) {
        this.toDate = toDate;
    }

    public double getPercentOfEffort() {
        return percentOfEffort;
    }

    public void setPercentOfEffort(double percentOfEffort) {
        this.percentOfEffort = percentOfEffort;
    }
    
    public String getFromDateFormat() {
        SimpleDateFormat date = new SimpleDateFormat("dd/MM/yyyy");
        return date.format(fromDate);
    }
    
    public String getToDateFormat() {
        SimpleDateFormat date = new SimpleDateFormat("dd/MM/yyyy");
        return date.format(toDate);
    }
}
