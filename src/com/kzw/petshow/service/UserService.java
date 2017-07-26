package com.kzw.petshow.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kzw.core.service.DefaultEntityManager;
import com.kzw.petshow.entity.User;

@Service
@Transactional
public class UserService extends DefaultEntityManager<User, Integer> {

}
