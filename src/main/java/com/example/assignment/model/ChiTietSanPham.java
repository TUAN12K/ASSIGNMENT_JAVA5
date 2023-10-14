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

import java.math.BigDecimal;
import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@Builder
@Entity
@Table(name = "chitietsanpham")
public class ChiTietSanPham {
    @Id
    @GeneratedValue(generator = "uuid2")
    @GenericGenerator(name = "uuid2", strategy = "uuid2")
    @Column(name = "id", updatable = false, nullable = false, columnDefinition = "VARCHAR(36)")
    private String id;
    @ManyToOne
    @JoinColumn(name = "id_san_pham")
    private SanPham sanPham;
    @ManyToOne
    @JoinColumn(name = "id_nha_san_xuat")
    private NhaSanXuat nhaSanXuat;
    @ManyToOne
    @JoinColumn(name = "id_mau_sac")
    private MauSac mauSac;
    @ManyToOne
    @JoinColumn(name = "id_dong_san_pham")
    private DongSanPham dongSanPham;
    @ManyToOne
    @JoinColumn(name = "id_bo_nho")
    private BoNho boNho;
    @Column(name = "gia_nhap", nullable = false)
    private BigDecimal giaNhap;
    @Column(name = "gia_ban", nullable = false)
    private BigDecimal giaBan;
    @Column(name = "gia_ban_dau", nullable = false)
    private BigDecimal giaBanDau;
    @Column(name = "ngay_tao", nullable = false)
    private Date ngayTao;
    @Column(name = "so_luong", nullable = false)
    private Integer soLuong;
    @Column(name = "nam_bao_hanh", nullable = false)
    private Integer namBaoHanh;
    @Column(name = "mo_ta", nullable = false, columnDefinition = "NVARCHAR(MAX)")
    private String moTa;
    @Column(name = "trang_thai", nullable = false)
    private Integer trangThai;

}
