package com.example.assignment.repository;

import com.example.assignment.model.DongSanPham;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IDongSanPhamRepository extends JpaRepository<DongSanPham, String> {
}
