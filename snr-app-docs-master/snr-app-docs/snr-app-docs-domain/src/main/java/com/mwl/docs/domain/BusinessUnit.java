package com.mwl.docs.domain;

import java.io.Serializable;

public class BusinessUnit implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String displayName;
	private String parentBusinessUnitId;
	private Integer sequenceNumber;
	private String clientId;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDisplayName() {
		return displayName;
	}
	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}
	public String getParentBusinessUnitId() {
		return parentBusinessUnitId;
	}
	public void setParentBusinessUnitId(String parentBusinessUnitId) {
		this.parentBusinessUnitId = parentBusinessUnitId;
	}
	public Integer getSequenceNumber() {
		return sequenceNumber;
	}
	public void setSequenceNumber(Integer sequenceNumber) {
		this.sequenceNumber = sequenceNumber;
	}
	public String getClientId() {
		return clientId;
	}
	public void setClientId(String clientId) {
		this.clientId = clientId;
	}
	@Override
	public String toString() {
		return "BusinessUnit [id=" + id + ", displayName=" + displayName
				+ ", parentBusinessUnitId=" + parentBusinessUnitId
				+ ", sequenceNumber=" + sequenceNumber + ", clientId="
				+ clientId + "]";
	}
	
	
}
