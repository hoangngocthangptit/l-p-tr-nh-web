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
public class User {
    private int id;
    private String username;
    private String password;
    private String firstname;
    private String middlename;
    private String lastname;
    private Date birthdate;
    private String email;
    private String mobile;
    private String gender;
    private String status;
    private String role;
    private String note;
    private String group_code;
    private String ava;
    
    public User() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        String full = "";
        full += this.firstname;
        if (this.middlename != null) {
            full += ' ' + this.middlename;
        }
        full += ' ' + this.lastname;
        return full;
    }
    
    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getMiddlename() {
        return middlename;
    }

    public void setMiddlename(String middlename) {
        this.middlename = middlename;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(Date birthdate) {
        this.birthdate = birthdate;
    }

    public String getGroup_code() {
        return group_code;
    }

    public void setGroup_code(String group_code) {
        this.group_code = group_code;
    }

    public String getAva() {
        return ava;
    }

    public void setAva(String ava) {
        this.ava = ava;
    }

    @Override
    public String toString() {
        return "User{" + "id=" + id + ", username=" + username + ", password=" + password + ", firstname=" + firstname + ", middlename=" + middlename + ", lastname=" + lastname + ", birthdate=" + birthdate + ", email=" + email + ", mobile=" + mobile + ", gender=" + gender + ", status=" + status + ", role=" + role + ", note=" + note + ", group_code=" + group_code + ", ava=" + ava + '}';
    }
    
    

  

    public String getFullName(){
        return (firstname + " " + middlename + " " + lastname).replaceAll("\\s+", " ");
    }
    
}
