package com.zach.productsAndCategories.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import java.util.*;
import com.zach.productsAndCategories.models.*;


@Repository
public interface ProductRepository extends CrudRepository<Product, Long>{
	
	List<Product> findAll();
	
	List<Product> findByCategoriesNotContains(Category category);
}
