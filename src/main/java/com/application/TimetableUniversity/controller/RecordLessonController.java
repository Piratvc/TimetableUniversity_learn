package com.application.TimetableUniversity.controller;
import com.application.TimetableUniversity.model.RecordLesson;
import com.application.TimetableUniversity.service.RecordsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class RecordLessonController {
    @Autowired
    private final RecordsService recordsService;
    public RecordLessonController(RecordsService recordsService) {
        this.recordsService = recordsService;
    }
    @GetMapping("/records")
    public String findAll(Model model) {
        List<RecordLesson> records = recordsService.findAll();
        model.addAttribute("records", records);
        return "records-list";
    }

    @GetMapping("/record-create")
    public String createRecordForm(RecordLesson record) {
        return "record-create";
    }

    @PostMapping("/record-create")
    public String createRecord(RecordLesson record) {
        recordsService.saveRecord(record);
        return "redirect:/records";
    }

    @GetMapping("record-delete/{id}")
    public String deleteRecord(@PathVariable("id") Long id) {
        recordsService.deleteById(id);
        return "redirect:/records";
    }

    @GetMapping("/record-update/{id}")
    public String updateRecordForm(@PathVariable("id") Long id, Model model) {
        RecordLesson record = recordsService.findById(id);
        model.addAttribute("record", record);
        return "record-update";
    }

    @PostMapping("/record-update")
    public String updateRecord(RecordLesson record) {
        recordsService.saveRecord(record);
        return "redirect:/records";
    }

    @GetMapping("/records/{id}/{date}")
    public String findRecordsByStudentIdAndDate(@PathVariable("id") Long id, @PathVariable("date") String stringTime, Model model) throws ParseException {
        Date time = new SimpleDateFormat("yyyy-MM-dd").parse(stringTime);
        List<RecordLesson> records = recordsService.getRecordsLessonByStudentIdAndDate(id, time);
        model.addAttribute("records", records);
        return "records-personal-date";
    }

    @GetMapping("/records/{id}/")
    public String findRecordsByStudentId(@PathVariable("id") Long id, Model model) {
        List<RecordLesson> records = recordsService.getRecordsLessonByStudentId(id);
        model.addAttribute("records", records);
        return "records-personal";
    }
}
