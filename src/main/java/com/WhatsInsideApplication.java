package com;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.reactive.function.client.WebClient;

@SpringBootApplication
public class WhatsInsideApplication {

	public static void main(String[] args) {
		SpringApplication.run(WhatsInsideApplication.class, args);
	}

	@Bean
	PasswordEncoder getEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	String OPENAI_API_KEY = "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";
	String Hugging_KEY = "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";
	
	 @Bean
	    public WebClient openAiWebClient() {
	        return WebClient.builder()
	                .baseUrl("https://api-inference.huggingface.co")
	                .defaultHeader(HttpHeaders.AUTHORIZATION, "Bearer " + Hugging_KEY)
	                .defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
	                .build();
	    }
}
