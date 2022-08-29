package com.application.TimetableUniversity.controller;
import com.application.TimetableUniversity.model.Lecturer;
import com.application.TimetableUniversity.service.LecturerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class LecturerController {
    private final LecturerService lecturerService;

    @Autowired
    public LecturerController(LecturerService lecturerService) {
        this.lecturerService = lecturerService;
    }

    @GetMapping("/lecturers")
    public String findAll(Model model) {
        List<Lecturer> lecturers = lecturerService.findAll();
        model.addAttribute("lecturers", lecturers);
        return "lecturers-list";
    }

    @GetMapping("/lecturer-create")
    public String createLecturerForm(Lecturer lecturer) {
        return "lecturer-create";
    }

    @PostMapping("/lecturer-create")
    public String createLecturer(Lecturer lecturer) {
        lecturerService.saveLecturer(lecturer);
        return "redirect:/lecturers";
    }

    @GetMapping("lecturer-delete/{id}")
    public String deleteLecturer(@PathVariable("id") Long id) {
        lecturerService.deleteById(id);
        return "redirect:/lecturers";
    }

    @GetMapping("/lecturer-update/{id}")
    public String updateLecturerForm(@PathVariable("id") Long id, Model model) {
        Lecturer lecturer = lecturerService.findById(id);
        model.addAttribute("lecturer", lecturer);
        return "lecturer-update";
    }

    @PostMapping("/lecturer-update")
    public String updateLecturer(Lecturer lecturer) {
        lecturerService.saveLecturer(lecturer);
        return "redirect:/lecturers";
    }

}
