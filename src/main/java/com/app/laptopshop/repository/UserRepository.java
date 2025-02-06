package com.app.laptopshop.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.app.laptopshop.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    void deleteById(long id);

    List<User> findByEmail(String email);

    User findById(long id);

    boolean existsByEmail(String email);

    User findUserByEmail(String email);

    Page<User> findAll(Pageable pageable);
}
