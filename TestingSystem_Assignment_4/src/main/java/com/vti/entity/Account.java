package com.vti.entity;

import java.util.Date;

public class Account {
    private int accountId;
    private String email;
    private String username;
    private String fullName;
    private String gender;
    private Department department;
    private Position position;
    private Date createDate;
    private Group[] groups;

    public Account() {
    }
    public Account(int accountId, String email, String username, String firstName, String lastName) {
        this.accountId = accountId;
        this.email = email;
        this.username = username;
        this.fullName = firstName + " " + lastName;
    }
    public Account(int accountId, String email, String username, String firstName, String lastName, Position position) {
        this.accountId = accountId;
        this.email = email;
        this.username = username;
        this.fullName = firstName + " " + lastName;
        this.position = position;
        this.createDate = new Date();
    }
    public Account(int accountId, String email, String username, String firstName, String lastName, Position position, Date createDate) {
        this.accountId = accountId;
        this.email = email;
        this.username = username;
        this.fullName = firstName + " " + lastName;
        this.position = position;
        this.createDate = createDate;
    }
    public int getAccountId() {
        return accountId;
    }

    public String getEmail() {
        return email;
    }

    public String getUsername() {
        return username;
    }

    public String getFullName() {
        return fullName;
    }

    public String getGender() {
        return gender;
    }

    public Department getDepartment() {
        return department;
    }

    public Position getPosition() {
        return position;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public Group[] getGroups() {
        return groups;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public void setGroups(Group[] groups) {
        this.groups = groups;
    }
}
