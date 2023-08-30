package com.vti.entity;

public class CongNhan extends CanBo{
    private int bac;
    public CongNhan(String hoTen, int tuoi, String gioiTinh, String diaChi) {
        super(hoTen, tuoi, gioiTinh, diaChi);
        this.setHoTen(hoTen);
        this.setTuoi(tuoi);
        this.setGioiTinh(gioiTinh);
        this.setDiaChi(diaChi);
    }
    public int getBac() {
        return bac;
    }

    public void setBac(int bac) {
        this.bac = bac;
    }
}
