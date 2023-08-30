package com.vti.entity;

public class Department {
    public int departmentId;
    public String departmentName;
    public Department() {
        this.departmentId = 0;
        this.departmentName = "";
    }
    public Department(String departmentName) {
        this.departmentId = 0;
        this.departmentName = departmentName;
    }
    public int getDepartmentId() {
        return departmentId;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }
}
