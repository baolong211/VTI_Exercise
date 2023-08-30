package com.vti.entity;

import java.util.Date;

public class Exam {
    private int examId;
    private String code;
    private String title;
    private CategoryQuestion[] categoryQuestion;
    private byte duration;
    private Account creator;
    private Date createDate;
    private Question[] questions;
    public int getExamId() {
        return examId;
    }

    public String getCode() {
        return code;
    }

    public String getTitle() {
        return title;
    }

    public CategoryQuestion[] getCategoryQuestion() {
        return categoryQuestion;
    }

    public byte getDuration() {
        return duration;
    }

    public Account getCreator() {
        return creator;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public Question[] getQuestions() {
        return questions;
    }

    public void setExamId(int examId) {
        this.examId = examId;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setCategoryQuestion(CategoryQuestion[] categoryQuestion) {
        this.categoryQuestion = categoryQuestion;
    }

    public void setDuration(byte duration) {
        this.duration = duration;
    }

    public void setCreator(Account creator) {
        this.creator = creator;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public void setQuestions(Question[] questions) {
        this.questions = questions;
    }
}
