package com.example.assignment.controller;

import com.example.assignment.model.HoaDonChiTiet;
import com.example.assignment.repository.IHoaDonChiTietRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/view-hoa-don")
public class HoaDonController {
    @Autowired
    private IHoaDonChiTietRepository iHoaDonChiTietRepository;

    @GetMapping("/hoa-don")
    public String viewHoaDon(Model model, @RequestParam(defaultValue = "1") int page) {
        Page<HoaDonChiTiet> hoaDonChiTietPage;
        if (page < 1) {
            page = 1;
        }
        Sort sort = Sort.by("ngayTao").descending();
        Pageable pageable = PageRequest.of(page - 1, 20, sort);
        hoaDonChiTietPage = iHoaDonChiTietRepository.findAll(pageable);
        model.addAttribute("hoaDonChiTietPage", hoaDonChiTietPage);
        return "view-hoa-don/view-hoa-don";
    }
}
