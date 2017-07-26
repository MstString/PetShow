package com.kzw.petshow.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="ps_essay")
public class Essay {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	// 作者
	@ManyToOne
	@JoinColumn(name="editor_id")
	private Editor editor;
	
	// 文章名称
	private String title;
	
	// 文章图片
	private String essay_picture_path;
	
	// 文章内容
	@Column(length = 1000)
	private String content;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Editor getEditor() {
		return editor;
	}

	public void setEditor(Editor editor) {
		this.editor = editor;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getEssay_picture_path() {
		return essay_picture_path;
	}

	public void setEssay_picture_path(String essay_picture_path) {
		this.essay_picture_path = essay_picture_path;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
