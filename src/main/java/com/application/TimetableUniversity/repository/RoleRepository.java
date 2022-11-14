package com.application.TimetableUniversity.repository;

import com.application.TimetableUniversity.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Long> {
    Role findByName(String name);
}
