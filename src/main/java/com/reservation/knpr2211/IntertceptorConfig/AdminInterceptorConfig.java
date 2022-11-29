package com.reservation.knpr2211.IntertceptorConfig;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.reservation.knpr2211.handlerInterceptor.AdminInterceptor;

@Configuration
public class AdminInterceptorConfig implements WebMvcConfigurer {
	

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
//        registry.addInterceptor(new AdminInterceptor())
//                .addPathPatterns("/admin*")
//        		.excludePathPatterns("/adminIndex");
    }
}

