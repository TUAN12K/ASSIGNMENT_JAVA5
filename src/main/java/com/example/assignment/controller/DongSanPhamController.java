package com.example.assignment.controller;

import com.example.assignment.model.DongSanPham;
import com.example.assignment.repository.IDongSanPhamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/view-dong-san-pham")
public class DongSanPhamController {
    @Autowired
    private IDongSanPhamRepository iDongSanPhamRepository;
    private List<DongSanPham> listDongSanPhams = new ArrayList<>();

    public String chuyenTrang(Model model) {
        model.addAttribute("listDongSanPhams", iDongSanPhamRepository.findAll());
        return "/view-dong-san-pham/dong-san-pham";
    }

    @GetMapping
    public String viewDongSanPham(Model model) {
        return chuyenTrang(model);
    }

    @PostMapping("/add")
    public String saveDongSanPham(Model model, @ModelAttribute(name = "dongSanPham") DongSanPham dongSanPham) {
        iDongSanPhamRepository.save(new DongSanPham(null, dongSanPham.getMa(), dongSanPham.getTen()));
        model.addAttribute("message", "ADD THÀNH CÔNG");
        return chuyenTrang(model);
    }

    @GetMapping("/detail/{id}")
    public String detailDongSanPham(Model model, @PathVariable("id") String id) {
        DongSanPham dongSanPham = iDongSanPhamRepository.findById(id).get();
        model.addAttribute("dongSanPham", dongSanPham);
        model.addAttribute("message", "DETAIL THÀNH CÔNG");
        return chuyenTrang(model);
    }

    @GetMapping("/delete/{id}")
    public String deleteDongSanPham(Model model, @PathVariable("id") String id) {
        iDongSanPhamRepository.deleteById(id);
        model.addAttribute("message", "DELETE THÀNH CÔNG");
        return chuyenTrang(model);
    }

    @GetMapping("/view-update/{id}")
    public String viewUpdateDongSanPham(Model model, @PathVariable("id") String id) {
        model.addAttribute("dongSanPham", iDongSanPhamRepository.findById(id).get());
        model.addAttribute("message", "VIEW-UPDATE");
        return "/view-dong-san-pham/update-dong-san-pham";
    }

    @PostMapping("/update/{id}")
    public String updateDongSanPham(Model model, @PathVariable("id") String id, @ModelAttribute(name = "dongSanPham") DongSanPham dongSanPham) {
        DongSanPham dongSanPhamUpdate = iDongSanPhamRepository.findById(id).get();
        dongSanPhamUpdate.setMa(dongSanPham.getMa());
        dongSanPhamUpdate.setTen(dongSanPham.getTen());
        iDongSanPhamRepository.save(dongSanPhamUpdate);
        model.addAttribute("message", "UPDATE-THANH-CONG");
        return chuyenTrang(model);
    }
}
