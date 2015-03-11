package com.mwl.docs.services.helper;

import java.io.IOException;

import org.apache.chemistry.opencmis.client.api.Folder;

import com.mwl.docs.manager.AlfrescoDocManager;

public class AlfrescoDocHelper extends AlfrescoDocManager {
	
	
	public void createFolder(String folderName) {
		try {
			// Find the root folder of our target site
			String rootFolderId = getRootFolderId(getSite());
			
			// Create a new folder in the root folder
			Folder subFolder = createFolder(rootFolderId, folderName);
			
			
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}
	}
	

	/*public static void main(String args[])
	{
		
		System.out.println("before creating folder");
		AlfrescoDocHelper docHelper = new AlfrescoDocHelper();
		docHelper.createFolder("Srini");
		System.out.println("Created");
		
	}*/
	
}
