package com.application.TimetableUniversity.service;
import com.application.TimetableUniversity.model.Lesson;
import com.application.TimetableUniversity.repository.LessonRepository;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class LessonService {
    private final LessonRepository lessonRepository;
    public LessonService(LessonRepository lessonRepository) {
        this.lessonRepository = lessonRepository;
    }

    public Lesson findById(Long id) {
        return lessonRepository.getReferenceById(id);
    }

    public void saveLesson(Lesson lesson) {
        lessonRepository.save(lesson);
    }

    public List<Lesson> findAll() {
        return lessonRepository.findAll();
    }

    public void deleteById(Long id) {
        lessonRepository.deleteById(id);
    }

}

