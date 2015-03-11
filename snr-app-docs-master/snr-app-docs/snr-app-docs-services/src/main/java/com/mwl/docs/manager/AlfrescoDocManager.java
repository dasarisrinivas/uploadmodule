package com.mwl.docs.manager;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.chemistry.opencmis.client.api.Repository;
import org.apache.chemistry.opencmis.client.api.Session;
import org.apache.chemistry.opencmis.client.api.SessionFactory;
import org.apache.chemistry.opencmis.client.runtime.SessionFactoryImpl;
import org.apache.chemistry.opencmis.commons.SessionParameter;
import org.apache.chemistry.opencmis.commons.enums.BindingType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;

import com.google.api.client.http.HttpRequest;
import com.google.api.client.http.HttpRequestFactory;
import com.google.api.client.http.HttpRequestInitializer;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.JsonObjectParser;
import com.google.api.client.json.jackson.JacksonFactory;
import com.mwl.docs.util.Config;

@PropertySource("classpath:serviceconfig/AlfrescoURL.property")
public class AlfrescoDocManager extends AbstractAlfrescoDocManager {

	@Autowired
	private Environment env;
	
	/**
	 * Change these to match your environment
	 */
	//public static final String CMIS_URL = "/public/cmis/versions/1.0/atom";
	public static final String CMIS_URL = "/public/cmis/versions/1.1/atom";

	public static final HttpTransport HTTP_TRANSPORT = new NetHttpTransport();
	public static final JsonFactory JSON_FACTORY = new JacksonFactory();
	
	private HttpRequestFactory requestFactory;
	private Session cmisSession;

	public String getAtomPubURL(HttpRequestFactory requestFactory) {
		String alfrescoAPIUrl = Config.getConfig().getProperty("host");
		String atomPubURL = null;
	
		try {
			atomPubURL = alfrescoAPIUrl + getHomeNetwork() + CMIS_URL;
		} catch (IOException ioe) {
			System.out.println("Warning: Couldn't determine home network, defaulting to -default-");
			atomPubURL = alfrescoAPIUrl + "-default-" + CMIS_URL;
		}
		
		return atomPubURL;
	}

	/**
	 * Gets a CMIS Session by connecting to the local Alfresco server.
	 * 
	 * @return Session
	 */
	public Session getCmisSession() {
		if (cmisSession == null) {
			// default factory implementation
			SessionFactory factory = SessionFactoryImpl.newInstance();
			Map<String, String> parameter = new HashMap<String, String>();
	
			// connection settings
			parameter.put(SessionParameter.ATOMPUB_URL, getAtomPubURL(getRequestFactory()));
			parameter.put(SessionParameter.BINDING_TYPE, BindingType.ATOMPUB.value());
			parameter.put(SessionParameter.AUTH_HTTP_BASIC, "true");
			parameter.put(SessionParameter.USER, Config.getConfig().getProperty("username"));
			parameter.put(SessionParameter.PASSWORD, Config.getConfig().getProperty("password"));
			parameter.put(SessionParameter.OBJECT_FACTORY_CLASS, "org.alfresco.cmis.client.impl.AlfrescoObjectFactoryImpl");
	
			List<Repository> repositories = factory.getRepositories(parameter);
	
			cmisSession = repositories.get(0).createSession();
		}
		return this.cmisSession;
	}

	/**
	 * Uses basic authentication to create an HTTP request factory.
	 * 
	 * @return HttpRequestFactory
	 */
	public HttpRequestFactory getRequestFactory() {
		if (this.requestFactory == null) {
    		this.requestFactory = HTTP_TRANSPORT.createRequestFactory(new HttpRequestInitializer() {
    			@Override
    			public void initialize(HttpRequest request) throws IOException {
    				request.setParser(new JsonObjectParser(new JacksonFactory()));
    				request.getHeaders().setBasicAuthentication(Config.getConfig().getProperty("username"), Config.getConfig().getProperty("password"));
    			}
    		});
		}
		return this.requestFactory;	
	}
	
	
}
