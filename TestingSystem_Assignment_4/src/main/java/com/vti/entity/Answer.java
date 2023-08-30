package com.vti.entity;

public class Answer {
    private int answerId;
    private String content;
    private Question question;
    private boolean isCorrect;
    public int getAnswerId() {
        return answerId;
    }

    public String getContent() {
        return content;
    }

    public Question getQuestion() {
        return question;
    }

    public boolean isCorrect() {
        return isCorrect;
    }

    public void setAnswerId(int answerId) {
        this.answerId = answerId;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public void setCorrect(boolean isCorrect) {
        this.isCorrect = isCorrect;
    }
}
