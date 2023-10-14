package com.example.assignment.controller;

import com.example.assignment.model.MauSac;
import com.example.assignment.repository.IMauSacRepository;
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
@RequestMapping("/view-mau-sac")
public class MauSacController {
    @Autowired
    private IMauSacRepository iMauSacRepository;
    private List<MauSac> listMauSacs = new ArrayList<>();

    private String chuyenTrang(Model model) {
        model.addAttribute("listMauSacs", iMauSacRepository.findAll());
        return "view-mau-sac/mau-sac";
    }

    @GetMapping
    public String viewMauSac(Model model) {
        return chuyenTrang(model);
    }

    @PostMapping("/add")
    public String saveMauSac(Model model, @ModelAttribute(name = "mauSac") MauSac mauSac) {
        iMauSacRepository.save(new MauSac(null, mauSac.getMa(), mauSac.getTen()));
        model.addAttribute("message", "ADD THÀNH CÔNG");
        return chuyenTrang(model);
    }

    @GetMapping("/detail/{id}")
    public String detailMauSac(Model model, @PathVariable("id") String id) {
        MauSac mauSac = iMauSacRepository.findById(id).get();
        model.addAttribute("mauSac", mauSac);
        model.addAttribute("message", "DETAIL THÀNH CÔNG");
        return chuyenTrang(model);
    }

    @GetMapping("/delete/{id}")
    public String deleteMauSac(Model model, @PathVariable("id") String id) {
        iMauSacRepository.deleteById(id);
        model.addAttribute("message", "DELETE THÀNH CÔNG");
        return chuyenTrang(model);
    }

    @GetMapping("/view-update/{id}")
    public String viewUpdateMauSac(Model model, @PathVariable("id") String id) {
        model.addAttribute("mauSac", iMauSacRepository.findById(id).get());
        model.addAttribute("message", "VIEW-UPDATE");
        return "/view-mau-sac/update-mau-sac";
    }

    @PostMapping("/update/{id}")
    public String updateMauSac(Model model, @PathVariable("id") String id, @ModelAttribute(name = "mauSac") MauSac mauSac) {
        MauSac mauSacUpdate = iMauSacRepository.findById(id).get();
        mauSacUpdate.setMa(mauSac.getMa());
        mauSacUpdate.setTen(mauSac.getTen());
        iMauSacRepository.save(mauSacUpdate);
        model.addAttribute("message", "UPDATE-THANH-CONG");
        return chuyenTrang(model);
    }
}
