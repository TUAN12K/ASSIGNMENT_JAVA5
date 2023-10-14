package com.example.assignment.service;

import com.example.assignment.model.GioHangChiTiet;

import java.util.List;

public interface IGioHangService {
    List<GioHangChiTiet> listGioHangChiTiets();

    GioHangChiTiet findOneGioHangChiTiet(String id);

    Boolean addSanPhamVaoGio(String id);

    Boolean botSanPhamTrongGio(String id);

    Boolean removeSanPhamTrongGio(String id);
}
