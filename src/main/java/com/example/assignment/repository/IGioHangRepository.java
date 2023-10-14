package com.example.assignment.repository;

import com.example.assignment.model.GioHang;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IGioHangRepository extends JpaRepository<GioHang, String> {
    GioHang findByMa(String ma);
}
