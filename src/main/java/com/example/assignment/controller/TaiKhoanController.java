package com.example.assignment.controller;

import com.example.assignment.model.TaiKhoan;
import com.example.assignment.repository.ITaiKhoanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/view-tai-khoan")
public class TaiKhoanController {
    @Autowired
    private ITaiKhoanRepository iTaiKhoanRepository;

    private String chuyenTrang(Model model) {
        model.addAttribute("listTaiKhoans", iTaiKhoanRepository.findAll());
        return "/view-tai-khoan/tai-khoan";
    }

    @GetMapping
    public String viewTaiKhoan(Model model) {
        return chuyenTrang(model);
    }

    @PostMapping("/add")
    public String saveBoNho(Model model, @ModelAttribute(name = "taiKhoan") TaiKhoan taiKhoan) {
        iTaiKhoanRepository.save(new TaiKhoan(null, taiKhoan.getMa(), taiKhoan.getHoTen(), taiKhoan.getNgaySinh(), taiKhoan.getEmail(), taiKhoan.getSoDienThoai(), taiKhoan.getDiaChi(), taiKhoan.getTaiKhoan(), taiKhoan.getMatKhau(), taiKhoan.getVaiTro(), taiKhoan.getTrangThai()));
        model.addAttribute("message", "ADD THÀNH CÔNG");
        return chuyenTrang(model);
    }

    @GetMapping("/detail/{id}")
    public String detailBoNho(Model model, @PathVariable("id") String id) {
        TaiKhoan taiKhoan = iTaiKhoanRepository.findById(id).get();
        model.addAttribute("taiKhoan", taiKhoan);
        model.addAttribute("message", "DETAIL THÀNH CÔNG");
        return chuyenTrang(model);
    }

    @GetMapping("/delete/{id}")
    public String deleteBoNho(Model model, @PathVariable("id") String id) {
        iTaiKhoanRepository.deleteById(id);
        model.addAttribute("message", "DELETE THÀNH CÔNG");
        return chuyenTrang(model);
    }

    @GetMapping("/view-update/{id}")
    public String viewUpdateBoNho(Model model, @PathVariable("id") String id) {
        model.addAttribute("taiKhoan", iTaiKhoanRepository.findById(id).get());
        model.addAttribute("message", "VIEW-UPDATE");
        return "/view-tai-khoan/update-tai-khoan";
    }

    @PostMapping("/update/{id}")
    public String updateMauSac(Model model, @PathVariable("id") String id, @ModelAttribute(name = "taiKhoan") TaiKhoan taiKhoan) {
        TaiKhoan taiKhoanUpdate = iTaiKhoanRepository.findById(id).get();
        taiKhoanUpdate.setMa(taiKhoan.getMa());
        taiKhoanUpdate.setHoTen(taiKhoan.getHoTen());
        taiKhoanUpdate.setNgaySinh(taiKhoan.getNgaySinh());
        taiKhoanUpdate.setEmail(taiKhoan.getEmail());
        taiKhoanUpdate.setSoDienThoai(taiKhoan.getSoDienThoai());
        taiKhoanUpdate.setDiaChi(taiKhoan.getDiaChi());
        taiKhoanUpdate.setTaiKhoan(taiKhoan.getTaiKhoan());
        taiKhoanUpdate.setMatKhau(taiKhoan.getMatKhau());
        taiKhoanUpdate.setVaiTro(taiKhoan.getVaiTro());
        taiKhoanUpdate.setTrangThai(taiKhoan.getTrangThai());
        iTaiKhoanRepository.save(taiKhoanUpdate);
        model.addAttribute("message", "UPDATE-THANH-CONG");
        return chuyenTrang(model);
    }
}
