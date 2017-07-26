package com.kzw.petshow.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ps_beauty")
public class PetBeauty {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	// 名称
	private String beauty_name;
	
	// 图片路径
	private String beauty_picture_path;
	
	// 地址
	private String address;
	
	// 电话
	private String phonenum;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getBeauty_name() {
		return beauty_name;
	}

	public void setBeauty_name(String beauty_name) {
		this.beauty_name = beauty_name;
	}

	public String getBeauty_picture_path() {
		return beauty_picture_path;
	}

	public void setBeauty_picture_path(String beauty_picture_path) {
		this.beauty_picture_path = beauty_picture_path;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhonenum() {
		return phonenum;
	}

	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}

}
