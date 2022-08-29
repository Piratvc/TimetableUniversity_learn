package com.application.TimetableUniversity.service;
import com.application.TimetableUniversity.model.Lecturer;
import com.application.TimetableUniversity.repository.LecturerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class LecturerService {
    private final LecturerRepository lecturerRepository;

    @Autowired
    public LecturerService(LecturerRepository lecturerRepository) {
        this.lecturerRepository = lecturerRepository;
    }

    public Lecturer findById(Long id) {
        return lecturerRepository.getReferenceById(id);
    }

    public void saveLecturer(Lecturer lecturer) {
        lecturerRepository.save(lecturer);
    }

    public List<Lecturer> findAll() {
        return lecturerRepository.findAll();
    }

    public void deleteById(Long id) {
        lecturerRepository.deleteById(id);
    }
}
