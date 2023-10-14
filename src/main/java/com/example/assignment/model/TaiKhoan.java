package com.example.assignment.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.GenericGenerator;

import java.sql.Date;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder
@Entity
@Table(name = "taikhoan")
public class TaiKhoan {
    @Id
    @GeneratedValue(generator = "uuid2")
    @GenericGenerator(name = "uuid2", strategy = "uuid2")
    @Column(name = "id", updatable = false, nullable = false, columnDefinition = "VARCHAR(36)")
    private String id;
    @Column(name = "ma", unique = true, nullable = false, length = 36)
    private String ma;
    @Column(name = "ho_ten", columnDefinition = "VARCHAR(40)")
    private String hoTen;
    @Column(name = "ngay_sinh")
    private Date ngaySinh;
    @Column(name = "email")
    private String email;
    @Column(name = "so_dien_thoai")
    private String soDienThoai;
    @Column(name = "dia_chi")
    private String diaChi;
    @Column(name = "tai_khoan", columnDefinition = "VARCHAR(40)")
    private String taiKhoan;
    @Column(name = "mat_khau", columnDefinition = "VARCHAR(40)")
    private String matKhau;
    @Column(name = "vai_tro", columnDefinition = "VARCHAR(20)")
    private String vaiTro;
    @Column(name = "trang_thai")
    private Integer trangThai;


}
