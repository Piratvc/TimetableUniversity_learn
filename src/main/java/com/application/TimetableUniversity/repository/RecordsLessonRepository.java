package com.application.TimetableUniversity.repository;
import com.application.TimetableUniversity.model.Group;
import com.application.TimetableUniversity.model.RecordLesson;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.Date;
import java.util.List;


@Repository
public interface RecordsLessonRepository extends JpaRepository<RecordLesson, Long> {
    List<RecordLesson> findByTimeAndGroups(Date time, Group group);
    List<RecordLesson> findByGroups(Group group);
}
