package com.example.assignment.controller;

import com.example.assignment.model.ChiTietSanPham;
import com.example.assignment.repository.IChiTietSanPhamRepository;
import com.example.assignment.repository.IHoaDonChiTietRepository;
import com.example.assignment.service.IThongKeService;
import com.example.assignment.viewmodel.HoaDonChiTietViewModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/thong-ke")
public class ThongKeController {
    @Autowired
    private IHoaDonChiTietRepository iHoaDonChiTietRepository;
    @Autowired
    private IThongKeService iThongKeService;
    @Autowired
    private IChiTietSanPhamRepository iChiTietSanPhamRepository;

    @GetMapping
    public String viewThongKe(Model model) {
        // CODE PHẦN SẢN PHẨM BÁN CHẠY
        Map<String, Integer> thongKeSoLuong = iThongKeService.tinhTongSoLuong(iHoaDonChiTietRepository.getSoLuongAndChiTietSanPhamByDateRange());
        model.addAttribute("thongKeSoLuong", thongKeSoLuong);

        int soLuongPhanTu = thongKeSoLuong.size();
        System.out.println("Số lượng phần tử trong Map: " + soLuongPhanTu);

        List<HoaDonChiTietViewModel> listss = new ArrayList<>();

        for (Map.Entry<String, Integer> entry : thongKeSoLuong.entrySet()) {
            String id = entry.getKey();
            int tongSoLuong = entry.getValue();
            ChiTietSanPham chiTietSanPham = iChiTietSanPhamRepository.findById(id).get();
            listss.add(new HoaDonChiTietViewModel(tongSoLuong, chiTietSanPham));
        }
        Collections.sort(listss, new Comparator<HoaDonChiTietViewModel>() {
            @Override
            public int compare(HoaDonChiTietViewModel o1, HoaDonChiTietViewModel o2) {
                return o2.getSoLuong().compareTo(o1.getSoLuong());
            }
        });
        List<HoaDonChiTietViewModel> first10Elements = listss.subList(0, Math.min(listss.size(), 10));
        //

//         CODE PHẦN TỒN KHO
        List<ChiTietSanPham> listChiTietSanPhams = iChiTietSanPhamRepository.getSanPhamTonKho();
        model.addAttribute("listChiTietSanPhams", listChiTietSanPhams);
        model.addAttribute("listss", first10Elements);
        return "trang-thong-ke";
    }

    @GetMapping("/thong-ke-search")
    public String searchByGiaTri(Model model, @RequestParam("giaTriThongKe") String giaTriThongKe) {
        LocalDate layNgay = null;
        LocalDate today = LocalDate.now();
        if (giaTriThongKe.equals("NGAY")) {
            layNgay = LocalDate.now();
        } else if (giaTriThongKe.equals("TUAN")) {
            layNgay = today.minusDays(7);
        } else if (giaTriThongKe.equals("THANG")) {
            layNgay = today.minusMonths(1);
        } else {
            layNgay = today.minusMonths(100);
        }
        System.out.println(today);
        System.out.println(layNgay);
        Map<String, Integer> thongKeSoLuong = iThongKeService.tinhTongSoLuong(iHoaDonChiTietRepository.getSoLuongAndChiTietSanPhamByDateRange(Date.from(layNgay.atStartOfDay(ZoneId.systemDefault()).toInstant()), Date.from(today.atStartOfDay(ZoneId.systemDefault()).toInstant())));
        model.addAttribute("thongKeSoLuong", thongKeSoLuong);

        int soLuongPhanTu = thongKeSoLuong.size();
        System.out.println("Số lượng phần tử trong Map: " + soLuongPhanTu);

        List<HoaDonChiTietViewModel> listss = new ArrayList<>();

        for (Map.Entry<String, Integer> entry : thongKeSoLuong.entrySet()) {
            String id = entry.getKey();
            int tongSoLuong = entry.getValue();
            ChiTietSanPham chiTietSanPham = iChiTietSanPhamRepository.findById(id).get();
            listss.add(new HoaDonChiTietViewModel(tongSoLuong, chiTietSanPham));
        }
        Collections.sort(listss, new Comparator<HoaDonChiTietViewModel>() {
            @Override
            public int compare(HoaDonChiTietViewModel o1, HoaDonChiTietViewModel o2) {
                return o2.getSoLuong().compareTo(o1.getSoLuong());
            }
        });
        List<HoaDonChiTietViewModel> first10Elements = listss.subList(0, Math.min(listss.size(), 10));

//      CODE PHẦN TỒN KHO
        List<ChiTietSanPham> listChiTietSanPhams = iChiTietSanPhamRepository.getSanPhamTonKho();
        model.addAttribute("listChiTietSanPhams", listChiTietSanPhams);
        model.addAttribute("listss", first10Elements);
        return "trang-thong-ke";
    }
    @GetMapping("/trang-chu")
    public String viewTrangChu(Model model) {
        // CODE PHẦN SẢN PHẨM BÁN CHẠY
        Map<String, Integer> thongKeSoLuong = iThongKeService.tinhTongSoLuong(iHoaDonChiTietRepository.getSoLuongAndChiTietSanPhamByDateRange());
        model.addAttribute("thongKeSoLuong", thongKeSoLuong);

        int soLuongPhanTu = thongKeSoLuong.size();
        System.out.println("Số lượng phần tử trong Map: " + soLuongPhanTu);

        List<HoaDonChiTietViewModel> listss = new ArrayList<>();

        for (Map.Entry<String, Integer> entry : thongKeSoLuong.entrySet()) {
            String id = entry.getKey();
            int tongSoLuong = entry.getValue();
            ChiTietSanPham chiTietSanPham = iChiTietSanPhamRepository.findById(id).get();
            listss.add(new HoaDonChiTietViewModel(tongSoLuong, chiTietSanPham));
        }
        Collections.sort(listss, new Comparator<HoaDonChiTietViewModel>() {
            @Override
            public int compare(HoaDonChiTietViewModel o1, HoaDonChiTietViewModel o2) {
                return o2.getSoLuong().compareTo(o1.getSoLuong());
            }
        });
        List<HoaDonChiTietViewModel> first10Elements = listss.subList(0, Math.min(listss.size(), 10));
        //TỒN KHO
        List<ChiTietSanPham> listChiTietSanPhams = iChiTietSanPhamRepository.getSanPhamTonKho();
        model.addAttribute("listChiTietSanPhams", listChiTietSanPhams);
        model.addAttribute("listss", first10Elements);
        return "trang-chu";
    }
}
