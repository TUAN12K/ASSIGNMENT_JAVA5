package com.example.assignment.repository;

import com.example.assignment.model.TaiKhoan;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ITaiKhoanRepository extends JpaRepository<TaiKhoan, String> {
    TaiKhoan findByTaiKhoan(String taiKhoan);
}
