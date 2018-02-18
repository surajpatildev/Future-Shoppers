package in.sj.futureshopping.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@ComponentScan("in.sj.futureshopping")
@Configuration
@EnableTransactionManagement
public class HibernateConfig {

	private final static String DATABSE_URL = "jdbc:mysql://localhost/futureshopping";
	private final static String DATABSE_DRIVER = "com.mysql.jdbc.Driver";
	private final static String DATABSE_USERNAME = "root";
	private final static String DATABSE_PASSWORD = "root123";
	private final static String DATABSE_DILECT = "org.hibernate.dialect.MySQL5Dialect";

	@Bean
	public DataSource dataSource() {
		BasicDataSource dataSource = new BasicDataSource();
		dataSource.setDriverClassName(DATABSE_DRIVER);
		dataSource.setUrl(DATABSE_URL);
		dataSource.setUsername(DATABSE_USERNAME);
		dataSource.setPassword(DATABSE_PASSWORD);

		return dataSource;
	}
	
	@Bean
	public SessionFactory sessionFactory(DataSource dataSource) {
		
		LocalSessionFactoryBuilder builder=new LocalSessionFactoryBuilder(dataSource);
		
		builder.addProperties(getHibernateProperties());
		builder.scanPackages("in.sj.futureshopping.dto");
		return builder.buildSessionFactory();
	}
	
	@Bean
	public HibernateTransactionManager hibernateTransactionManager(SessionFactory factory) {
		
		HibernateTransactionManager hibernateTransactionManager=new HibernateTransactionManager(factory);
		
		return hibernateTransactionManager;
	}
	
	
		//All the hibernate properties will come here
	private Properties getHibernateProperties() {
		
		Properties properties=new Properties();
		properties.put("hibernate.dilect",DATABSE_DILECT);
		properties.put("hibernate.show_sql","true");
		properties.put("hibernate.format_sql","true");
		properties.put("hibernate.enable_lazy_load_no_trans", "true");
		return properties;
	}
}
