/*******************************************************************************
 *
 *==============================================================================
 *
 * Copyright (c) 2001-2016 Primeton Technologies, Ltd.
 * All rights reserved.
 * 
 * Created on 2016年4月21日 上午10:20:57
 *******************************************************************************/


package org.gocom.euler.demo2.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.gocom.euler.demo2.entity.ProductEntity;
import org.gocom.euler.demo2.entity.SalesItemEntity;
import org.gocom.euler.demo2.entity.SalesItemlSummary;
import org.gocom.euler.demo2.repository.SalesItemRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * TODO 此处填写 class 信息
 *
 * @author YU J LIN (mailto:yujl@primeton.com)
 */
@Service
public class SalesItemServiceImpl implements SalesItemService {
	
	@Autowired
	private SalesItemRepository salesItemRepository;
	
	public List<SalesItemEntity> findAll() {
		return salesItemRepository.findAll();
	}

	public void save(SalesItemEntity salesItem) {
		if(salesItem == null){
			// TODO 异常处理及记录日志
			return;
		}
		salesItemRepository.save(salesItem);
	}

	public SalesItemlSummary[] findByProduct(ProductEntity product) {
		if(product == null){
			// TODO 异常处理及记录日志
			return new SalesItemlSummary[0];
		}
		List findByType = salesItemRepository.findByProduct(product);
		List<SalesItemlSummary> result = new ArrayList<SalesItemlSummary>();
		for (Object object : findByType) {
			if(object instanceof SalesItemlSummary){
				result.add((SalesItemlSummary) object);
			}else if(object instanceof Object[]){
				SalesItemlSummary itemlSummary = new SalesItemlSummary();
				Object[] array = (Object[]) object;
				for (Object object2 : array) {
					if(object2 instanceof ProductEntity){
						itemlSummary.setProduct((ProductEntity) object2);
					}else if(object2 instanceof String){
						itemlSummary.setType(object2.toString());
					}else if(object2 instanceof Long){
						itemlSummary.setSumNumber(Integer.valueOf(object2.toString()));
					}
				}
				result.add(itemlSummary);
			}
		}
		
		return result.toArray(new SalesItemlSummary[0]);
	}

	/* (non-Javadoc)
	 * @see org.gocom.euler.demo2.service.SalesItemService#findByProduct(org.gocom.euler.demo2.entity.ProductEntity, java.lang.String)
	 */
	public SalesItemlSummary[] findByProduct(ProductEntity product, String itemType) {
		if(product == null){
			// TODO 异常处理及记录日志
			return new SalesItemlSummary[0];
		}
		List findByType = salesItemRepository.findByProduct(product,itemType);
		List<SalesItemlSummary> result = new ArrayList<SalesItemlSummary>();
		for (Object object : findByType) {
			if(object instanceof SalesItemlSummary){
				result.add((SalesItemlSummary) object);
			}else if(object instanceof Object[]){
				SalesItemlSummary itemlSummary = new SalesItemlSummary();
				Object[] array = (Object[]) object;
				for (Object object2 : array) {
					if(object2 instanceof ProductEntity){
						itemlSummary.setProduct((ProductEntity) object2);
					}else if(object2 instanceof String){
						itemlSummary.setType(object2.toString());
					}else if(object2 instanceof Long){
						itemlSummary.setSumNumber(Integer.valueOf(object2.toString()));
					}else if(object2 instanceof Date){
						Calendar cal = Calendar.getInstance();
						cal.setTime((Date) object2);
						int month = cal.get(Calendar.MONTH);
						itemlSummary.setMonth(month);
					}
				}
				result.add(itemlSummary);
			}
		}
		
		return result.toArray(new SalesItemlSummary[0]);
	}

}
