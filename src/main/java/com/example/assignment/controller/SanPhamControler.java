package com.example.assignment.controller;

import com.example.assignment.model.SanPham;
import com.example.assignment.repository.ISanPhamRepository;
import com.example.assignment.util.FileUploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@Controller
@RequestMapping("/view-san-pham")
public class SanPhamControler {
    @Autowired
    private ISanPhamRepository iSanPhamRepository;

    private String chuyenTrang(Model model) {
        model.addAttribute("listSanPhams", iSanPhamRepository.findAll());
        return "/view-san-pham/san-pham";
    }

    @GetMapping
    public String viewSanPham(Model model) {
        return chuyenTrang(model);
    }

    @PostMapping("/add")
    public String saveNhaSanXuat(Model model, @ModelAttribute(name = "sanPham") SanPham sanPham, @RequestParam("images") MultipartFile multipartFile) throws IOException {
        String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
        String uploadDir = "uploads/";
        FileUploadUtil.saveFile(uploadDir, fileName, multipartFile);
        iSanPhamRepository.save(new SanPham(null, sanPham.getMa(), fileName, sanPham.getTen()));
        model.addAttribute("message", "ADD THÀNH CÔNG");
        return chuyenTrang(model);
    }

    @GetMapping("/detail/{id}")
    public String detailNhaSanXuat(Model model, @PathVariable("id") String id) {
        SanPham sanPham = iSanPhamRepository.findById(id).get();
        model.addAttribute("sanPham", sanPham);
        model.addAttribute("message", "DETAIL THÀNH CÔNG");
        return chuyenTrang(model);
    }

    @GetMapping("/delete/{id}")
    public String deleteNhaSanXuat(Model model, @PathVariable("id") String id) {
        iSanPhamRepository.deleteById(id);
        model.addAttribute("message", "DELETE THÀNH CÔNG");
        return chuyenTrang(model);
    }

    @GetMapping("/view-update/{id}")
    public String viewUpdateNhaSanXuat(Model model, @PathVariable("id") String id) {
        model.addAttribute("sanPham", iSanPhamRepository.findById(id).get());
        model.addAttribute("message", "VIEW-UPDATE");
        return "/view-san-pham/update-san-pham";
    }

    @PostMapping("/update/{id}")
    public String updateNhaSanXuat(Model model, @PathVariable("id") String id, @ModelAttribute(name = "sanPham") SanPham sanPham, @RequestParam("images") MultipartFile multipartFile) throws IOException {
        SanPham sanPhamUpdate = iSanPhamRepository.findById(id).get();
        String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
        String uploadDir = "uploads/";
        FileUploadUtil.saveFile(uploadDir, fileName, multipartFile);
        sanPhamUpdate.setMa(sanPham.getMa());
        sanPhamUpdate.setAnh(fileName);
        sanPhamUpdate.setTen(sanPham.getTen());
        iSanPhamRepository.save(sanPhamUpdate);
        model.addAttribute("message", "UPDATE-THANH-CONG");
        return chuyenTrang(model);
    }
}
