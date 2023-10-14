package com.example.assignment.viewmodel;

import com.example.assignment.model.ChiTietSanPham;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class HoaDonChiTietViewModel {
    private Integer soLuong;
    private ChiTietSanPham chiTietSanPham;
}
