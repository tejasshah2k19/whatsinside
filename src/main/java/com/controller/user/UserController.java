package com.controller.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bean.IngredientBean;
import com.bean.UserBean;

import jakarta.servlet.http.HttpSession;

@Controller("UserRole")
public class UserController {

	@Autowired
	JdbcTemplate stmt;

	@GetMapping("home")
	public String home() {

		return "Home";
	}

	// search no item ?
	// item insert -> search , item , userid

	@GetMapping("search")
	public String search() {
		return "UserSearchIngredient";
	}

	@PostMapping("usersearchingredient")
	public String searchIngredientInDb(String name, Model model, HttpSession session) {

		UserBean userBean = (UserBean) session.getAttribute("user");
		Integer  userId = userBean.getUserId(); 
		
		List<IngredientBean> list = stmt.query("select * from ingredients where name like ? or scientificName like ? ",
				new BeanPropertyRowMapper<>(IngredientBean.class), new Object[] { "%" + name + "%", "%" + name + "%" });
		if (list.size() == 0) {
			model.addAttribute("error", "No Data Found");

			// db insert
			stmt.update("insert into search_log (name,userId) values (?,?)", name,userId);

			return "UserSearchIngredient";
		} else {
			model.addAttribute("ingredient", list.get(0));
			return "UserViewIngredient";
		}
	}
}
