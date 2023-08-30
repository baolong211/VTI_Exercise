package com.vti.entity;

import java.util.ArrayList;
import java.util.List;

public class QuanLyCanBo {
    private List<CanBo> canBo;

    public void QLCB() {
        this.canBo = new ArrayList<>();
    }

    public void themCanBo(CanBo canBo) {
        this.canBo.add(canBo);
    }

    public List<CanBo> timKiemTheoHoTen(String hoTen) {
        List<CanBo> ketQua = new ArrayList<>();
        for (CanBo canBo : this.canBo) {
            if (canBo.getHoTen().equals(hoTen)) {
                ketQua.add(canBo);
            }
        }
        return ketQua;
    }

    public void hienThiThongTin() {
        for (CanBo canBo : this.canBo) {
            System.out.println(canBo);
        }
    }

    public void xoaCanBo(String hoTen) {
        for (int i = 0; i < this.canBo.size(); i++) {
            if (this.canBo.get(i).getHoTen().equals(hoTen)) {
                this.canBo.remove(i);
                break;
            }
        }
    }
}
