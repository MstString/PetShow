package com.kzw.petshow.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.kzw.system.entity.Dictionary;

@Entity
@Table(name="ps_editor")
public class Editor {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	// 编辑名称
	private String editorname;
	
	//性别
	@ManyToOne
	@JoinColumn(name="dict_sex")
	private Dictionary sex;
	
	// 真实姓名
	private String realName;
	
	// 密码
	private String password;	
	
	// 头像
	private String head_portrait_path;
	
	// 拥有多个文章
	@OneToMany(mappedBy = "editor")  //mappedBy：表示放弃维护主控权
	private Set<Essay> essays = new HashSet<Essay>();

	// 角色ID
	private String roleId;
	
	// 角色名称
	private String roleName;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getEditorname() {
		return editorname;
	}

	public void setEditorname(String editorname) {
		this.editorname = editorname;
	}

	public Dictionary getSex() {
		return sex;
	}

	public void setSex(Dictionary sex) {
		this.sex = sex;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getHead_portrait_path() {
		return head_portrait_path;
	}

	public void setHead_portrait_path(String head_portrait_path) {
		this.head_portrait_path = head_portrait_path;
	}

	public Set<Essay> getEssays() {
		return essays;
	}

	public void setEssays(Set<Essay> essays) {
		this.essays = essays;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

}
