package com.paige.productsCategories.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.paige.productsCategories.models.Category;
import com.paige.productsCategories.models.Product;
import com.paige.productsCategories.repositories.CategoryRepository;
import com.paige.productsCategories.repositories.ProductRepository;

@Service
public class CategoryService {
	private final CategoryRepository categoryRepository;
	private final ProductRepository productRepository;
	
	public CategoryService (CategoryRepository categoryRepository, ProductRepository productRepository){
		this.categoryRepository = categoryRepository;
		this.productRepository = productRepository;
	}
	
	public List<Category> allCategories(){
		return categoryRepository.findAll();
	}
	
	public Category save(Category category){
		return categoryRepository.save(category);
	}
	
	public Category findCategory(Long id) {
		Optional<Category> optCat = categoryRepository.findById(id);
		if (optCat.isPresent()) {
			return optCat.get();		
			}
		else {
			return null;
		}
	}
	
	public List<Product> getProducts(Category category){
		return productRepository.findAllByCategories(category);
	}
	
	public List<Product> unassignedProducts(Category category){
		return productRepository.findByCategoriesNotContains(category);
	}
}
