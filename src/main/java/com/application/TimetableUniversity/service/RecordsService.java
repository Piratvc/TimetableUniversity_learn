package com.application.TimetableUniversity.service;
import com.application.TimetableUniversity.model.RecordLesson;
import com.application.TimetableUniversity.model.Student;
import com.application.TimetableUniversity.repository.RecordsLessonRepository;
import com.application.TimetableUniversity.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Date;
import java.util.List;

@Service
public class RecordsService {
    @Autowired
    private final RecordsLessonRepository recordsLessonRepository;
    @Autowired
    private final StudentRepository studentRepository;

    public RecordsService(RecordsLessonRepository recordsLessonRepository, StudentRepository studentRepository) {
        this.recordsLessonRepository = recordsLessonRepository;
        this.studentRepository = studentRepository;
    }
    public RecordLesson findById(Long id) {
        return recordsLessonRepository.getReferenceById(id);
    }

    public void saveRecord(RecordLesson recordLesson) {
        recordsLessonRepository.save(recordLesson);
    }

    public List<RecordLesson> findAll() {
        return recordsLessonRepository.findAll();
    }

    public void deleteById(Long id) {
        recordsLessonRepository.deleteById(id);
    }

    public List<RecordLesson> getRecordsLessonByStudentIdAndDate(Long id, Date time) {
        Student student = studentRepository.getReferenceById(id);
        return recordsLessonRepository.findByTimeAndGroups(time, student.getGroupFk());
    }

    public List<RecordLesson> getRecordsLessonByStudentId(Long id) {
        Student student = studentRepository.getReferenceById(id);
        return recordsLessonRepository.findByGroups(student.getGroupFk());
    }

    public List<RecordLesson> getRecordsLessonByLecturerIdAndDate(Long id, Date time) {
        return recordsLessonRepository.findByTimeAndLecturerId(time, id);
    }

    public List<RecordLesson> getRecordsLessonByLecturerId(Long id) {
        return recordsLessonRepository.findByLecturerId(id);
    }

}
