/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author nghie
 */
public class Setting {

    int id;
    String type;
    int valueid;
    String value;
    int order;
    String status;
    String note;

    public Setting() {
    }

    public Setting(int id, String type, int valueid, String value, int order, String status, String note) {
        this.id = id;
        this.type = type;
        this.valueid = valueid;
        this.value = value;
        this.order = order;
        this.status = status;
        this.note = note;
    }

    public Setting(int valueid, String value) {
        this.valueid = valueid;
        this.value = value;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getValueid() {
        return valueid;
    }

    public void setValueid(int valueid) {
        this.valueid = valueid;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public int getOrder() {
        return order;
    }

    public void setOrder(int order) {
        this.order = order;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}
