/**
 * 
 */
package com.mwl.docs.services.helper;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

/**
 * @author 394092
 *
 */
public class AlfrescoDocHelperTest {

	/**
	 * @throws java.lang.Exception
	 */
	@Before
	public void setUp() throws Exception {
	}

	/**
	 * @throws java.lang.Exception
	 */
	@After
	public void tearDown() throws Exception {
	}

	/**
	 * Test method for {@link com.mwl.docs.services.helper.AlfrescoDocHelper#createFolder(java.lang.String)}.
	 */
	@Test
	public void testCreateFolderString() {

		AlfrescoDocHelper docHelper = new AlfrescoDocHelper();
		docHelper.createFolder("Srini1");
		
		
	}


}
