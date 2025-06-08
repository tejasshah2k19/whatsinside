package com.dao;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.UserBean;

@Repository
public class UserDao {

	@Autowired
	JdbcTemplate stmt;

	// return type : no return
	// argument type : UserBean
	public void addUser(UserBean user) {
		// insert , update, delete
		stmt.update("insert into users (firstName,lastName,gender,email,password) values (?,?,?,?,?)",
				user.getFirstName(), user.getLastName(), user.getGender(), user.getEmail(), user.getPassword());
		// executeUpdate();
	}

	// select * from users
	public List<UserBean> getAllUsers() {
		// select -> n records
		List<UserBean> users = stmt.query("select * from users", new BeanPropertyRowMapper<>(UserBean.class));

		return users;
	}
	
	
	public UserBean authenticate(String email,String password)
	{
		
		try {
			
			UserBean user =  stmt.queryForObject("select * from users where email = ? and password = ? ", new BeanPropertyRowMapper<>(UserBean.class),new Object[] {email,password});
			return user; 
		}catch(Exception e) {
			
		}
		
		
		return null; 
	}
	
	public UserBean getUserByEmail(String email)
	{
		
		try {
			
			UserBean user =  stmt.queryForObject("select * from users where email = ? ", new BeanPropertyRowMapper<>(UserBean.class),new Object[] {email});
			return user; 
		}catch(Exception e) {
			
		}
		
		
		return null; 
	}

	public void updateOtp(String email, int otp) {

		LocalDateTime now = LocalDateTime.now(); 
		System.out.println(now);
		stmt.update("update users set otp = ? , otpTime = ? where email = ? ",otp,now,email);
	}

	public void updatePassword(String email, String password) {

		stmt.update("update users set password = ? , otp = ? where email = ? ",password,-1,email);
	}

	
	

}
