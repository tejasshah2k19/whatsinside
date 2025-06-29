package com.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.reactive.function.client.WebClient;

import com.bean.SearchLogBean;
import com.dao.SearchLogDao;

import reactor.core.publisher.Mono;

@Controller
public class AdminController {

	@Autowired
	SearchLogDao searchLogDao;

	@Autowired
	WebClient webClient;

	@GetMapping("admindashboard")
	public String adminDashboard() {

		return "AdminDashboard";
	}

	@GetMapping("searchlog")
	public String searchLog(Model model) {

		List<SearchLogBean> list = searchLogDao.getAllLogs();
		model.addAttribute("list", list);
		return "SearchLogList";
	}

	@GetMapping("fetchdata")
	public String fetchData(String name) {
		System.out.println(name);



//		String requestJson = String.format("""
//				    {
//				      "model": "%s",
//				      "messages": [
//				        {
//				          "role": "user",
//				          "content": "%s"
//				        }
//				      ]
//				    }
//				""", "gpt-3.5-turbo", name);
//
//		String resp = webClient.post().uri("/chat/completions").bodyValue(requestJson).retrieve()
//				.onStatus(HttpStatus.TOO_MANY_REQUESTS::equals,
//						response -> response.bodyToMono(String.class).flatMap(error -> {
//							System.err.println("Rate limit hit: " + error);
//							return Mono.error(new RuntimeException("Too Many Requests: " + error));
//						}))
//				.bodyToMono(String.class).block();
//		System.out.println(resp);

		   String json = String.format("""
		            {
		              "inputs": "%s"
		            }
		        """, name);

		 String resp = webClient.post()
	                .uri("/models/gpt2")
	                .bodyValue(json)
	                .retrieve()
	                .bodyToMono(String.class)
	                .block();
		 
		 System.out.println(resp);
		
		return "redirect:/listingredients";

	}
}
