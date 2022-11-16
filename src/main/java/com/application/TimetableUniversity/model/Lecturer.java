package com.application.TimetableUniversity.model;

import lombok.*;
import org.hibernate.Hibernate;

//import javax.persistence.*;
import jakarta.persistence.*;
import java.util.Objects;


@Entity
@Getter
@Setter
@RequiredArgsConstructor
@Table(name = "lecturers")
public class Lecturer {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name = "name_id_fk")
    private User user;

    @Override
    public String toString() {
        return user.getName();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        Lecturer lecturer = (Lecturer) o;
        return getId() != null && Objects.equals(getId(), lecturer.getId());
    }
}
