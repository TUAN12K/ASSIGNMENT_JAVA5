package com.example.assignment.repository;

import com.example.assignment.model.GioHangChiTiet;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IGioHangChiTietRepository extends JpaRepository<GioHangChiTiet, String> {
    void deleteById(String keyword);
}
