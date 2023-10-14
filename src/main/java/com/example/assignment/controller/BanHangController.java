package com.example.assignment.controller;

import com.example.assignment.model.ChiTietSanPham;
import com.example.assignment.repository.IChiTietSanPhamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;


@Controller
@RequestMapping("/ban-hang")
public class BanHangController {
    @Autowired
    private IChiTietSanPhamRepository iChiTietSanPhamRepository;

    @GetMapping
    public String viewTrangChu(Model model) {
        return "/trang-chu";
    }

    @GetMapping("/san-pham")
    public String viewSanPham(Model model, @RequestParam(defaultValue = "1") int page, @RequestParam(name = "tenSanPham", required = false) String keyword) {
        Page<ChiTietSanPham> pageChiTietSanPham;
        if (page < 1) page = 1;
        Pageable pageable = PageRequest.of(page - 1, 8);
        if (keyword == null || keyword.isBlank()) {
            pageChiTietSanPham = iChiTietSanPhamRepository.findAll(pageable);
        } else {
            pageChiTietSanPham = iChiTietSanPhamRepository.findBySanPhamTenContains(keyword, pageable);
        }
        model.addAttribute("pageChiTietSanPham", pageChiTietSanPham);
        return "/trang-san-pham";
    }
    @GetMapping("/serchByName")
    public String searchByNameSanPham(Model model, @RequestParam(defaultValue = "1") int page, @RequestParam(name = "tenSanPham", required = false) String keyword) {
        Page<ChiTietSanPham> pageChiTietSanPham;
        if (page < 1) page = 1;
        Pageable pageable = PageRequest.of(page - 1, 8);
        if (keyword == null || keyword.isBlank()) {
            pageChiTietSanPham = iChiTietSanPhamRepository.findAll(pageable);
        } else {
            pageChiTietSanPham = iChiTietSanPhamRepository.findBySanPhamTenContains(keyword, pageable);
        }
        model.addAttribute("pageChiTietSanPham", pageChiTietSanPham);
        model.addAttribute("message", "SEARCH BY NAME THÀNH CÔNG");
        return "/trang-san-pham";
    }

    @GetMapping("/trang-chi-tiet-san-pham/{id}")
    public String viewChiTietSanPham(Model model, @PathVariable("id") String id) {
        ChiTietSanPham chiTietSanPham = iChiTietSanPhamRepository.findById(id).get();
        model.addAttribute("chiTietSanPham", chiTietSanPham);
        return "/trang-chi-tiet-san-pham";
    }

    @GetMapping("/quan-ly-san-pham")
    public String viewQuanLySanPham(Model model) {
        return "/quan-ly-san-pham";
    }

    @GetMapping("/search")
    public String searchByPriceSanPham(Model model, @RequestParam(name = "priceRange", required = false) String priceRange, @RequestParam(defaultValue = "1") int page, @RequestParam(name = "tenSanPham", required = false) String keyword) {
        model.addAttribute("keyword", "");
        model.addAttribute("priceRange", priceRange);
        Page<ChiTietSanPham> pageChiTietSanPham;
        BigDecimal priceMin;
        BigDecimal priceMax;
        if (page < 1) page = 1;
        Pageable pageable = PageRequest.of(page - 1, 8);
        if (priceRange == null || priceRange.isBlank()) {
            pageChiTietSanPham = iChiTietSanPhamRepository.findAll(pageable);
        } else {
            if (priceRange.equals("0-1000000")) {
                priceMin = BigDecimal.valueOf(0);
                priceMax = BigDecimal.valueOf(1000000);
            } else if (priceRange.equals("1000000-2000000")) {
                priceMin = BigDecimal.valueOf(1000000);
                priceMax = BigDecimal.valueOf(2000000);
            } else if (priceRange.equals("2000000-4000000")) {
                priceMin = BigDecimal.valueOf(2000000);
                priceMax = BigDecimal.valueOf(4000000);
            } else if (priceRange.equals("4000000-6000000")) {
                priceMin = BigDecimal.valueOf(4000000);
                priceMax = BigDecimal.valueOf(6000000);
            } else if (priceRange.equals("6000000-8000000")) {
                priceMin = BigDecimal.valueOf(6000000);
                priceMax = BigDecimal.valueOf(8000000);
            } else if (priceRange.equals(">8000000")) {
                priceMin = BigDecimal.valueOf(8000000);
                priceMax = BigDecimal.valueOf(1000000000);
            } else {
                priceMin = BigDecimal.valueOf(0);
                priceMax = BigDecimal.valueOf(1000000000);
            }
            pageChiTietSanPham = iChiTietSanPhamRepository.findByGiaBanBetween(priceMin, priceMax, pageable);
        }
        model.addAttribute("message", "SEARCH BY PRICE THÀNH CÔNG");
        model.addAttribute("pageChiTietSanPham", pageChiTietSanPham);
        return "/trang-san-pham";
    }
}
