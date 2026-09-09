package com.example.services;

import java.util.List;
import java.util.Optional;

import com.example.entity.Category;

public interface ICategoryService {

    List<Category> findAll();

    List<Category> findByCategorynameContaining(String name);

    Optional<Category> findById(int id);

    <S extends Category> S save(S entity);

    void deleteById(int id);
}
