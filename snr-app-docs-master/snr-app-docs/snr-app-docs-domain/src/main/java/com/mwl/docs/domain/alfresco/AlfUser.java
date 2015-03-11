package com.mwl.docs.domain.alfresco;

import java.io.Serializable;

public class AlfUser  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String groupName;
	private String groupDisplayName;
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getGroupDisplayName() {
		return groupDisplayName;
	}
	public void setGroupDisplayName(String groupDisplayName) {
		this.groupDisplayName = groupDisplayName;
	}
	@Override
	public String toString() {
		return "AlfUserGroup [groupName=" + groupName + ", groupDisplayName="
				+ groupDisplayName + "]";
	}
	

}
