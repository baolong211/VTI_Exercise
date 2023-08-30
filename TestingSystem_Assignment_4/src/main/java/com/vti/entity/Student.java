package com.vti.entity;

public class Student {
    private int id;
    private String name;
    private String hometown;
    private double academicScore;
    public Student(String name, String hometown) {
        this.name = name;
        this.hometown = hometown;
        this.academicScore = 0;
    }
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getHometown() {
        return hometown;
    }

    public double getAcademicScore() {
        return academicScore;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setHometown(String hometown) {
        this.hometown = hometown;
    }

    public void setAcademicScore(double academicScore) {
        this.academicScore = academicScore;
    }
    public void plusScore(double score) {
        this.academicScore += score;
    }
    public void printInfo() {
        System.out.println("Name: " + name);
        System.out.println("Hometown: " + hometown);
        System.out.println("Grade: " + academicScore);

        if (academicScore < 4.0) {
            System.out.println("Academic Performance: Weak");
        } else if (academicScore >= 4.0 && academicScore < 6.0) {
            System.out.println("Academic Performance: Average");
        } else if (academicScore >= 6.0 && academicScore < 8.0) {
            System.out.println("Academic Performance: Good");
        } else {
            System.out.println("Academic Performance: Excellent");
        }
    }
}
