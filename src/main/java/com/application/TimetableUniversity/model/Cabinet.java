package com.application.TimetableUniversity.model;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.hibernate.Hibernate;
import jakarta.persistence.*;
import java.util.Objects;

@Getter
@Setter
@RequiredArgsConstructor
@Entity
@Table(name = "cabinets")
public class Cabinet {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "cabinetnumber")
    private short cabinetNumber;

    @Column(name = "title")
    private String title;

    @Override
    public String toString() {
        return   cabinetNumber + ", " + title;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        Cabinet cabinet = (Cabinet) o;
        return id != null && Objects.equals(id, cabinet.id);
    }

    @Override
    public int hashCode() {
        return getClass().hashCode();
    }
}
