package com.example.assignment.service;

import com.example.assignment.model.ChiTietSanPham;
import com.example.assignment.viewmodel.HoaDonChiTietViewModel;

import java.util.List;
import java.util.Map;

public interface IThongKeService {
    List<HoaDonChiTietViewModel> listHoaDonChiTietViewModel();

    Map<String, Integer> tinhTongSoLuong(List<HoaDonChiTietViewModel> listHoaDonChiTietViewModel);

    List<ChiTietSanPham> laySanPhamTonKho();
}
