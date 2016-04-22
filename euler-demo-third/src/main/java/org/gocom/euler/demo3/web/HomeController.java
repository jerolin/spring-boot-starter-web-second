package org.gocom.euler.demo3.web;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.gocom.euler.demo3.entity.ProductEntity;
import org.gocom.euler.demo3.entity.SalesItemEntity;
import org.gocom.euler.demo3.entity.SalesItemSummary;
import org.gocom.euler.demo3.entity.SalesItemType;
import org.gocom.euler.demo3.service.IJsonBuidler;
import org.gocom.euler.demo3.service.JsonTemplateService;
import org.gocom.euler.demo3.service.ProductService;
import org.gocom.euler.demo3.service.SalesItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

@Controller
@RequestMapping("/")
public class HomeController {
	@Autowired
	private SalesItemService salesItemService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private JsonTemplateService jsonTemplateService;
	
	@Value("${application.sales.tendency.message:Sales Tendency Message}")
	private String tendencyMessage = "";
	
	@Value("${application.sales.month.message:Sales Month Message}")
	private String salesMonthMessage = "";
	
	/**
	 * 销售月报
	 * @return
	 */
	@RequestMapping("/month")
	public ModelAndView salesMonth(final Map<String, Object> model){//读取并获得json信息
		model.put("title", salesMonthMessage);
		String productName= "product1";
		ProductEntity byCode = productService.getByCode(productName);
		for (SalesItemType itemType : SalesItemType.values()){
			SalesItemSummary[] findByType = salesItemService.findByProduct(byCode,itemType.name());
			int[] array = new int[12];
			for (SalesItemSummary salesItemlSummary : findByType) {
				array[salesItemlSummary.getMonth()] = salesItemlSummary.getSumNumber();
			}
			for (int i = 0; i < array.length; i++) {
				if(i > 0){
					array[i] += array[i - 1];//堆叠
				}
			}
			model.put(itemType.name(), array);
		}
		Object buildJson = jsonTemplateService.buildJson("month", new IJsonBuidler() {
			public Object build(String jsonTemplate) {
				JSONObject parseObject = JSON.parseObject(jsonTemplate);
				Object object = parseObject.get("series");
				if(object instanceof JSONArray){
					JSONArray jsonArray = (JSONArray) object;
					for (int i = 0; i < jsonArray.size(); i++) {
						JSONObject object2 = (JSONObject) jsonArray.get(i);
						String string = object2.getString("id");
						Object type = model.get(string);
						object2.put("data", type);
					}
				}
				return parseObject;
			}
		});
		model.put("echartJson", buildJson);
		return new ModelAndView("messages/home",model);
	}
	
	@RequestMapping("list")
	public ModelAndView list() {
		List<SalesItemEntity> messages = this.salesItemService.findAll();
		return new ModelAndView("messages/list", "messages", messages);
	}
	
	/**
	 * 测试拦截器
	 * @param name
	 * @param password
	 * @return
	 */
	@RequestMapping("")
	public ModelAndView home(Map<String, Object> model){
		return salesMonth(model);
	}
	
	/**
	 * 跳转到创建界面
	 * @param message
	 * @return
	 */
	@RequestMapping(params = "form", method = RequestMethod.GET)
	public ModelAndView toForm(@ModelAttribute SalesItemEntity message) {
		return new ModelAndView("messages/form", "message", message);
	}
	
	/**
	 * 跳转详细信息界面
	 * @param message
	 * @return
	 */
	@RequestMapping(value = "view/{id}", method = RequestMethod.GET)
	public ModelAndView view(@PathVariable("id") SalesItemEntity message) {
		return new ModelAndView("messages/view", "message", message);
	}
	
	/**
	 * 创建请求
	 * @param message
	 * @return
	 */
	@RequestMapping(params = "item", method = RequestMethod.POST)
	public ModelAndView createItem(@Valid SalesItemEntity message, BindingResult result, RedirectAttributes redirect) {
		if (result.hasErrors()) {
			return new ModelAndView("messages/form", "formErrors", result.getAllErrors());
		}
		ProductEntity product = productService.getByCode("product1");
		message.setProduct(product);
		message.setCreateById(1);
		message.setCreateDate(new Date());
		message.setUpdateById(1);
		message.setUpdateDate(new Date());
		message = this.salesItemService.save(message);
		redirect.addFlashAttribute("globalMessage", "Successfully created a new message");
		return new ModelAndView("redirect:/view/{message.id}", "message.id", message.getId());
	}
	
	@RequestMapping(value = "item/{id}/delete")
	public ModelAndView delete(@PathVariable("id") Long id) {
		this.salesItemService.deleteMessage(id);
		return list();
	}

	@RequestMapping(value = "item/{id}/modify")
	public ModelAndView modifyForm(@PathVariable("id") SalesItemEntity message) {
		return new ModelAndView("messages/form", "message", message);
	}
}
