package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.bean.UserBean;
import com.dao.UserDao;

@Controller
public class UserController {
	@Autowired
	UserDao userDao;

	@Autowired
	JdbcTemplate stmt;
	
	@GetMapping("listusers")
	public String listUser(Model model) {
		List<UserBean> users = userDao.getAllUsers();
		model.addAttribute("users", users);
		return "ListUser";//jsp 
	}

	@GetMapping("deleteuser")
	public String deleteUser(Integer userId) {
		System.out.println(userId);
		String deleteQuery = "delete from users where userId = ? ";
		stmt.update(deleteQuery,userId);
		return "redirect:/listusers";//do not open jsp , open url 
	}
}
