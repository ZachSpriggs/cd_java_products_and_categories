package com.zach.productsAndCategories.repositories;

import java.util.*;
import com.zach.productsAndCategories.models.*;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoryRepository extends CrudRepository<Category, Long>{
	List<Category> findAll();
	
	List<Category> findByProductsNotContains(Product product);
}
