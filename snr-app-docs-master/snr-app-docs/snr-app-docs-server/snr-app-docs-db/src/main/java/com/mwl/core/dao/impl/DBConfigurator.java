package com.mwl.core.dao.impl;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.PropertySources;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

@Configuration
@PropertySources(value = {@PropertySource("classpath:daoconfig/jdbc.properties")})

public class DBConfigurator {
 
	
	protected static Logger logger = LoggerFactory.getLogger(DBConfigurator.class);
	
	@Autowired
	private Environment environment;

	
	@Bean(name = "transactionManager")
	public DataSourceTransactionManager getTransactionManager() {
		return new DataSourceTransactionManager(getDataSource());
	}
	
	@Bean(name = "myDataSource")
	public DataSource getDataSource() {
		BasicDataSource dataSource = new BasicDataSource();
		logger.info("*******************************************************************");
		logger.info(environment.getProperty("jdbc.driverClassName"));

		logger.info("*******************************************************************");

		dataSource.setDriverClassName(environment
				.getProperty("com.mysql.jdbc.Driver"));
		dataSource.setUrl(environment.getProperty("jdbc.url"));
		dataSource.setUsername(environment.getProperty("jdbc.username"));
		dataSource.setPassword(environment.getProperty("jdbc.password"));

		return dataSource;
	}
}
