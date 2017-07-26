package com.kzw.petshow.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.kzw.system.entity.Dictionary;

@Entity
@Table(name="ps_pet")
public class Pet {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	// 宠物名称
	private String petname;
	
	// 宠物类
	@ManyToOne
	@JoinColumn(name="dict_kind")
	private Dictionary kind;
	
	// 主人
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	// 宠物图片
	private String pet_picture_path;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPetname() {
		return petname;
	}

	public void setPetname(String petname) {
		this.petname = petname;
	}

	public Dictionary getKind() {
		return kind;
	}

	public void setKind(Dictionary kind) {
		this.kind = kind;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getPet_picture_path() {
		return pet_picture_path;
	}

	public void setPet_picture_path(String pet_picture_path) {
		this.pet_picture_path = pet_picture_path;
	}

}
