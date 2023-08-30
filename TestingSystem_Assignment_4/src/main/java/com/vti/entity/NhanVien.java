package com.vti.entity;

public class NhanVien extends CanBo{
    private String congViec;
    public NhanVien(String hoTen, int tuoi, String gioiTinh, String diaChi) {
        super(hoTen, tuoi, gioiTinh, diaChi);
        this.setHoTen(hoTen);
        this.setTuoi(tuoi);
        this.setGioiTinh(gioiTinh);
        this.setDiaChi(diaChi);
    }
    public String getCongViec() {
        return congViec;
    }

    public void setCongViec(String congViec) {
        this.congViec = congViec;
    }
}
