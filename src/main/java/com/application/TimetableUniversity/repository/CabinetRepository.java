package com.application.TimetableUniversity.repository;

import com.application.TimetableUniversity.model.Cabinet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CabinetRepository extends JpaRepository<Cabinet, Long> {
}
