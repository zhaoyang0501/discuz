package cmcc.admin.config;

import javax.servlet.MultipartConfigElement;

import org.springframework.boot.context.embedded.FilterRegistrationBean;
import org.springframework.boot.web.servlet.MultipartConfigFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.opensymphony.sitemesh.webapp.SiteMeshFilter;

@Configuration
public class ApplicationConfiguration {
	@Bean
    public MultipartConfigElement multipartConfigElement() {
        MultipartConfigFactory factory = new MultipartConfigFactory();
        factory.setMaxFileSize("3050MB");
        factory.setMaxRequestSize("3050MB");
        return factory.createMultipartConfig();
    }
	
	 @Bean
	 public FilterRegistrationBean siteMeshFilter() {
	        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();
	        filterRegistrationBean.setFilter( new  SiteMeshFilter());
	        filterRegistrationBean.addUrlPatterns("/*");
	        return filterRegistrationBean;
	 }
	 
	 
}
