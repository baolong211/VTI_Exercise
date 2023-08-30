package com.vti.entity;

import java.util.Date;

public class Question {
    private int questionId;
    private String content;
    private CategoryQuestion categoryQuestion;
    private TypeQuestion typeQuestion;
    private Account creator;
    private Date createDate;
    public int getQuestionId() {
        return questionId;
    }

    public String getContent() {
        return content;
    }

    public CategoryQuestion getCategoryQuestion() {
        return categoryQuestion;
    }

    public TypeQuestion getTypeQuestion() {
        return typeQuestion;
    }

    public Account getCreator() {
        return creator;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setCategoryQuestion(CategoryQuestion categoryQuestion) {
        this.categoryQuestion = categoryQuestion;
    }

    public void setTypeQuestion(TypeQuestion typeQuestion) {
        this.typeQuestion = typeQuestion;
    }

    public void setCreator(Account creator) {
        this.creator = creator;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}
