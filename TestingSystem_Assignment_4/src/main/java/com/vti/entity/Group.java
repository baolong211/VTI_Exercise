package com.vti.entity;

import java.util.Date;

public class Group {
    private int groupId;
    private String groupName;
    private Account creator;
    private Date createDate;
    private Account[] accounts;
    public Group() {
    }
    public Group(String groupName, Account creator, Account[] accounts, Date createDate) {
        this.groupId = 0;
        this.groupName = groupName;
        this.creator = creator;
        this.accounts = accounts;
        this.createDate = createDate;
    }
    public Group(String groupName, Account creator, String[] usernames, Date createDate) {
        this.groupId = 0;
        this.groupName = groupName;
        this.creator = creator;
        this.accounts = new Account[usernames.length];
        for (int i = 0; i < usernames.length; i++) {
            this.accounts[i] = new Account();
            this.accounts[i].setUsername(usernames[i]);
        }
        this.createDate = createDate;
    }
    public int getGroupId() {
        return groupId;
    }

    public String getGroupName() {
        return groupName;
    }

    public Account getCreator() {
        return creator;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public Account[] getAccounts() {
        return accounts;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public void setCreator(Account creator) {
        this.creator = creator;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public void setAccounts(Account[] accounts) {
        this.accounts = accounts;
    }
}
