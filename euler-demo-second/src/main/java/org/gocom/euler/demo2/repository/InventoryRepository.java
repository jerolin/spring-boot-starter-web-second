/*******************************************************************************
 *
 *==============================================================================
 *
 * Copyright (c) 2001-2016 Primeton Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on 2016年4月21日 上午5:38:11
 *******************************************************************************/


package org.gocom.euler.demo2.repository;

import org.gocom.euler.demo2.entity.InventoryEntity;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * 
 *
 * @author YU J LIN (mailto:yujl@primeton.com)
 */

public interface InventoryRepository  extends JpaRepository<InventoryEntity, Long>{

	
	/**
	 * 
	 * @param email
	 * @return
	 */
	InventoryEntity findByArea(String area);
}
