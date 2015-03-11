package com.mwl.docs.services;

import java.util.List;

import com.mwl.docs.domain.AppDocument;
import com.mwl.docs.domain.AppMiniDocument;

public interface IDocumentManagementService {

	//store the document in docmgmt db and alfresco
	public String addNewDocument(AppDocument document) ;
	
	//this service will get the document in bytes to be showen on the browser along with metadata
	public AppDocument retrieveDocument(String documentId);
	
	//this service is for showing the list of the documents associated with the customer and a specific customerProductId
	public List<AppMiniDocument> retrieveDocuments(String customerId,String customerProductId);

	//store the document in docmgmt db and alfresco
	public String updateDocument(AppDocument document) ;

	//store the document in docmgmt db and alfresco
	public String deleteDocument(AppDocument document) ;

}
