package com.zach.productsAndCategories.services;

import org.springframework.stereotype.Service;
import com.zach.productsAndCategories.models.*;
import com.zach.productsAndCategories.repositories.*;
import java.util.*;

@Service
public class ProductService {

	private final ProductRepository productRepo;
	private final CategoryRepository categoryRepo;
	
	
	public ProductService(ProductRepository productRepo, CategoryRepository categoryRepo) {
		this.productRepo = productRepo;
		this.categoryRepo = categoryRepo;
	}
	
	
	public List<Category> allCategories(){
		return categoryRepo.findAll();
	}
	
	
	public List<Product> allProducts(){
		return productRepo.findAll();
	}
	
	
	public Category createCategory(Category category) {
		return categoryRepo.save(category);
	}
	
	
	public Product createProduct(Product product) {
		return productRepo.save(product);
	}
	
	
	public List<Category> findProductsNotContains(Product product){
		return categoryRepo.findByProductsNotContains(product);
	}
	
	
	public List<Product> findCategoriesNotContains(Category category){
		return productRepo.findByCategoriesNotContains(category);
	}
	
	
	public Category findCategory(Long id) {
		Optional<Category> optionalCategory = categoryRepo.findById(id);
		if(optionalCategory.isPresent()) {
			return optionalCategory.get();
		} else {
			return null;
		}
	}
	
	
	public Product findProduct(Long id) {
		Optional<Product> optionalProduct = productRepo.findById(id);
		if(optionalProduct.isPresent()) {
			return optionalProduct.get();
		} else {
			return null;
		}
	}
	
	
	public Product addCategory(Long id, Category category) {
		Product product = findProduct(id);
		product.getCategories().add(category);
		return productRepo.save(product);
	}
	
	
	public Category addProduct(Long id, Product product) {
		Category category = findCategory(id);
		category.getProducts().add(product);
		return categoryRepo.save(category);
	}
	
}
