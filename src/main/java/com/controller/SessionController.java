package com.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bean.UserBean;
import com.dao.UserDao;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Controller
public class SessionController {

	@Autowired
	PasswordEncoder passwordEncoder;
	// spring -> @Autowired
	// singleton
	@Autowired
	JavaMailSender mailSender;

	@Autowired
	UserDao userDao;

	@Autowired
	private ResourceLoader resourceLoader;

	@GetMapping("signup")
	public String signup() {
		return "Signup";
	}

	@GetMapping(value = { "login", "/" })
	public String login() {
		return "Login";
	}

	@PostMapping("saveuser")
	public String saveUser(@Validated UserBean user, BindingResult result, Model model) {

		// validation
		if (result.hasErrors()) {
			model.addAttribute("result", result);
			return "Signup";
		} else {

			// rawPassword -> maxLength-70

			String ePwd = passwordEncoder.encode(user.getPassword());
			user.setPassword(ePwd);// 60

			// db insert
			userDao.addUser(user);

			// mail

			MimeMessage message = mailSender.createMimeMessage();
			try {
				MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

				String htmlContent = loadEmailTemplate("classpath:templates\\welcome-mail-template.html");
				helper.setTo(user.getEmail());
				helper.setFrom("tejasshah2k19@gmail.com");
				helper.setText(htmlContent, true);
				mailSender.send(message);

			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return "Login";
		}

	}

	private String loadEmailTemplate(String path) {
		try {
			Resource resource = resourceLoader.getResource(path);
			try (BufferedReader reader = new BufferedReader(
					new InputStreamReader(resource.getInputStream(), StandardCharsets.UTF_8))) {
				return reader.lines().collect(Collectors.joining("\n"));
			}
		} catch (Exception e) {
			throw new RuntimeException("Failed to load email template: " + path, e);
		}
	}

	@PostMapping("/login")
	public String authenticate(String email, String password, Model model) {
		UserBean userBean = userDao.getUserByEmail(email);

		if (userBean == null) {
			model.addAttribute("error", "Invalid Credentials");
			return "Login";
		}

		if (passwordEncoder.matches(password, userBean.getPassword()) == false) {
			model.addAttribute("error", "Invalid Credentials");
			return "Login";
		}

		return "redirect:/listingredients";
	}

	@GetMapping("/forgotpassword")
	public String forgotPassword() {

		return "ForgotPassword";
	}

	@PostMapping("/forgotpassword")
	public String forgotPasswordCheck(String email, Model model) {
		UserBean userBean = userDao.getUserByEmail(email);
		if (userBean == null) {
			model.addAttribute("error", "Invalid Email");
			return "ForgotPassword";
		} else {
			int otp = (int) (Math.random() * 1000000);
			userDao.updateOtp(email, otp);
			// send mail
			return "ChangePassword";
		}
	}

	@PostMapping("updatepassword")
	public String updatePassword(UserBean userBean, Model model) {

		UserBean dbUser = userDao.getUserByEmail(userBean.getEmail());

		LocalDateTime now = LocalDateTime.now(); // current time 8-6-2025 14:26
		LocalDateTime otpTime = dbUser.getOtpTime();// creat time 8-6-2025 14:25

		long minutes = Duration.between(now, otpTime).toMinutes();

		if (minutes <= 3) {
			model.addAttribute("error", "OTP Expired Please Use FrogetPassword Again ");
		} else if (userBean.getOtp() != -1 && dbUser != null && dbUser.getOtp() == userBean.getOtp()) {
			userDao.updatePassword(userBean.getEmail(), userBean.getPassword());
			return "redirect:/login";

		} else {
			model.addAttribute("error", "Invalid Credentials");
		}

		return "ChangePassword";

	}

}
