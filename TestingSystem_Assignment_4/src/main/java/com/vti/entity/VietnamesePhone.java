package com.vti.entity;

import java.util.ArrayList;

public class VietnamesePhone {
    public VietnamesePhone() {
    }

    public void insertContact(String name, String phone) {
        System.out.println("Insert new contact with " + name + " and phone " + phone);
    }

    public void removeContact(String name) {
        System.out.println("Removing contact with name :" + name);
    }

    public void updateContact(String name, String newPhone) {
        System.out.println("Update contact " + name + " with new phone " + newPhone);
    }

    public void searchContact(String name) {
        System.out.println("Search contact " + name + "...");
    }
}
