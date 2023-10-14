package com.example.assignment.controller;

import com.example.assignment.model.BoNho;
import com.example.assignment.repository.IBoNhoRepository;
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
@RequestMapping("/view-bo-nho")
public class BoNhoController {
    @Autowired
    private IBoNhoRepository iBoNhoRepository;
    private List<BoNho> listBoNhos = new ArrayList<>();

    private String chuyenTrang(Model model) {
        model.addAttribute("listBoNhos", iBoNhoRepository.findAll());
        return "view-bo-nho/bo-nho";
    }

    @GetMapping
    public String viewBoNho(Model model) {
        return chuyenTrang(model);
    }
    @PostMapping("/add")
    public String saveBoNho(Model model, @ModelAttribute(name = "boNho") BoNho boNho) {
        iBoNhoRepository.save(new BoNho(null, boNho.getMa(), boNho.getTen()));
        model.addAttribute("message", "ADD THÀNH CÔNG");
        return chuyenTrang(model);
    }

    @GetMapping("/detail/{id}")
    public String detailBoNho(Model model, @PathVariable("id") String id) {
        BoNho boNho = iBoNhoRepository.findById(id).get();
        model.addAttribute("boNho", boNho);
        model.addAttribute("message", "DETAIL THÀNH CÔNG");
        return chuyenTrang(model);
    }

    @GetMapping("/delete/{id}")
    public String deleteBoNho(Model model, @PathVariable("id") String id) {
        iBoNhoRepository.deleteById(id);
        model.addAttribute("message", "DELETE THÀNH CÔNG");
        return chuyenTrang(model);
    }

    @GetMapping("/view-update/{id}")
    public String viewUpdateBoNho(Model model, @PathVariable("id") String id) {
        model.addAttribute("boNho", iBoNhoRepository.findById(id).get());
        model.addAttribute("message", "VIEW-UPDATE");
        return "/view-bo-nho/update-bo-nho";
    }

    @PostMapping("/update/{id}")
    public String updateBoNho(Model model, @PathVariable("id") String id, @ModelAttribute(name = "boNho") BoNho boNho) {
        BoNho boNhoUpdate = iBoNhoRepository.findById(id).get();
        boNhoUpdate.setMa(boNho.getMa());
        boNhoUpdate.setTen(boNho.getTen());
        iBoNhoRepository.save(boNhoUpdate);
        model.addAttribute("message", "UPDATE-THANH-CONG");
        return chuyenTrang(model);
    }
}
