/*******************************************************************************
 *
 *==============================================================================
 *
 * Copyright (c) 2001-2016 Primeton Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on 2016年4月21日 上午10:19:30
 *******************************************************************************/


package org.gocom.euler.demo2.service;

import java.util.List;

import org.gocom.euler.demo2.entity.ProductEntity;
import org.gocom.euler.demo2.entity.SalesItemEntity;
import org.gocom.euler.demo2.entity.SalesItemlSummary;

/**
 * TODO 此处填写 class 信息
 *
 * @author YU J LIN (mailto:yujl@primeton.com)
 */

public interface SalesItemService {

	/**
	 * 查询所有的salesItem对象
	 * @return
	 */
	List<SalesItemEntity> findAll();
	
	/**
	 * 
	 * @param salesItem
	 */
	void save(SalesItemEntity salesItem);
	
	/**
	 * 
	 * @param product
	 * @return
	 */
	SalesItemlSummary[] findByProduct(ProductEntity product);
	
	/**
	 * 
	 * @param product
	 * @param itemType
	 * @return
	 */
	SalesItemlSummary[] findByProduct(ProductEntity product,String itemType);
}
