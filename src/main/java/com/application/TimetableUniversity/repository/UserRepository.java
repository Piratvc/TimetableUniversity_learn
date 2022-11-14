package com.application.TimetableUniversity.repository;

import com.application.TimetableUniversity.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
    User findByName(String name);
}
