package sol.one.config;

import java.util.Properties;

import javax.sql.DataSource;


import sol.one.dao.OrderDAO;
import sol.one.dao.ProductDAO;
import sol.one.dao.OrderDAOImpl;
import sol.one.dao.ProductDAOImpl;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;



 
@Configuration
@ComponentScan("sol.one.*")
@EnableTransactionManagement
// Load to Environment.
@PropertySource("classpath:ds-hibernate-cfg.properties")
public class ApplicationContextConfig {
 
    // The Environment class serves as the property holder
    // and stores all the properties loaded by the @PropertySource
    @Autowired
    private Environment env;
 
    @Bean
    public ResourceBundleMessageSource messageSource() {
        ResourceBundleMessageSource rb = new ResourceBundleMessageSource();
        // Load property in message/validator.properties
        rb.setBasenames(new String[] { "messages/validator" });
        
        System.out.println("## messages/validator: " + rb);
        return rb;
    }
 
    @Bean(name = "viewResolver")
    public InternalResourceViewResolver getViewResolver() {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setPrefix("/WEB-INF/pages/");
        viewResolver.setSuffix(".jsp");
        
        System.out.println("## viewResolver ###: " + viewResolver.getAttributesMap());
        return viewResolver;
    }
     
    // Config for Upload.
    @Bean(name = "multipartResolver")
    public CommonsMultipartResolver multipartResolver() {
        CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver();
         
        // Set Max Size...
        // commonsMultipartResolver.setMaxUploadSize(...);
        System.out.println("## multipartResolver: " + commonsMultipartResolver); 
        
        return commonsMultipartResolver;
    }
 
    @Bean(name = "dataSource")
    public DataSource getDataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
 
        // See: ds-hibernate-cfg.properties
        dataSource.setDriverClassName(env.getProperty("ds.database-driver"));
        dataSource.setUrl(env.getProperty("ds.url"));
        dataSource.setUsername(env.getProperty("ds.username"));
        dataSource.setPassword(env.getProperty("ds.password"));
         
        System.out.println("## getDataSource: " + dataSource);
         
        return dataSource;
    }
 

 
    @Bean(name = "productDAO")
    public ProductDAO getProductDAO() {
        return new ProductDAOImpl();
    }
 
    @Bean(name = "orderDAO")
    public OrderDAO getOrderDAO() {
        return new OrderDAOImpl();
    }
     
 
}
