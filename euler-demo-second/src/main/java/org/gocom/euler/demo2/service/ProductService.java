/*******************************************************************************
 *
 *==============================================================================
 *
 * Copyright (c) 2001-2016 Primeton Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on 2016年4月21日 上午1:02:31
 *******************************************************************************/


package org.gocom.euler.demo2.service;

import java.util.List;

import org.gocom.euler.demo2.entity.ProductEntity;

/**
 * 
 *
 * @author YU J LIN (mailto:yujl@primeton.com)
 */

public interface ProductService {

//	/**
//	 * 按地域查找库存
//	 * @param productId
//	 * @return
//	 */
//	Map<String,InventoryEntity> findProductInventoryAreas(int productId);
//	
//	/**
//	 * 查找库存总量
//	 * @param productId
//	 * @return
//	 */
//	int getProductInventoryNumber(int productId);
//	
//	/**
//	 * 按照类型查看销售额
//	 * @return
//	 */
//	Map<String,SalesItemEntity> findProductSalesItemEntities(int productId);
//	
//	/**
//	 * 查看总销量
//	 * @param productId
//	 * @return
//	 */
//	int getSalesNumber(int productId);
	
	
	ProductEntity getByCode(String productCode);
	/**
	 * 查看所有产品列表
	 * @return
	 */
	List<ProductEntity> findAll();
	
}
