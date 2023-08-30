package org.vti.entity.abstraction;

public class ThiSinhKhoiC extends ThiSinh{
    private String khoiThi;
    private String[] monThi;

    public ThiSinhKhoiC(String soBaoDanh, String hoTen, String diaChi, int mucUuTien) {
        super(soBaoDanh, hoTen, diaChi, mucUuTien);
        this.khoiThi = "C";
        this.monThi = new String[]{"Văn", "Sử", "Địa"};
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
