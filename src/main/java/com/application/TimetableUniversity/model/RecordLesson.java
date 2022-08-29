package com.application.TimetableUniversity.model;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.hibernate.Hibernate;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Getter
@Setter
@RequiredArgsConstructor
@Entity
@Table(name = "recordslessons")
public class RecordLesson {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "cabinet_fk")
    private Cabinet cabinet;

    @OneToMany
    @JoinTable(
            name = "groups_recordslessons",
            joinColumns = @JoinColumn(name = "recordslessons_id"),
            inverseJoinColumns = @JoinColumn(name = "group_id"))
    private List<Group> groups = new ArrayList<>();


    @ManyToOne
    @JoinColumn(name = "lecturername_fk")
    private Lecturer lecturer;

    @ManyToOne
    @JoinColumn(name = "lessontitle_fk")
    private Lesson lesson;

    @Column(name = "time")
    private Date time;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        RecordLesson that = (RecordLesson) o;
        return id != null && Objects.equals(id, that.id);
    }

    @Override
    public int hashCode() {
        return getClass().hashCode();
    }
}
