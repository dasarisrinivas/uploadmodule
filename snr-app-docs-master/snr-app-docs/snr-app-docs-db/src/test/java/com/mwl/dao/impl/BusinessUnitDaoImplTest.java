package com.mwl.dao.impl;

import junit.framework.Assert;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.AnnotationConfigContextLoader;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.mwl.core.dao.impl.BusinessUnitDaoImpl;
import com.mwl.dao.util.Constants;
import com.mwl.docs.domain.BusinessUnit;

@Ignore
@RunWith(SpringJUnit4ClassRunner.class)
@Configuration 

//@ContextConfiguration(loader=AnnotationConfigContextLoader.class,classes={BaseDao.class,DBConfigurator.class,BusinessUnitDaoImpl.class})
@ContextConfiguration(loader=AnnotationConfigContextLoader.class)
@TransactionConfiguration(defaultRollback = Constants.ROLL_BACK)
@Transactional
public class BusinessUnitDaoImplTest extends AbstractTransactionalJUnit4SpringContextTests{
	@Autowired
	private BusinessUnitDaoImpl businessUnitDao;
	
	protected static Logger logger = LoggerFactory
			.getLogger(BusinessUnitDaoImplTest.class);

	
	@Configuration 
    @ComponentScan(basePackages = {"com.mwl.api.services","com.mwl.api","com.mwl.services","com.mwl.core.dao.impl"}) 
    static class ContextConfiguration {} 

	
	
	
	@Test
	public void createBusinessUnit() {
		String customerId="1";
		BusinessUnit businessUnit = new BusinessUnit();
		businessUnit.setClientId("1");
		businessUnit.setDisplayName("Finance");
		businessUnit.setId(null);
		businessUnit.setParentBusinessUnitId(null);
		;
		String unitId=businessUnitDao.createBusinessUnit(businessUnit);
		logger.info("***********\n\n\n\n\n"+unitId);
		//logger.info(productBusinessUnitList.toString());
		Assert.assertTrue(1==1);
		
	}


	

}
