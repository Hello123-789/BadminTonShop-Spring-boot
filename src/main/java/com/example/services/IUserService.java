package com.example.services;

import java.util.List;
import java.util.Optional;

import com.example.entity.User;

public interface IUserService {

    List<User> findAll();

    List<User> search(String keyword);

    Optional<User> findById(int id);

    Optional<User> findByUsername(String username);

    <S extends User> S save(S entity);

    void deleteById(int id);

    boolean existsByUsername(String username);

    boolean existsByEmail(String email);
}
