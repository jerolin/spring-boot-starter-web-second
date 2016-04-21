package org.gocom.euler.demo2.web;

import java.util.Date;

import org.gocom.euler.demo2.entity.UserEntity;
import org.gocom.euler.demo2.service.UserService;
import org.gocom.euler.demo2.utils.CurrentUserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

@Controller
@RequestMapping("/user/")
public class UserController {
	@Autowired
	private UserService userService;
	
	/**
	 * find all users
	 * @return
	 */
	@ResponseBody
	@RequestMapping("list")
	public String findAll(){
		return JSON.toJSONString(userService.findAll());
	}
	
	/**
	 * save user object
	 * @return
	 */
	@RequestMapping("post")
	public String post(UserEntity user){
		UserEntity curUser = CurrentUserUtils.getInstance().getUser();
		user.setCreateById(curUser.getId());
		user.setCreateDate(new Date());
		
		userService.save(user);
		return "redirect:/user/home/adduser";
	}
}
