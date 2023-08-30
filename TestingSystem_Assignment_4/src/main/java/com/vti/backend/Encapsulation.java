package com.vti.backend;

import com.vti.entity.Student;
public class Encapsulation {
    public void question1() {
        Student student1 = new Student("Long", "Phú Thọ");
        student1.setAcademicScore(2);
        System.out.println(student1);

        Student student2 = new Student("Tấn", "Vũng Tàu");
        student2.setAcademicScore(7);
        System.out.println(student2);

        Student student3 = new Student("Bảo", "Hà Nội");
        student3.setAcademicScore(9);
        System.out.println(student3);

        student1.plusScore(4);
    }
}
