package com.example.assignment.service.impl;

import com.example.assignment.model.ChiTietSanPham;
import com.example.assignment.model.GioHang;
import com.example.assignment.model.GioHangChiTiet;
import com.example.assignment.model.TaiKhoan;
import com.example.assignment.repository.IChiTietSanPhamRepository;
import com.example.assignment.repository.IGioHangChiTietRepository;
import com.example.assignment.repository.IGioHangRepository;
import com.example.assignment.repository.ITaiKhoanRepository;
import com.example.assignment.service.IGioHangService;
import com.example.assignment.util.GenMa;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;


@Service
public class GioHangServiceImpl implements IGioHangService {
    @Autowired
    private IGioHangRepository iGioHangRepository;
    @Autowired
    private ITaiKhoanRepository iTaiKhoanRepository;
    @Autowired
    private IGioHangChiTietRepository iGioHangChiTietRepository;
    @Autowired
    private IChiTietSanPhamRepository iChiTietSanPhamRepository;

    @Override
    public List<GioHangChiTiet> listGioHangChiTiets() {
        List<GioHangChiTiet> listGioHangChiTiets = iGioHangChiTietRepository.findAll();
        return listGioHangChiTiets;
    }

    @Override
    public GioHangChiTiet findOneGioHangChiTiet(String id) {
        return iGioHangChiTietRepository.findById(id).get();
    }

    @Override
    public Boolean addSanPhamVaoGio(String id) {
        List<GioHangChiTiet> listGioHangChiTiets = iGioHangChiTietRepository.findAll();
        TaiKhoan taiKhoan = iTaiKhoanRepository.findByTaiKhoan("tien123");
        GioHangChiTiet gioHangChiTiet = new GioHangChiTiet();
        Date date = new Date();
        GioHang gioHang = new GioHang(null, taiKhoan, GenMa.generateRandomLineOfCode(), date, date, taiKhoan.getHoTen(), taiKhoan.getDiaChi(), taiKhoan.getSoDienThoai(), 1);
        ChiTietSanPham chiTietSanPham = iChiTietSanPhamRepository.findById(id).get();
        Integer soLuong;
        BigDecimal giaTong;
        if (checkTrung(listGioHangChiTiets, id)) {
            for (int i = 0; i < listGioHangChiTiets.size(); i++) {
                if (listGioHangChiTiets.get(i).getChiTietSanPham().getId().equals(id)) {
                    soLuong = listGioHangChiTiets.get(i).getSoLuong();
                    giaTong = listGioHangChiTiets.get(i).getDonGia().add(chiTietSanPham.getGiaBan());
                    gioHangChiTiet = new GioHangChiTiet(listGioHangChiTiets.get(i).getId(), chiTietSanPham, gioHang, soLuong + 1, giaTong, BigDecimal.valueOf(0));
                }
            }
        } else {
            gioHangChiTiet = new GioHangChiTiet(null, chiTietSanPham, gioHang, 1, chiTietSanPham.getGiaBan(), BigDecimal.valueOf(0));
        }
        iGioHangRepository.save(gioHang);
        iGioHangChiTietRepository.save(gioHangChiTiet);
        return true;
    }

    @Override
    public Boolean botSanPhamTrongGio(String id) {
        List<GioHangChiTiet> listGioHangChiTiets = iGioHangChiTietRepository.findAll();
        ChiTietSanPham chiTietSanPham = iChiTietSanPhamRepository.findById(id).get();
        Integer soLuong;
        BigDecimal giaTong;
        TaiKhoan taiKhoan = iTaiKhoanRepository.findByTaiKhoan("tien123");
        Date date = new Date();
        GioHang gioHang;
        GioHangChiTiet gioHangChiTiet = new GioHangChiTiet();
        if (checkTrung(listGioHangChiTiets, id)) {
            for (int i = 0; i < listGioHangChiTiets.size(); i++) {
                if (listGioHangChiTiets.get(i).getChiTietSanPham().getId().equals(id)) {
                    soLuong = listGioHangChiTiets.get(i).getSoLuong();
                    if (soLuong == 1) {
                        removeSanPhamTrongGio(listGioHangChiTiets.get(i).getId());
                        return false;
                    }
                    giaTong = listGioHangChiTiets.get(i).getDonGia().subtract(chiTietSanPham.getGiaBan());
                    gioHang = new GioHang(listGioHangChiTiets.get(i).getGioHang().getId(), taiKhoan, GenMa.generateRandomLineOfCode(), date, date, taiKhoan.getHoTen(), taiKhoan.getDiaChi(), taiKhoan.getSoDienThoai(), 1);
                    gioHangChiTiet = new GioHangChiTiet(listGioHangChiTiets.get(i).getId(), chiTietSanPham, gioHang, soLuong - 1, giaTong, BigDecimal.valueOf(0));
                }
            }
        }
        iGioHangChiTietRepository.save(gioHangChiTiet);
        return true;
    }

    @Override
    public Boolean removeSanPhamTrongGio(String id) {
        iGioHangChiTietRepository.deleteById(id);
        return true;
    }

    private Boolean checkTrung(List<GioHangChiTiet> listGioHangChiTiets, String id) {
        for (int i = 0; i < listGioHangChiTiets.size(); i++) {
            if (listGioHangChiTiets.get(i).getChiTietSanPham().getId().equals(id)) {
                return true;
            }
        }
        return false;
    }
}
