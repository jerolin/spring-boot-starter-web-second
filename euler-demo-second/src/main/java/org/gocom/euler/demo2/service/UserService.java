package org.gocom.euler.demo2.service;

import java.util.List;

import org.gocom.euler.demo2.entity.UserEntity;

public interface UserService {
	/**
	 * 查询所有的User对象
	 * @return
	 */
	List<UserEntity> findAll();
	
	/**
	 * save user
	 * @param user
	 */
	void save(UserEntity user) ;
}
