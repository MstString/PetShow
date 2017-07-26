package com.kzw.petshow.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kzw.core.service.DefaultEntityManager;
import com.kzw.petshow.entity.Admin;

@Service
@Transactional
public class AdminService extends DefaultEntityManager<Admin, Integer> {

}
