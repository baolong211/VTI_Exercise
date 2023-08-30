package org.vti.frontend;

import org.vti.entity.abstraction.ThiSinh;
import org.vti.entity.abstraction.TuyenSinh;

import java.util.Scanner;

public class TestTuyenSinh {
    TestTuyenSinh tuyenSinh = new TestTuyenSinh();
    Scanner sc = new Scanner(System.in);
    int luaChon;
        do {
            System.out.println("1. Thêm mới thí sinh.");
            System.out.println("2. Hiện thị thông tin của thí sinh và khối thi của thí sinh.");
            System.out.println("3. Tìm kiếm theo số báo danh.");
            System.out.println("4. Thoát khỏi chương trình.");
            System.out.print("Nhập lựa chọn của bạn: ");
            luaChon = sc.nextInt();
            sc.nextLine();
                switch (luaChon) {
                case 1:
                    System.out.println("Nhập thông tin thí sinh mới:");
                    System.out.print("Số báo danh: ");
                    String soBaoDanh = sc.nextLine();
                    System.out.print("Họ tên: ");
                    String hoTen = sc.nextLine();
                    System.out.print("Địa chỉ: ");
                    String diaChi = sc.nextLine();
                    System.out.print("Mức ưu tiên: ");
                    int mucUuTien = sc.nextInt();
                    sc.nextLine();
                    ThiSinh thiSinh = new ThiSinh(soBaoDanh, hoTen, diaChi, mucUuTien);
                    TuyenSinh.themThiSinh(thiSinh);
                    System.out.println("Thêm thí sinh thành công.");
                    break;
                    case 2:
                    TuyenSinh.hienThiThongTin();
                    break;
                case 3:
                    System.out.print("Nhập số báo danh: ");
                    String soBaoDanh = sc.nextLine();
                    TuyenSinh.timKiemTheoSoBaoDanh(soBaoDanh);
                    break;
                case 4:
                    System.out.println("Thoát khỏi chương trình.");
                    break;
                default:
                    System.out.println("Lựa chọn không hợp lệ.");
                    break;
                }
        } while (luaChon != 4);
}
}
