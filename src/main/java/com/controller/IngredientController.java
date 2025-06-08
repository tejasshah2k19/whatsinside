package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bean.IngredientBean;

@Controller
public class IngredientController {

	@Autowired
	JdbcTemplate stmt;

	@GetMapping("newingredient")
	public String newIngredient() {
		return "NewIngredient";
	}

	@PostMapping("saveingredient")
	public String saveIngredient(IngredientBean ingredientBean) {
		System.out.println(ingredientBean.getAvoidBy());
		stmt.update(
				"insert into ingredients (name,scientificName,avoidBy,commonUsage,fssai,fda,efsa) values (?,?,?,?,?,?,?)",
				ingredientBean.getName(), ingredientBean.getScientificName(), ingredientBean.getAvoidBy(),
				ingredientBean.getCommonUsage(), ingredientBean.getFssai(), ingredientBean.getFda(),
				ingredientBean.getEfsa());
		return "redirect:/listingredients";
	}

	@GetMapping("listingredients")
	public String listIngredients(Model model) {
	List<IngredientBean> list = stmt.query("select * from ingredients",new BeanPropertyRowMapper<>(IngredientBean.class));
		model.addAttribute("list",list);
		return "ListIngredients";
	}
	
	@GetMapping("viewingredient")
	public String viewIngredient(Integer ingredientId,Model model) {
		 IngredientBean ib = stmt.queryForObject("select * from ingredients where ingredientId = ? ",new BeanPropertyRowMapper<>(IngredientBean.class),new Object[] {ingredientId});
			model.addAttribute("ingredient",ib);
		return "ViewIngredient";
	}
	
	
	@GetMapping("searchingredient")
	public String searchIngredient() {
		return "SearchIngredient";
	}
	
	@PostMapping("searchingredient")
	public String searchIngredientInDb(String name,Model model) {
		List<IngredientBean> list = stmt.query("select * from ingredients where name like ? or scientificName like ? ",new BeanPropertyRowMapper<>(IngredientBean.class),new Object[] {"%"+name+"%","%"+name+"%"});
		model.addAttribute("list",list);
		return "ListIngredients";
	}
	
}
