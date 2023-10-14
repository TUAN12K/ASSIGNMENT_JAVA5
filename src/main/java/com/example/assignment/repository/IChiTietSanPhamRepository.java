package com.example.assignment.repository;

import com.example.assignment.model.ChiTietSanPham;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.math.BigDecimal;
import java.util.List;

public interface IChiTietSanPhamRepository extends JpaRepository<ChiTietSanPham, String> {
    List<ChiTietSanPham> findBySanPhamTenContains(String keyword);

    Page<ChiTietSanPham> findBySanPhamTenContains(String keyword, Pageable pageable);

    Page<ChiTietSanPham> findByGiaBanBetween(BigDecimal min, BigDecimal max, Pageable pageable);

    @Query("SELECT p1 FROM ChiTietSanPham p1 LEFT JOIN HoaDonChiTiet p2 ON p1.id = p2.chiTietSanPham WHERE p2.chiTietSanPham IS NULL ORDER BY p1.ngayTao ASC LIMIT 10")
    List<ChiTietSanPham> getSanPhamTonKho();
}
