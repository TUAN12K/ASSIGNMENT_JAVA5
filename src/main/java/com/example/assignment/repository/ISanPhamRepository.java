package com.example.assignment.repository;

import com.example.assignment.model.SanPham;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ISanPhamRepository extends JpaRepository<SanPham, String> {
}
