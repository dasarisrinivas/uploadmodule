package com.mwl.core.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Component;

import com.mwl.core.dao.BusinessUnitDao;
import com.mwl.core.dao.impl.rowmapper.BusinessUnitRowMapper;
import com.mwl.docs.domain.BusinessUnit;
import com.mwl.util.DateUtils;
import com.mwl.util.UniqueIdGenerator;

@Component("businessUnitDao")
public class BusinessUnitDaoImpl extends BaseDao implements BusinessUnitDao {

	protected static Logger logger = LoggerFactory
			.getLogger(BusinessUnitDaoImpl.class);

	public BusinessUnitDaoImpl() {

	}

	public String createBusinessUnit(BusinessUnit businessUnit) {
		String createBusinessUnitSql = getQuery("create.businessUnit");

		// :ID,:DISPLAY_NAME,:PARENT_BU__ID,:CREATION_DT,:EXPIRY_DT,:SEQUENCE_NUMBER,:CLIENT__ID)
		Map<String, String> filedDataMap = new HashMap<String, String>();
		String id = UniqueIdGenerator.getNewId();
		filedDataMap.put("ID", UniqueIdGenerator.getNewId());
		filedDataMap.put("DISPLAY_NAME", businessUnit.getDisplayName());
		filedDataMap.put("PARENT_BU__ID",
				businessUnit.getParentBusinessUnitId());
		filedDataMap.put("CREATION_DT", DateUtils.getCurrentFormattedDate());
		filedDataMap.put("EXPIRY_DT", null);
		filedDataMap.put("SEQUENCE_NUMBER", businessUnit.getSequenceNumber()
				.toString());
		filedDataMap.put("CLIENT__ID", businessUnit.getClientId());

		int responseCode = namedJdbcTemplate.update(createBusinessUnitSql,
				filedDataMap);
		logger.info("Rows updated : " + responseCode);

		return id;
	}

	public List<BusinessUnit> retrieveBusinessUnit(String clientId) {
		String retrieveBusinessUnitSql = getQuery("retrieve.businessUnitForClient");

		SqlParameterSource namedParameters = new MapSqlParameterSource(
				"CLIENT__ID", clientId);
		List<BusinessUnit> businessUnitUnit = namedJdbcTemplate.query(retrieveBusinessUnitSql,
				namedParameters, new BusinessUnitRowMapper());

		// logger.info("...using retrieve.metaDataForPageRequestWithCustomer." +
		// businessUnitUnit());
		return null;
	}

}
