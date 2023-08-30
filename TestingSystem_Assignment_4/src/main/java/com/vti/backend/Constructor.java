package com.vti.backend;

import com.vti.entity.Department;
import com.vti.entity.Account;
import com.vti.entity.Position;
import com.vti.entity.Group;

import java.util.Date;

public class Constructor {
    public void question1() {
        Department department1 = new Department();
        System.out.println(department1);

        Department department2 = new Department("Sales");
        System.out.println(department2);
    }

    public void question2() {
        Account account1 = new Account();
        System.out.println(account1);

        Account account2 = new Account(1, "kraudust@gmail.com", "kraudust", "Hung", "Pham");
        System.out.println(account2);

        Position position1 = new Position();
        Position position2 = new Position();
        Account account3 = new Account(2, "hihihaha@gmail.com", "hihihaha", "Tan", "Pham", position1);
        System.out.println(account3);

        Account account4 = new Account(3, "javapython@outlook.com", "javapython", "Vinh", "Nguyen", position2, new Date());
        System.out.println(account4);
    }
    public void question3() {
        Group group1 = new Group();
        System.out.println(group1);

        Account account1 = new Account(1, "kraudust@gmail.com", "kraudust", "Hung", "Pham");
        Account account2 = new Account(2, "hihihaha@gmail.com", "hihihaha", "Tan", "Pham");
        Account account3 = new Account(3, "javapython@outlook.com", "javapython", "Vinh", "Nguyen");
        Account[] accounts = {account1, account2, account3};
        Group group2 = new Group("Sales", account1, accounts, new Date());
    }
}
