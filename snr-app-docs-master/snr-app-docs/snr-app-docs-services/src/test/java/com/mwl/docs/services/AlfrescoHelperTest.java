package com.mwl.docs.services;

import junit.framework.Assert;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.test.context.web.AnnotationConfigWebContextLoader;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;
import com.mwl.docs.domain.alfresco.AlfAuthenticationInfo;
import com.mwl.docs.domain.alfresco.AlfUserGroup;
import com.mwl.docs.services.helper.AlfrescoHelper;
import com.mwl.docs.services.util.Constants;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(loader = AnnotationConfigWebContextLoader.class)
@TransactionConfiguration(defaultRollback = Constants.ROLLBACK)
@Transactional
@WebAppConfiguration
@PropertySource("classpath:serviceconfig/AlfrescoTest.proeprty")
public class AlfrescoHelperTest extends
		AbstractTransactionalJUnit4SpringContextTests {

	@Autowired
	private AlfrescoHelper alfrescoHelper;

	@Autowired
	private Environment env;

	@Configuration 
    @ComponentScan(basePackages = {"com.mwl.docs"}) 
    static class ContextConfiguration {} 

	
	protected static Logger logger = LoggerFactory
			.getLogger(AlfrescoHelperTest.class);

	@Test
	public void getTicket() {
		
		
		String ticket=alfrescoHelper.getConnectionToken(getAuthenticationInf());
		
		System.out.println(" Srini "+ticket);
		Assert.assertTrue(ticket.length()>0);
	}
	

	private AlfAuthenticationInfo getAuthenticationInf() {
		AlfAuthenticationInfo authenticationInfo = new AlfAuthenticationInfo();
		/*authenticationInfo.setUsername(env.getProperty("alfresco.username"));
		authenticationInfo.setPassword(env.getProperty("alfresco.password"));*/
		
		authenticationInfo.setUsername("admin");
		//authenticationInfo.setPassword("chinnu");
		authenticationInfo.setPassword("password");
		
		return authenticationInfo;
	}
	
	
	@Ignore
	@Test
	public void createGroup() {
		String ticket=alfrescoHelper.getConnectionToken(getAuthenticationInf());
		
		AlfUserGroup alfUserGroup = new AlfUserGroup();
		alfUserGroup.setDisplayName("New Display Name");
		alfUserGroup.setParentGroupName("SomeParent");
		alfUserGroup.setGroupName("Group Name-005");
		
		
		alfrescoHelper.createGroup(alfUserGroup, ticket);
		Assert.assertTrue(ticket.length()>0);
		cleanUpCreateGroup(ticket);
	}

	
	private void cleanUpCreateGroup(String ticket) {
		alfrescoHelper.deleteGroup(env.getProperty("alfresco.group"), ticket);
		
	}

     
	@Ignore
	@Test
	public void createChildGroup() {
		String ticket=alfrescoHelper.getConnectionToken(getAuthenticationInf());
		AlfUserGroup alfUserGroup = new AlfUserGroup();
		alfUserGroup.setDisplayName("New Display Name");
		alfUserGroup.setParentGroupName("SomeParent");
		alfUserGroup.setGroupName("Group Name-005");
		
		alfrescoHelper.createGroup(alfUserGroup, ticket);
		Assert.assertTrue(ticket.length()>0);
	}

	
	
	
}
