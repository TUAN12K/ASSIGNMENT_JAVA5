package com.example.assignment.repository;

import com.example.assignment.model.HoaDonChiTiet;
import com.example.assignment.viewmodel.HoaDonChiTietViewModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Date;
import java.util.List;

public interface IHoaDonChiTietRepository extends JpaRepository<HoaDonChiTiet, String> {
    @Query("SELECT new com.example.assignment.viewmodel.HoaDonChiTietViewModel(hd.soLuong, hd.chiTietSanPham) FROM HoaDonChiTiet hd")
    List<HoaDonChiTietViewModel> getSoLuongAndChiTietSanPhamByDateRange();
    @Query("SELECT new com.example.assignment.viewmodel.HoaDonChiTietViewModel(hd.soLuong, hd.chiTietSanPham) FROM HoaDonChiTiet hd WHERE hd.ngayTao BETWEEN :startDate AND :endDate")
    List<HoaDonChiTietViewModel> getSoLuongAndChiTietSanPhamByDateRange(@Param("startDate") Date startDate, @Param("endDate") Date endDate);
}
