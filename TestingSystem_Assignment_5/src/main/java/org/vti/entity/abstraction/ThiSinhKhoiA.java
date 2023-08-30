package org.vti.entity.abstraction;

public class ThiSinhKhoiA extends ThiSinh{
    private String khoiThi;
    private String[] monThi;

    public ThiSinhKhoiA(String soBaoDanh, String hoTen, String diaChi, int mucUuTien) {
        super(soBaoDanh, hoTen, diaChi, mucUuTien);
        this.khoiThi = "A";
        this.monThi = new String[]{"Toán", "Lý", "Hoá"};
    }
    public String getKhoiThi() {
        return khoiThi;
    }

    public void setKhoiThi(String khoiThi) {
        this.khoiThi = khoiThi;
    }

    public String[] getMonThi() {
        return monThi;
    }

    public void setMonThi(String[] monThi) {
        this.monThi = monThi;
    }
}
