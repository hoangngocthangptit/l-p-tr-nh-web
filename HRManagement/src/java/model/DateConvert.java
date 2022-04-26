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
public class DateConvert {

    private Date date;
    private String str;
    private String dd;
    private String mm;
    private String yyyy;
    private String hh;

    public DateConvert() {
    }

    public DateConvert(Date str) {
        String[] ss = str.toString().split(" ");
        String[] s = ss[0].split("-");
        this.yyyy = s[0];
        this.mm = s[1];
        this.dd = s[2];
        this.str = str.toString();
    }
    
    public DateConvert(String str) {
        String[] ss = str.toString().split(" ");
        String[] s = ss[0].split("-");
        this.yyyy = s[0];
        this.mm = s[1];
        this.dd = s[2];
        this.str = str.toString();
    }

    public String getYMD() {
        return yyyy + '/' + mm + '/' + dd;
    }

    public String getMDY() {
        return mm + '/' + dd + '/' + yyyy;
    }
    
    public String getDMY() {
        return dd + '/' + mm + '/' + yyyy;
    }

    public void setDateFromDMY(String str) {
        String[] ss = str.split(" ");
        String[] s = ss[0].split("-");
        this.dd = s[0];
        this.mm = s[1];
        this.yyyy = s[2];
    }

    public String getDate() {
        return this.str;
    }

    @Override
    public String toString() {
        return dd + '-' + mm + '-' + yyyy;
    }

    public static void main(String[] args) {
        DateConvert d = new DateConvert("2020-03-01 00:00:00");
        System.out.println(d.toString());
        System.out.println(d.getDate());
    }

}
