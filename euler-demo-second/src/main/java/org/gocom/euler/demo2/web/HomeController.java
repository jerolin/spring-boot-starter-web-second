package org.gocom.euler.demo2.web;

import java.util.Map;

import org.gocom.euler.demo2.entity.ProductEntity;
import org.gocom.euler.demo2.entity.SalesItemType;
import org.gocom.euler.demo2.entity.SalesItemlSummary;
import org.gocom.euler.demo2.service.ProductService;
import org.gocom.euler.demo2.service.SalesItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;

@Controller
@RequestMapping("/user/home/")
public class HomeController {
	@Autowired
	private SalesItemService salesItemService;
	
	@Autowired
	private ProductService productService;
	
	@Value("${application.sales.tendency.message:Sales Tendency Message}")
	private String tendencyMessage = "";
	
	@Value("${application.sales.month.message:Sales Month Message}")
	private String salesMonthMessage = "";
	/**
	 * 销售月报
	 * @return
	 */
	@RequestMapping("sales/month")
	public String salesMonth(Map<String, Object> model){
		model.put("title", salesMonthMessage);
		String productName= "product1";
		model.put("productName", productName);
		
		ProductEntity byCode = productService.getByCode(productName);
		
		for (SalesItemType itemType : SalesItemType.values()){
			SalesItemlSummary[] findByType = salesItemService.findByProduct(byCode,itemType.name());
			int[] array = new int[12];
			for (SalesItemlSummary salesItemlSummary : findByType) {
				array[salesItemlSummary.getMonth()] = salesItemlSummary.getSumNumber();
			}
			for (int i = 0; i < array.length; i++) {
				if(i > 0){
					array[i] += array[i - 1];//堆叠
				}
			}
			model.put(itemType.name(), JSON.toJSONString(array));
		}
		
		return "user/customer/sales-month";
	}
	
	/**
	 * 库存Map
	 * @return
	 */
	@RequestMapping("inventory")
	public String inventory(){
		return "user/customer/inventory-map";
	}
	
	/**
	 * 销售趋势
	 * @return
	 */
	@RequestMapping(value = "sales/tendency")
	public String tendency(Map<String, Object> model){
		model.put("title", tendencyMessage);
		String productName= "product1";
		model.put("productName", productName);
		
		ProductEntity byCode = productService.getByCode(productName);
		SalesItemlSummary[] findByType = salesItemService.findByProduct(byCode);
		int sum = 0;
		for (SalesItemlSummary salesItemlSummary : findByType) {
			model.put(salesItemlSummary.getType(), salesItemlSummary.getSumNumber());
			sum += salesItemlSummary.getSumNumber();
		}
		if(sum > 0){
			for (SalesItemlSummary salesItemlSummary : findByType) {
				model.put(salesItemlSummary.getType() + "Per", Math.ceil(salesItemlSummary.getSumNumber()*100/sum));
			}
		}
		return "user/customer/sales-tendency";
	}
	
	@RequestMapping("adduser")
	public String addUser(){
		return "user/customer/user-add";
	}
}
