package com.mwl.docs.services.helper;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.converter.FormHttpMessageConverter;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.mwl.docs.domain.alfresco.AlfAuthenticationInfo;
import com.mwl.docs.domain.alfresco.AlfUserGroup;
import com.mwl.docs.domain.alfresco.AlfrescoToken;

@Configuration
@ComponentScan(basePackages = { "com.mwl.docs.*" })
@PropertySource("classpath:serviceconfig/AlfrescoURL.property")
public class AlfrescoHelper {

	@Autowired
	private Environment env;
	
	
	public String getConnectionToken(AlfAuthenticationInfo  authenticationInfo) {
		String _ticket;

		String baseURL = env.getProperty("alfresco.baseURL");
		
		RestTemplate restTemplate = getRestTemplate();
		/*
		String JsonRequest = "{ \"username\": \"" + userName
				+ "\", \"password\": \"" + password + "\" }";
		*/
		Gson gson = new Gson();
		
		HttpEntity<String> requestEntity = new HttpEntity<String>(gson.toJson(authenticationInfo),
				getHttpHeaders());

		String alfrescoTokenAsString = restTemplate.postForObject(baseURL
				+ "/login", requestEntity, String.class);

		ObjectMapper objectMapper = new ObjectMapper();
		AlfrescoToken alfrescoToken = null;
		try {
			alfrescoToken = objectMapper.readValue(alfrescoTokenAsString,
					AlfrescoToken.class);
		} catch (JsonParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// String path = entity.getHeaders().getLocation().getPath();
		System.out.println(alfrescoToken.getData().getTicket());
		_ticket = alfrescoToken.getData().getTicket();
		return _ticket;
	}

	public String createGroup(AlfUserGroup alfUserGroup, String ticket) {
		String createGroupURL = env.getProperty("alfresco.createGroupURL");
		
		// /alfresco/service/api/groups/{shortName}/children/{fullAuthorityName}
		RestTemplate restTemplate = getRestTemplate();
	/*
		String JsonRequest = "{ \"displayName\": \"" + groupDisplayName
				+ "\" }";
*/	
		Gson gson = new Gson();
		HttpEntity<String> requestEntity = new HttpEntity<String>(gson.toJson(alfUserGroup.getDisplayName()),
				getHttpHeaders());

		/*
		 * String alfrescoTokenAsString= restTemplate.postForObject(
		 * "http://localhost:18080/alfresco/service/api/rootgroups/bbbb/?alf_ticket="
		 * +ticket, requestEntity, String.class);
		 */
		//http://127.0.0.1:18080/alfresco/s/api/groups/Group1120/children/GROUP_childg0021/?alf_ticket=

		String baseURL = env.getProperty("alfresco.baseURL");

		String alfrescoTokenAsString = restTemplate
				.postForObject(baseURL+"/groups/"+alfUserGroup.getParentGroupName()+"/children/"+alfUserGroup.getGroupName()+"/?alf_ticket="
								+ ticket, requestEntity, String.class);

		return null;

	}

	private RestTemplate getRestTemplate() {

		List<HttpMessageConverter<?>> messageConverters = new ArrayList<HttpMessageConverter<?>>();
		messageConverters.add(new FormHttpMessageConverter());
		messageConverters.add(new StringHttpMessageConverter());
		messageConverters.add(new MappingJackson2HttpMessageConverter());
		RestTemplate restTemplate = new RestTemplate();

		restTemplate.setMessageConverters(messageConverters);

		return restTemplate;
	}

	private HttpHeaders getHttpHeaders() {
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		headers.set("Content-Type", "application/json");

		return headers;
	}


	public void deleteGroup(String property, String ticket) {
		// TODO Auto-generated method stub
		
	}

	/*
	 * public String getAllProductListInfo(String customerId) { // Get Roles //
	 * Get MetaData // Get Product List
	 * 
	 * JsonObject returnData = new JsonObject(); RestTemplate restTemplate = new
	 * RestTemplate();
	 * 
	 * Map<String, String> vars = new HashMap<String, String>(); vars.put("id",
	 * "JS01"); restTemplate = new RestTemplate();
	 * restTemplate.getMessageConverters().add( new
	 * MappingJackson2HttpMessageConverter());
	 * restTemplate.getMessageConverters().add( new
	 * StringHttpMessageConverter());
	 * 
	 * AuthorizationRequestForCustomer authorizationRequestForCustomer = new
	 * AuthorizationRequestForCustomer();
	 * authorizationRequestForCustomer.setCustomerId(customerId);
	 * authorizationRequestForCustomer.setPageCode("PROD_LST"); List
	 * authorizedRoles = restTemplate.postForObject(
	 * ApiCallInfo.authorizationRequestForCustomerURL,
	 * authorizationRequestForCustomer, List.class, vars);
	 * 
	 * returnData.add("authorizedRoles",
	 * JsonUtil.toJsonElementFromObject(authorizedRoles));
	 * 
	 * returnData.add("metaData", JsonUtil
	 * .toJsonElementFromString(restTemplate.
	 * getForObject(ApiCallInfo.metaDataURL + "PROD_LST", String.class)));
	 * 
	 * restTemplate = new RestTemplate(); returnData.add("pageData", JsonUtil
	 * .toJsonElementFromString(restTemplate.getForObject(
	 * ApiCallInfo.activeProductListForCustomerURL + customerId,
	 * String.class))); logger.info("returnData............."+returnData); Gson
	 * gson = new Gson();
	 * 
	 * return gson.toJson(returnData); }
	 */
}
