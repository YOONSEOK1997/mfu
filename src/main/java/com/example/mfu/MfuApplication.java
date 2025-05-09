package com.example.mfu;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@SpringBootApplication
public class MfuApplication implements WebMvcConfigurer{

	public static void main(String[] args) {
		SpringApplication.run(MfuApplication.class, args);
	}
	//파일저장 패스 매핑(물리적패스 :프로젝트 밖, 논리적 접근 :프로젝틈 안)
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
	    registry.addResourceHandler("/upload/**").addResourceLocations("file:///c:/project/upload/");
	}

}
