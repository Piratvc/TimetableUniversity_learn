package com.application.TimetableUniversity.model;
import lombok.*;
import org.hibernate.Hibernate;
//import javax.persistence.*;
import jakarta.persistence.*;
import java.util.Objects;

@Getter
@Setter
@RequiredArgsConstructor
@Entity
@Table(name = "groups")
public class Group {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "numbercource")
    private short numberCource;

    @Column(name = "numbergroup")
    private short numberGroup;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        Group group = (Group) o;
        return id != null && Objects.equals(id, group.id);
    }

    @Override
    public int hashCode() {
        return getClass().hashCode();
    }

    @Override
    public String toString() {
        return "Курс " + numberCource + ", группа " + numberGroup;
    }
}
