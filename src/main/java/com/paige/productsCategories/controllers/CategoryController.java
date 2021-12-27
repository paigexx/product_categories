package com.paige.productsCategories.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.paige.productsCategories.models.Category;
import com.paige.productsCategories.models.Product;
import com.paige.productsCategories.services.CategoryService;
import com.paige.productsCategories.services.ProductService;

@Controller
public class CategoryController {
	private final CategoryService categoryService;
	private final ProductService productService;
	public CategoryController(CategoryService categoryService, ProductService productService) {
		this.categoryService = categoryService;
		this.productService = productService;
	}

	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("categories", categoryService.allCategories());
		model.addAttribute("products", productService.allProduct());
		return "index.jsp";
	}
	
	@GetMapping("/category/new")
	public String newCategory(@ModelAttribute("category") Category category) {
		return "newCategory.jsp";
	}
	
	@PostMapping("/category/save")
	public String saveCategory(@Valid @ModelAttribute("category") Category category, BindingResult result) {
		if(result.hasErrors()) {
			return "newCategory.jsp";
		}
		else {
			categoryService.save(category);
			return "redirect:/category/" + category.getId();
		}
	}
	
	@GetMapping("/category/{id}")
	public String showCategory(@PathVariable("id") Long id, Model model) {
		Category category = categoryService.findCategory(id);
		List<Product> products = categoryService.getProducts(categoryService.findCategory(id));
		List<Product> unassignedProducts = categoryService.unassignedProducts(category);
		model.addAttribute("products", products);
		model.addAttribute("category", category);
		model.addAttribute("unassignedProducts", unassignedProducts);
		return "showCategory.jsp";
		
	}
	
	@PostMapping("/category/{id}/addProduct")
	public String addProduct(@PathVariable("id") Long categoryId, 
							@RequestParam("productId") Long productId){
		Category category = categoryService.findCategory(categoryId);
		Product product = productService.findProduct(productId);
//		add to product list
		category.getProducts().add(product);
		categoryService.save(category);
		return "redirect:/category/" + categoryId;
		
	}
}
