package com.paige.productsCategories.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.paige.productsCategories.models.Category;
import com.paige.productsCategories.models.Product;
import com.paige.productsCategories.repositories.CategoryRepository;
import com.paige.productsCategories.repositories.ProductRepository;

@Service
public class ProductService {
	private final CategoryRepository categoryRepository;
	private final ProductRepository productRepository;
	
	public ProductService (CategoryRepository categoryRepository, ProductRepository productRepository){
		this.categoryRepository = categoryRepository;
		this.productRepository = productRepository;
	}
	
	public List<Product> allProduct(){
		return productRepository.findAll();
	}
	
	public Product save(Product product) {
		return productRepository.save(product);
	}
	
	public Product findProduct(Long id) {
		Optional<Product> optProduct = productRepository.findById(id);
		if(optProduct.isPresent()) {
			return optProduct.get();
		}
		else {
			return null;
		}
	}
//	all the categories listed for this specific product
	public List<Category> allCategories(Product product){
		return categoryRepository.findAllByProducts(product); 
	}
	
//	previously unassigned categories to this specific product
	public List<Category> unassignedCategories(Product product){
		return categoryRepository.findByProductsNotContains(product);
	}
	

}
