package com.Controller;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class BCryptPasswordEncoder {
   
	@Bean
	public BCryptPasswordEncoder encode(String password) {
        return new BCryptPasswordEncoder();
	}
}
