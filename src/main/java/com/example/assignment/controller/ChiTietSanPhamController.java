package com.example.assignment.controller;

import com.example.assignment.model.BoNho;
import com.example.assignment.model.ChiTietSanPham;
import com.example.assignment.model.DongSanPham;
import com.example.assignment.model.MauSac;
import com.example.assignment.model.NhaSanXuat;
import com.example.assignment.model.SanPham;
import com.example.assignment.repository.IBoNhoRepository;
import com.example.assignment.repository.IChiTietSanPhamRepository;
import com.example.assignment.repository.IDongSanPhamRepository;
import com.example.assignment.repository.IHoaDonChiTietRepository;
import com.example.assignment.repository.IMauSacRepository;
import com.example.assignment.repository.INhaSanXuatRepository;
import com.example.assignment.repository.ISanPhamRepository;
import com.example.assignment.service.IThongKeService;
import com.example.assignment.viewmodel.HoaDonChiTietViewModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/view-chi-tiet-san-pham")
public class ChiTietSanPhamController {
    @Autowired
    private IChiTietSanPhamRepository iChiTietSanPhamRepository;
    @Autowired
    private ISanPhamRepository iSanPhamRepository;
    @Autowired
    private INhaSanXuatRepository iNhaSanXuatRepository;
    @Autowired
    private IMauSacRepository iMauSacRepository;
    @Autowired
    private IDongSanPhamRepository iDongSanPhamRepository;
    @Autowired
    private IBoNhoRepository iBoNhoRepository;
    @Autowired
    private IHoaDonChiTietRepository iHoaDonChiTietRepository;
    @Autowired
    private IThongKeService iThongKeService;

    private String chuyenTrang(Model model) {
        model.addAttribute("listChiTietSanPhams", iChiTietSanPhamRepository.findAll());
        model.addAttribute("listSanPhams", iSanPhamRepository.findAll());
        model.addAttribute("listNhaSanXuats", iNhaSanXuatRepository.findAll());
        model.addAttribute("listMauSacs", iMauSacRepository.findAll());
        model.addAttribute("listBoNhos", iBoNhoRepository.findAll());
        model.addAttribute("listDongSanPhams", iDongSanPhamRepository.findAll());
        return "view-chi-tiet-san-pham/chi-tiet-san-pham";
    }

    @GetMapping
    public String viewChiTietSanPham(Model model) {
        return chuyenTrang(model);
    }

    @PostMapping("/add")
    public String saveChiTietSanPham(Model model, @ModelAttribute(name = "chiTietSanPham") ChiTietSanPham chiTietSanPham) {
        SanPham sanPham = iSanPhamRepository.findById(chiTietSanPham.getSanPham().getId()).get();
        Date date = new Date();
        NhaSanXuat nhaSanXuat = iNhaSanXuatRepository.findById(chiTietSanPham.getNhaSanXuat().getId()).get();
        MauSac mauSac = iMauSacRepository.findById(chiTietSanPham.getMauSac().getId()).get();
        DongSanPham dongSanPham = iDongSanPhamRepository.findById(chiTietSanPham.getDongSanPham().getId()).get();
        BoNho boNho = iBoNhoRepository.findById(chiTietSanPham.getBoNho().getId()).get();
        iChiTietSanPhamRepository.save(new ChiTietSanPham(null,
                sanPham, nhaSanXuat, mauSac, dongSanPham, boNho,
                chiTietSanPham.getGiaNhap(),
                chiTietSanPham.getGiaBan(),
                chiTietSanPham.getGiaBan(),
                date,
                chiTietSanPham.getSoLuong(),
                chiTietSanPham.getNamBaoHanh(),
                chiTietSanPham.getMoTa(),
                chiTietSanPham.getTrangThai()));
        model.addAttribute("message", "ADD THÀNH CÔNG");
        return chuyenTrang(model);
    }

