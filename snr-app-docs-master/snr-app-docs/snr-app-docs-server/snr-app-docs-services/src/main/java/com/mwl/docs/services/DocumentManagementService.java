package com.mwl.docs.services;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.mwl.docs.domain.AppDocument;
import com.mwl.docs.domain.AppMiniDocument;
import com.mwl.util.Constants;

@Component
@RestController
@RequestMapping("/documents")
public class DocumentManagementService implements IDocumentManagementService {

	//REST-POST
	@Override
	public String addNewDocument(AppDocument document) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@RequestMapping(value = "/retrieve", method = RequestMethod.GET, produces = Constants.JSON_CONTENT_TYPE)
	public @ResponseBody AppDocument retrieveDocument(
			@RequestParam(value = "did", required = false, defaultValue = "0") String documentId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@RequestMapping(value = "/retrieve", method = RequestMethod.GET, produces = Constants.JSON_CONTENT_TYPE)
	public @ResponseBody List<AppMiniDocument> retrieveDocuments(
			@RequestParam(value = "cid", required = false, defaultValue = "0") String customerId,
			@RequestParam(value = "cpid", required = false, defaultValue = "0") String customerProductId) {
		// TODO Auto-generated method stub
		return null;
	}

	//REST-PUT
	@Override
	public String updateDocument(AppDocument document) {
		// TODO Auto-generated method stub
		return null;
	}

	//REST-DELETE
	@Override
	public String deleteDocument(AppDocument document) {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * 
	 */
	
}
