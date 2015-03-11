package com.mwl.core.dao.impl;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.PropertySources;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Component;

@Component
@PropertySources(value = {
		@PropertySource("classpath:daoconfig/sql_queries.properties") })
public class BaseDao {

	
	protected static Logger logger = LoggerFactory.getLogger(BaseDao.class);

	protected NamedParameterJdbcTemplate namedJdbcTemplate;

	@Autowired
	private Environment environment;

	
	@Resource(name = "myDataSource")
	public void setDataSource(DataSource myDataSource) {
		this.namedJdbcTemplate = new NamedParameterJdbcTemplate(myDataSource);
	}

	
	protected String getQuery(String properyKey) {
		logger.info("*******************************************************************");
		logger.info("SQL Requested : " + properyKey);
		logger.info("SQL is " + environment.getProperty(properyKey));
		logger.info("*******************************************************************");

		return environment.getProperty(properyKey);
	}


}
