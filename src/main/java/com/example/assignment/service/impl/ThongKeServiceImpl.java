package com.example.assignment.service.impl;

import com.example.assignment.model.ChiTietSanPham;
import com.example.assignment.repository.IChiTietSanPhamRepository;
import com.example.assignment.repository.IHoaDonChiTietRepository;
import com.example.assignment.service.IThongKeService;
import com.example.assignment.viewmodel.HoaDonChiTietViewModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ThongKeServiceImpl implements IThongKeService {
    @Autowired
    private IHoaDonChiTietRepository iHoaDonChiTietRepository;
    @Autowired
    private IChiTietSanPhamRepository iChiTietSanPhamRepository;

    @Override
    public List<HoaDonChiTietViewModel> listHoaDonChiTietViewModel() {
        return null;
    }

    @Override
    public Map<String, Integer> tinhTongSoLuong(List<HoaDonChiTietViewModel> listHoaDonChiTietViewModel) {
        Map<String, Integer> tongSoLuongMap = new HashMap<>();
        for (HoaDonChiTietViewModel hoaDonChiTietViewModel : listHoaDonChiTietViewModel) {
            String id = hoaDonChiTietViewModel.getChiTietSanPham().getId();
            int soLuong = hoaDonChiTietViewModel.getSoLuong();

            if (tongSoLuongMap.containsKey(id)) {
                int tongSoLuongHienTai = tongSoLuongMap.get(id);
                tongSoLuongMap.put(id, tongSoLuongHienTai + soLuong);
            } else {
                tongSoLuongMap.put(id, soLuong);
            }
        }

        return tongSoLuongMap;
    }

    @Override
    public List<ChiTietSanPham> laySanPhamTonKho() {
        return iChiTietSanPhamRepository.getSanPhamTonKho();
    }
}
