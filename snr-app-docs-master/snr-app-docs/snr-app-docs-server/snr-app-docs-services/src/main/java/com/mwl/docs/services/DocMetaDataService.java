package com.mwl.docs.services;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.mwl.core.dao.BusinessUnitDao;
import com.mwl.docs.domain.BusinessUnit;

@Component
@RestController
@RequestMapping("/docmetadata")
public class DocMetaDataService implements IDocMetaDataService {

	Logger logger = LoggerFactory.getLogger(DocMetaDataService.class);

	@Autowired
	private BusinessUnitDao businessUnitDao;


	@Override
	@RequestMapping(value = "/businessunit", method = RequestMethod.POST,  headers = "Accept=application/json")
	@ResponseBody
	public  String createBusinessUnit(@RequestBody BusinessUnit businessUnit) {
		return businessUnitDao.createBusinessUnit(businessUnit);
	}

	
	
}
