package com.example.assignment.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.GenericGenerator;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder
@Entity
@Table(name = "hoadon")
public class HoaDon {
    @Id
    @GeneratedValue(generator = "uuid2")
    @GenericGenerator(name = "uuid2", strategy = "uuid2")
    @Column(name = "id", updatable = false, nullable = false, columnDefinition = "VARCHAR(36)")
    private String id;
    @ManyToOne
    @JoinColumn(name = "id_tai_khoan")
    private TaiKhoan taiKhoan;
    @Column(name = "ma", unique = true, nullable = false, length = 36)
    private String ma;
    @Column(name = "ngay_tao")
    private Date ngayTao;
    @Column(name = "ngay_thanh_toan")
    private Date ngayThanhToan;
    @Column(name = "ngay_ship")
    private Date ngayShip;
    @Column(name = "ngay_nhan")
    private Date ngayNhan;
    @Column(name = "ten_nguoi_nhan")
    private String tenNguoiNhan;
    @Column(name = "dia_chi")
    private String diaChi;
    @Column(name = "so_dien_thoai")
    private String soDienThoai;
    @Column(name = "trang_thai")
    private Integer trangThai;

}
