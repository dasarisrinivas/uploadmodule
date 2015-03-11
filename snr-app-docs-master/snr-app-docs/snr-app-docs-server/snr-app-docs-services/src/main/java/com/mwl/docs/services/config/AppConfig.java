package com.mwl.docs.services.config;  
  
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
  
@Configuration 
@ComponentScan(basePackages = {"com.mwl.core"}) 
@EnableWebMvc   
public class AppConfig {  

}  
