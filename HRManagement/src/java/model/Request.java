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
public class Request {

    private int id;
    private Date requestDate;
    private String title;
    private SupportType supportType;
    private User inchargeStaff;
    private String status;
    private Date updatedDate;
    private int star;
    private String comment;
    private User raisedStaff;
    private String des;

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Request() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public Date getRequestDate() {
        return requestDate;
    }
    
    public String getDMYRequestDate() {
        return new DateConvert(this.requestDate).getDMY();
    }

    public void setRequestDate(Date requestDate) {
        this.requestDate = requestDate;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public SupportType getSupportType() {
        return supportType;
    }

    public void setSupportType(SupportType supportType) {
        this.supportType = supportType;
    }

    public User getInchargeStaff() {
        return inchargeStaff;
    }

    public void setInchargeStaff(User inchargeStaff) {
        this.inchargeStaff = inchargeStaff;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getUpdatedDate() {
        return updatedDate;
    }
    
    public String getDMYUpdatedDate() {
        return new DateConvert(this.updatedDate).getDMY();
    }

    public void setUpdatedDate(Date updatedDate) {
        this.updatedDate = updatedDate;
    }

    public User getRaisedStaff() {
        return raisedStaff;
    }

    public void setRaisedStaff(User raisedStaff) {
        this.raisedStaff = raisedStaff;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    @Override
    public String toString() {
        return "Request{\n" + "id=" + id + ", \nrequestDate=" + requestDate + ", \ntitle=" + title + ", \nsupportType=" + supportType + ", \ninchargeStaff=" + inchargeStaff + ", \nstatus=" + status + ", \nupdatedDate=" + updatedDate + ", \nstar=" + star + ", \ncomment=" + comment + ", \nraisedStaff=" + raisedStaff + ", \ndes=" + des + "}\n\n";
    }

}
