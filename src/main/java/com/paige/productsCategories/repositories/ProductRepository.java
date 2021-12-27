package com.paige.productsCategories.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.paige.productsCategories.models.Category;
import com.paige.productsCategories.models.Product;

public interface ProductRepository extends CrudRepository <Product, Long> {
	List<Product> findAll();
    List<Product> findAllByCategories(Category category);   
    // Retrieves a list of any categories a particular product
    // does not belong to.
    List<Product> findByCategoriesNotContains(Category category);

}

