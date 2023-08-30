package org.vti.entity.abstraction;

import java.util.ArrayList;

public class TuyenSinh implements ITuyenSinh{
    private ArrayList<ThiSinh> danhSachThiSinh;

    public TuyenSinh() {
        this.danhSachThiSinh = new ArrayList<ThiSinh>();
    }

    @Override
    public static void themThiSinh(ThiSinh thiSinh) {
        this.danhSachThiSinh.add(thiSinh);
    }

    @Override
    public static void hienThiThongTin() {
        for (ThiSinh thiSinh : this.danhSachThiSinh) {
            System.out.println(thiSinh);
        }
    }

    @Override
    public static void timKiemTheoSoBaoDanh(String soBaoDanh) {
        for (ThiSinh thiSinh : this.danhSachThiSinh) {
            if (thiSinh.getSoBaoDanh().equals(soBaoDanh)) {
                System.out.println(thiSinh);
                return;
            }
        }
        System.out.println("Không tìm thấy thí sinh có số báo danh " + soBaoDanh);
    }
}
