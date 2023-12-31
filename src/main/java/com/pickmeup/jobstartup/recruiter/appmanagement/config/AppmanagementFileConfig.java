package com.pickmeup.jobstartup.recruiter.appmanagement.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class AppmanagementFileConfig  implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler( "/image/appManage/**")
                .addResourceLocations("file:///C:/jobStartUp_fileUpload/profile_img/")
                .addResourceLocations("file:///C:/jobStartUp_fileUpload/resumeFile/");
    }

}
