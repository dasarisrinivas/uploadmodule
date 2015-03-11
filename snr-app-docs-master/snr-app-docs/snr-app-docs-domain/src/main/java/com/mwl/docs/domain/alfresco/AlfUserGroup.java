package com.mwl.docs.domain.alfresco;

import java.io.Serializable;

public class AlfUserGroup  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String groupName;
	private String displayName;
	private String parentGroupName;
	
	
	
	public String getParentGroupName() {
		return parentGroupName;
	}
	public void setParentGroupName(String parentGroupName) {
		this.parentGroupName = parentGroupName;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getDisplayName() {
		return displayName;
	}
	public void setDisplayName(String displayName) {
		this.displayName = displayName;
	}
	

}
