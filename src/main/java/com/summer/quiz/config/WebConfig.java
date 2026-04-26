package com.summer.quiz.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Autowired
    private AuthHandler authHandler;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(authHandler)
                .addPathPatterns("/games/**", "/add-category", "/create-quiz", "/quizzes/**", "/users/**")
                .excludePathPatterns("/quizzes", "/users/register", "/users/log-in");  // protect all game routes
    }
}