    @GetMapping("/detail/{id}")
    public String detailChiTietSanPham(Model model, @PathVariable("id") String id) {
        ChiTietSanPham chiTietSanPham = iChiTietSanPhamRepository.findById(id).get();
        model.addAttribute("chiTietSanPham", chiTietSanPham);
        model.addAttribute("message", "DETAIL THÀNH CÔNG");
        return chuyenTrang(model);
    }

    @GetMapping("/delete/{id}")
    public String deleteChiTietSanPham(Model model, @PathVariable("id") String id) {
        iChiTietSanPhamRepository.deleteById(id);
        model.addAttribute("message", "DELETE THÀNH CÔNG");
        return chuyenTrang(model);
    }

    @GetMapping("/view-update/{id}")
    public String viewUpdateChiTietSanPham(Model model, @PathVariable("id") String id) {
        ChiTietSanPham chiTietSanPham = iChiTietSanPhamRepository.findById(id).get();
        model.addAttribute("listSanPhams", iSanPhamRepository.findAll());
        model.addAttribute("listNhaSanXuats", iNhaSanXuatRepository.findAll());
        model.addAttribute("listMauSacs", iMauSacRepository.findAll());
        model.addAttribute("listBoNhos", iBoNhoRepository.findAll());
        model.addAttribute("listDongSanPhams", iDongSanPhamRepository.findAll());
        model.addAttribute("chiTietSanPham", chiTietSanPham);
        model.addAttribute("message", "VIEW-UPDATE");
        return "/view-chi-tiet-san-pham/update-chi-tiet-san-pham";
    }

    @PostMapping("/update/{id}")
    public String updateMauSac(Model model, @PathVariable("id") String id, @ModelAttribute(name = "chiTietSanPham") ChiTietSanPham chiTietSanPham) {
        Date date = new Date();
        SanPham sanPham = iSanPhamRepository.findById(chiTietSanPham.getSanPham().getId()).get();
        NhaSanXuat nhaSanXuat = iNhaSanXuatRepository.findById(chiTietSanPham.getNhaSanXuat().getId()).get();
        MauSac mauSac = iMauSacRepository.findById(chiTietSanPham.getMauSac().getId()).get();
        DongSanPham dongSanPham = iDongSanPhamRepository.findById(chiTietSanPham.getDongSanPham().getId()).get();
        BoNho boNho = iBoNhoRepository.findById(chiTietSanPham.getBoNho().getId()).get();
        iChiTietSanPhamRepository.save(new ChiTietSanPham(id,
                sanPham, nhaSanXuat, mauSac, dongSanPham, boNho,
                chiTietSanPham.getGiaNhap(),
                chiTietSanPham.getGiaBan(),
                chiTietSanPham.getGiaBan(),
                date,
                chiTietSanPham.getSoLuong(),
                chiTietSanPham.getNamBaoHanh(),
                chiTietSanPham.getMoTa(),
                chiTietSanPham.getTrangThai()));
        model.addAttribute("message", "UPDATE-THANH-CONG");
        return chuyenTrang(model);
    }

    @GetMapping("/giam-gia/{id}")
    public String giamGiaSanPham(Model model, @PathVariable("id") String id) {
        BigDecimal giaGiam = BigDecimal.valueOf(20000);
        ChiTietSanPham chiTietSanPham = iChiTietSanPhamRepository.findById(id).get();
        BigDecimal giaBan = chiTietSanPham.getGiaBan();
        if (giaBan.compareTo(giaGiam) > 0) {
            BigDecimal giaChuaGiam = chiTietSanPham.getGiaBan();
            BigDecimal giaSauGiam = giaChuaGiam.subtract(giaGiam);
            chiTietSanPham.setGiaBan(giaSauGiam);
            chiTietSanPham.setGiaBanDau(giaBan);
            iChiTietSanPhamRepository.save(chiTietSanPham);
        }
        return "redirect:/thong-ke/trang-chu";
    }
}
