package com.zach.productsAndCategories.controllers;

import org.springframework.stereotype.Controller;
import com.zach.productsAndCategories.services.ProductService;
import java.util.*;
import javax.validation.*;
import org.springframework.web.bind.annotation.*;
import com.zach.productsAndCategories.models.*;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;


@Controller
public class ProductController {
	
	private final ProductService productService;
	
	public ProductController(ProductService productService) {
		this.productService = productService;
	}
	
	
	@RequestMapping("/")
	public String index() {
		return "index.jsp";
	}
	
	
	@RequestMapping("/dashboard")
	public String dashboard(Model model) {
		List<Product> products = productService.allProducts();
		List<Category> categories = productService.allCategories();
		model.addAttribute("products", products);
		model.addAttribute("categories", categories);
		return "dashboard.jsp";
	}

	@RequestMapping("/newCategory")
	public String categoryPage(Model model, @Valid @ModelAttribute("category") Category category) {
		model.addAttribute("category", category);
		return "newCat.jsp";
	}
	
	
	@RequestMapping(value = "/createCategory", method = RequestMethod.POST)
	public String createCategory(@Valid @ModelAttribute("category") Category category, BindingResult result) {
		if(result.hasErrors()) {
			return "newCat.jsp";
		} else {
			category = productService.createCategory(category);
			return "redirect:/categories/" + category.getId();
		}
	}
	
	
	@RequestMapping(value = "/categories/{id}", method = RequestMethod.POST)
	public String addCategory(@PathVariable("id") Long id, @RequestParam("category") Long catId) {
		Product product = productService.findProduct(id);
		Category thisCategory = productService.findCategory(catId);
		product.getCategories().add(thisCategory);
		productService.createProduct(product);
		return "redirect:/products/" + product.getId();
	}
	
	
	@RequestMapping(value = "/categories/{id}", method = RequestMethod.GET)
	public String showCategory(@PathVariable("id") Long categoryId, Model model, @Valid @ModelAttribute("product") Product product) {
		Category category = productService.findCategory(categoryId);
		List<Product> products = productService.findCategoriesNotContains(category);
		model.addAttribute("category", category);
		model.addAttribute("category_products", category.getProducts());
		model.addAttribute("products", products);
		model.addAttribute("product", product);
		return "category.jsp";
	}
	
	
	@RequestMapping("/newProduct")
	public String productPage(Model model, @Valid @ModelAttribute("product") Product product) {
		model.addAttribute("product", product);
		return "newProd.jsp";
	}
	
	
	@RequestMapping(value = "/createProduct", method = RequestMethod.POST)
	public String createProduct(@Valid @ModelAttribute("product") Product product, BindingResult result) {
		if(result.hasErrors()) {
			return "newProd.jsp";
		} else {
			product = productService.createProduct(product);
			return "redirect:/products/" + product.getId();
		}
	}
	
	
	@RequestMapping(value = "/products/{id}", method = RequestMethod.GET)
	public String showProduct(@PathVariable("id") Long productId, @Valid @ModelAttribute("category") Category category, Model model) {
		Product product = productService.findProduct(productId);
		List<Category> categories = productService.findProductsNotContains(product);
		model.addAttribute("categories", categories);
		model.addAttribute("product_categories", product.getCategories());
		model.addAttribute("product", product);
		model.addAttribute("category", category);
		return "product.jsp";
	}
	
	
	@RequestMapping(value = "/products/{id}", method = RequestMethod.POST)
	public String addProduct(@PathVariable("id") Long id, @RequestParam("product") Long prodId) {
		Product product = productService.findProduct(prodId);
		Category category = productService.findCategory(id);
		category.getProducts().add(product);
		productService.createCategory(category);
		return "redirect:/categories/" + category.getId();
	}
	
}
