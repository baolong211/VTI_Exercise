package org.vti.entity.abstraction;

public class ThiSinhKhoiB extends ThiSinh{
    private String khoiThi;
    private String[] monThi;

    public ThiSinhKhoiB(String soBaoDanh, String hoTen, String diaChi, int mucUuTien) {
        super(soBaoDanh, hoTen, diaChi, mucUuTien);
        this.khoiThi = "B";
        this.monThi = new String[]{"Toán", "Hoá", "Sinh"};
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
