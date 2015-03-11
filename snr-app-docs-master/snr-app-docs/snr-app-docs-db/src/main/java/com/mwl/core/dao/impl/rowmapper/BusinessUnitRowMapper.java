package com.mwl.core.dao.impl.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.mwl.docs.domain.BusinessUnit;

public class BusinessUnitRowMapper implements RowMapper<BusinessUnit> {

	public BusinessUnit mapRow(ResultSet rs, int rowNum) throws SQLException {
		BusinessUnit BusinessUnit = new BusinessUnit();
		
		/*
		BusinessUnit.setLogoURL(rs.getString("logo_url"));
		BusinessUnit.setCustomProductName(rs.getString("CUSTOM_NM"));
		BusinessUnit.setProductName(rs.getString("actual_product_nm"));
		BusinessUnit.setSellerName(rs.getString("seller_name"));
		BusinessUnit.setProductId(rs.getString("sold_product_id"));
		*/
		return BusinessUnit;
	}

}
