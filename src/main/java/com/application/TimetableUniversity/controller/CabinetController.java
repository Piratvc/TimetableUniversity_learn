package com.application.TimetableUniversity.controller;
import com.application.TimetableUniversity.model.Cabinet;
import com.application.TimetableUniversity.service.CabinetService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import java.util.List;

@Controller
public class CabinetController {
    private final CabinetService cabinetService;

    @Autowired
    public CabinetController(CabinetService cabinetService) {
        this.cabinetService = cabinetService;
    }

    @GetMapping("/cabinets")
    public String findAll(Model model) {
        List<Cabinet> cabinets = cabinetService.findAll();
        model.addAttribute("cabinets", cabinets);
        return "cabinets-list";
    }

    @GetMapping("/cabinet-create")
    public String createCabinetForm(Cabinet cabinet) {
        return "cabinet-create";
    }

    @PostMapping("/cabinet-create")
    public String createCabinet(Cabinet cabinet) {
        cabinetService.saveCabinet(cabinet);
        return "redirect:/cabinets";
    }

    @GetMapping("cabinet-delete/{id}")
    public String deleteCabinet(@PathVariable("id") Long id) {
        cabinetService.deleteById(id);
        return "redirect:/cabinets";
    }

    @GetMapping("/cabinet-update/{id}")
    public String updateCabinetForm(@PathVariable("id") Long id, Model model) {
        Cabinet cabinet = cabinetService.findById(id);
        model.addAttribute("cabinet", cabinet);
        return "cabinet-update";
    }

    @PostMapping("/cabinet-update")
    public String updateCabinet(Cabinet cabinet) {
        cabinetService.saveCabinet(cabinet);
        return "redirect:/cabinets";
    }
}
