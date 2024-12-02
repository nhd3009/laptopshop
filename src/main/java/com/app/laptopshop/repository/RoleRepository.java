package com.app.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.app.laptopshop.domain.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {

    Role findByName(String name);
}
