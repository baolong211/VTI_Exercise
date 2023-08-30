package com.vti.entity;

public class KySu extends CanBo{
    private String nganhDaoTao;
    public KySu(String hoTen, int tuoi, String gioiTinh, String diaChi) {
        super(hoTen, tuoi, gioiTinh, diaChi);
        this.setHoTen(hoTen);
        this.setTuoi(tuoi);
        this.setGioiTinh(gioiTinh);
        this.setDiaChi(diaChi);
    }
    public String getNganhDaoTao() {
        return nganhDaoTao;
    }

    public void setNganhDaoTao(String nganhDaoTao) {
        this.nganhDaoTao = nganhDaoTao;
    }
}
