package com.example.assignment.controller;

import com.example.assignment.model.NhaSanXuat;
import com.example.assignment.repository.INhaSanXuatRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/view-nha-san-xuat")
public class NhaSanXuatController {
    @Autowired
    private INhaSanXuatRepository iNhaSanXuatRepository;

    private String chuyenTrang(Model model) {
        model.addAttribute("listNhaSanXuats", iNhaSanXuatRepository.findAll());
        return "/view-nha-san-xuat/nha-san-xuat";
    }

    @GetMapping
    public String viewNhaSanXuat(Model model) {
        return chuyenTrang(model);
    }
    @PostMapping("/add")
    public String saveNhaSanXuat(Model model, @ModelAttribute(name = "nhaSanXuat") NhaSanXuat nhaSanXuat) {
        iNhaSanXuatRepository.save(new NhaSanXuat(null, nhaSanXuat.getMa(), nhaSanXuat.getTen()));
        model.addAttribute("message", "ADD THÀNH CÔNG");
        return chuyenTrang(model);
    }

    @GetMapping("/detail/{id}")
    public String detailNhaSanXuat(Model model, @PathVariable("id") String id) {
        NhaSanXuat nhaSanXuat = iNhaSanXuatRepository.findById(id).get();
        model.addAttribute("nhaSanXuat", nhaSanXuat);
        model.addAttribute("message", "DETAIL THÀNH CÔNG");
        return chuyenTrang(model);
    }

    @GetMapping("/delete/{id}")
    public String deleteNhaSanXuat(Model model, @PathVariable("id") String id) {
        iNhaSanXuatRepository.deleteById(id);
        model.addAttribute("message", "DELETE THÀNH CÔNG");
        return chuyenTrang(model);
    }

    @GetMapping("/view-update/{id}")
    public String viewUpdateNhaSanXuat(Model model, @PathVariable("id") String id) {
        model.addAttribute("nhaSanXuat", iNhaSanXuatRepository.findById(id).get());
        model.addAttribute("message", "VIEW-UPDATE");
        return "/view-nha-san-xuat/update-nha-san-xuat";
    }

    @PostMapping("/update/{id}")
    public String updateNhaSanXuat(Model model, @PathVariable("id") String id, @ModelAttribute(name = "nhaSanXuat") NhaSanXuat nhaSanXuat) {
        NhaSanXuat nhaSanXuatUpdate = iNhaSanXuatRepository.findById(id).get();
        nhaSanXuatUpdate.setMa(nhaSanXuat.getMa());
        nhaSanXuatUpdate.setTen(nhaSanXuat.getTen());
        iNhaSanXuatRepository.save(nhaSanXuatUpdate);
        model.addAttribute("message", "UPDATE-THANH-CONG");
        return chuyenTrang(model);
    }
}
