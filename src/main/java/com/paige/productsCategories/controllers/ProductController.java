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
public class ProductController {
	private final ProductService productService;
	private final CategoryService categoryService;
	
	public ProductController(ProductService productService, CategoryService categoryService) {
		this.productService = productService;
		this.categoryService = categoryService;
	}
	
	@GetMapping("/product/new")
	public String newProduct(@ModelAttribute("product") Product product) {
		return "newProduct.jsp";
	}
	
	@PostMapping("product/save")
	public String saveProduct(@Valid @ModelAttribute("product") Product product, BindingResult result) {
		if (result.hasErrors()) {
			return "newProduct.jsp";
		}
		else {
			productService.save(product);
			return "redirect:/";
		}
	}
	
	@GetMapping("/product/{id}")
	public String showProduct(@PathVariable("id") Long id, Model model) {
		Product product = productService.findProduct(id);
		List<Category> categories = productService.allCategories(product);
		List<Category> unassignedCategories = productService.unassignedCategories(product);
		model.addAttribute("product", product);
		model.addAttribute("categories", categories);
		model.addAttribute("unassignedCategories", unassignedCategories);
		return "showProduct.jsp";
		
	}
	
	@PostMapping("/product/{id}/addCategory")
	public String addCategory(@PathVariable("id") Long productId,
	@RequestParam("categoryId") Long categoryId) {
		Category category = categoryService.findCategory(categoryId);
		Product product = productService.findProduct(productId);
		product.getCategories().add(category);
		productService.save(product);
		return "redirect:/product/" + productId;
	}

}
