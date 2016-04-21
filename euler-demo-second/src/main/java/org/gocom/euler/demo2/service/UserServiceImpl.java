package org.gocom.euler.demo2.service;

import java.util.List;

import org.gocom.euler.demo2.entity.AddressEntity;
import org.gocom.euler.demo2.entity.UserEntity;
import org.gocom.euler.demo2.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserRepository userRepository;
	
	/**
	 * 查询所有的User对象
	 * @return
	 */
	public List<UserEntity> findAll(){
		return userRepository.findAll();
	}
	
	/**
	 * save user
	 * @param user
	 */
	public void save(UserEntity user) {
		for(AddressEntity address: user.getAddresses()) {
			address.setUser(user);
		}
		userRepository.save(user);
	}
}
