package com.application.TimetableUniversity.service;
import com.application.TimetableUniversity.model.*;
import jakarta.transaction.Transactional;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.orm.jpa.JpaObjectRetrievalFailureException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@Transactional
class ServicesTest {
    private final RecordsService recordsService;
    private final CabinetService cabinetService;
    private final LecturerService lecturerService;
    private final LessonService lessonService;
    private final GroupService groupService;

    @Autowired
    public ServicesTest(RecordsService recordsService, CabinetService cabinetService, LecturerService lecturerService, LessonService lessonService, GroupService groupService) {
        this.recordsService = recordsService;
        this.cabinetService = cabinetService;
        this.lecturerService = lecturerService;
        this.lessonService = lessonService;
        this.groupService = groupService;
    }

    @Test
    void saveRecordTest() {
        RecordLesson recordLesson = new RecordLesson();
        recordLesson.setLecturer(lecturerService.findById(1L));
        recordLesson.setLesson(lessonService.findById(1L));
        recordLesson.setCabinet(cabinetService.findById(1L));
        List<Group> groupList = new ArrayList<>();
        groupList.add(groupService.findById(1L));
        recordLesson.setGroups(groupList);
        recordLesson.setTime(Date.valueOf("2022-08-12"));
        recordsService.saveRecord(recordLesson);
        assertNotNull(recordLesson.getId());
    }

    @Test
    void findRecordsByIdTest() {
        RecordLesson recordLessonTest = recordsService.findById(1L);
        assertEquals(recordLessonTest.getId(), 1L);
    }

    @Test
    void findAllRecordsTest() {
        assertEquals(recordsService.findAll().size(), 6);
    }

    @Test
    void deleteByIdRecordTest() {
        boolean testResult = false;
        recordsService.deleteById(2L);
        try {
            recordsService.findById(2L);
        } catch (JpaObjectRetrievalFailureException e) {
            testResult = true;
        } finally {
            assertTrue(testResult);
        }
    }

    @Test
    void saveCabinetTest() {
        Cabinet cabinetTest = new Cabinet();
        cabinetTest.setCabinetNumber((short) 771);
        cabinetTest.setTitle("Кабинет информатики");
        cabinetService.saveCabinet(cabinetTest);
        assertNotNull(cabinetTest.getId());
    }

    @Test
    void findCabinetByIdTest() {
        Cabinet cabinet = cabinetService.findById(1L);
        Cabinet cabinetTest = new Cabinet();
        cabinetTest.setCabinetNumber((short) 771);
        cabinetTest.setTitle("Кабинет информатики");
        assertEquals(cabinet.getCabinetNumber(), cabinetTest.getCabinetNumber());
        assertEquals(cabinet.getTitle(), cabinetTest.getTitle());
    }

    @Test
    void deleteCabinetByIdTest() {
        boolean testResult = false;
        cabinetService.deleteById(1L);
        try {
            cabinetService.findById(1L);
        } catch (JpaObjectRetrievalFailureException e) {
            testResult = true;
        } finally {
            assertTrue(testResult);
        }
    }

    @Test
    void findAllCabinetTest() {
        List<Cabinet> cabinets = cabinetService.findAll();
        assertEquals(5, cabinets.size());
    }

    @Test
    void getRecordsLessonByStudentIdAndDateTest() throws ParseException {
        java.util.Date time = new SimpleDateFormat("yyyy-MM-dd").parse("2022-08-08");
        List<RecordLesson> records = recordsService.getRecordsLessonByStudentIdAndDate(17L, time);
        assertEquals(records.size(), 2);
        time = new SimpleDateFormat("yyyy-MM-dd").parse("2022-08-20");
        records = recordsService.getRecordsLessonByStudentIdAndDate(17L, time);
        assertEquals(records.size(), 1);
    }

    @Test
    void getRecordsLessonByStudentIdTest() {
        List<RecordLesson> records = recordsService.getRecordsLessonByStudentId(17L);
        assertEquals(records.size(), 3);
    }
}