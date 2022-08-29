package com.application.TimetableUniversity.controller;
import com.application.TimetableUniversity.model.Lesson;
import com.application.TimetableUniversity.service.LessonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;
@Controller
public class LessonController {
    private final LessonService lessonService;

    @Autowired
    public LessonController(LessonService lessonService) {
        this.lessonService = lessonService;
    }

    @GetMapping("/lessons")
    public String findAll(Model model) {
        List<Lesson> lessons = lessonService.findAll();
        model.addAttribute("lessons", lessons);
        return "lessons-list";
    }

    @GetMapping("/lesson-create")
    public String createLessonForm(Lesson lesson) {
        return "lesson-create";
    }

    @PostMapping("/lesson-create")
    public String createLesson(Lesson lesson) {
        lessonService.saveLesson(lesson);
        return "redirect:/lessons";
    }

    @GetMapping("lesson-delete/{id}")
    public String deleteLesson(@PathVariable("id") Long id) {
        lessonService.deleteById(id);
        return "redirect:/lessons";
    }

    @GetMapping("/lesson-update/{id}")
    public String updateLessonForm(@PathVariable("id") Long id, Model model) {
        Lesson lesson = lessonService.findById(id);
        model.addAttribute("lesson", lesson);
        return "lesson-update";
    }

    @PostMapping("/lesson-update")
    public String updateLesson(Lesson lesson) {
        lessonService.saveLesson(lesson);
        return "redirect:/lessons";
    }
}
