package com.example.assignment.controller;

import com.example.assignment.model.GioHangChiTiet;

import com.example.assignment.repository.IGioHangChiTietRepository;
import com.example.assignment.service.IGioHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping("/gio-hang")
public class GioHangController {

    @Autowired
    private IGioHangService iGioHangService;
    @Autowired
    private IGioHangChiTietRepository iGioHangChiTietRepository;

    private String chuyenTrang(Model model) {
        List<GioHangChiTiet> listGioHangChiTiets = iGioHangService.listGioHangChiTiets();
        BigDecimal tongTien = BigDecimal.valueOf(0);
        List<GioHangChiTiet> list = iGioHangChiTietRepository.findAll();
        for (int i = 0; i < list.size(); i++) {
            tongTien = tongTien.add(list.get(i).getDonGia());
        }
        model.addAttribute("listGioHangChiTiets", listGioHangChiTiets);
        model.addAttribute("tongTien", tongTien);
        return "trang-gio-hang";
    }

    @GetMapping
    public String viewGioHang(Model model) {
        return chuyenTrang(model);
    }

    @GetMapping("/add/{id}")
    public String addGioHang(Model model, @PathVariable(name = "id") String id) {
        iGioHangService.addSanPhamVaoGio(id);
        return chuyenTrang(model);
    }

    @GetMapping("/bot-san-pham/{id}")
    public String botMotSanPham(Model model, @PathVariable(name = "id") String id) {
        iGioHangService.botSanPhamTrongGio(id);
        return "redirect:/gio-hang";
    }

    @GetMapping("/xoa-san-pham/{id}")
    public String removeSanPham(Model model, @PathVariable(name = "id") String id) {
        iGioHangService.removeSanPhamTrongGio(id);
        return "redirect:/gio-hang";
    }

}
