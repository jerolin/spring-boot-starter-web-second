/*******************************************************************************
 *
 *==============================================================================
 *
 * Copyright (c) 2001-2016 Primeton Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on 2016年4月21日 上午12:37:24
 *******************************************************************************/


package org.gocom.euler.demo2.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 库存单
 *
 * @author YU J LIN (mailto:yujl@primeton.com)
 */
@Entity
@Table(name="inventory")
public class InventoryEntity extends BaseEntity {
	private String code;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="product_id")
	private ProductEntity product;
	private int number;
	private String area;
	/**
	 * @return Returns the code.
	 */
	public String getCode() {
		return code;
	}
	/**
	 * @param code The code to set.
	 */
	public void setCode(String code) {
		this.code = code;
	}
	/**
	 * @return Returns the product.
	 */
	public ProductEntity getProduct() {
		return product;
	}
	/**
	 * @param product The product to set.
	 */
	public void setProduct(ProductEntity product) {
		this.product = product;
	}
	/**
	 * @return Returns the number.
	 */
	public int getNumber() {
		return number;
	}
	/**
	 * @param number The number to set.
	 */
	public void setNumber(int number) {
		this.number = number;
	}
	/**
	 * @return Returns the area.
	 */
	public String getArea() {
		return area;
	}
	/**
	 * @param area The area to set.
	 */
	public void setArea(String area) {
		this.area = area;
	}
	
	
}
