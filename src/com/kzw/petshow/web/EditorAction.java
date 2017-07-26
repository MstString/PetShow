package com.kzw.petshow.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kzw.comm.vo.Msg;
import com.kzw.core.orm.Page;
import com.kzw.core.orm.PageRequest;
import com.kzw.core.orm.StringPropertyFilter;
import com.kzw.core.util.BeanUtil;
import com.kzw.core.util.JSON;
import com.kzw.core.util.MD5;
import com.kzw.core.util.web.ResponseUtils;
import com.kzw.petshow.entity.Editor;
import com.kzw.petshow.service.EditorService;

@Controller
@RequestMapping("/editor")
public class EditorAction {
	
	@Autowired
	private EditorService editorService;
	
	@RequestMapping("view")
	public String view() {
		return "petshow/all_editor_view";
	}
	
	@RequestMapping("self_view")
	public String self_view() {
		return "petshow/self_editor_view";
	}
	
	@RequestMapping("login")
	public String login(HttpServletRequest request, String editorname, String password) {
		// 查询数据库中Editor的editorname
		Editor editor = editorService.findUniqueBy("editorname", editorname);

		if(editor!=null && editor.getPassword().equals(MD5.encode(password))) {
			request.getSession().setAttribute("EDITOR", editor);
			return "redirect:/editor_main.jsp";
		}
		
		request.setAttribute("msg", "用户或密码错误！");
		return "forward:/login.jsp";
	}
	
	/**
	 * 退出
	 * */
	@RequestMapping("logout")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:/login.jsp";
	}
	
	@RequestMapping("list")
	public void list(PageRequest pageRequest, HttpServletRequest request, HttpServletResponse response) {
		List<StringPropertyFilter> filters = StringPropertyFilter.buildFromHttpRequest(request);
		Page<Editor> page = editorService.search2(pageRequest, filters);
		String json = new JSON(page).buildWithFilters(3);
		ResponseUtils.renderJson(response, json);
	}
	
	// 只展示当前的用户 
	@RequestMapping("self_list")
	public void selfList(PageRequest pageRequest, HttpServletRequest request, HttpServletResponse response) {
		List<StringPropertyFilter> filters = StringPropertyFilter.buildFromHttpRequest(request);
		Editor editor = (Editor)request.getSession().getAttribute("EDITOR");
		// 增加一个条件
		filters.add(new StringPropertyFilter("EQI_id", editor.getId()+""));
		
		Page<Editor> page = editorService.search2(pageRequest, filters);
		String json = new JSON(page).buildWithFilters(3);
		ResponseUtils.renderJson(response, json);
	}
	
	@ResponseBody
	@RequestMapping("save")
	public Msg save(Editor editor) {
		editor.setPassword(MD5.encode(editor.getPassword()));
		if (editor.getId() == null) {
			editorService.saveOrUpdate(editor);
		} else {
			Editor orgUser = editorService.get(editor.getId());
			try {
				BeanUtil.copyNotNullProperties(orgUser, editor);
				editorService.saveOrUpdate(orgUser);
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		return new Msg(true);
	}
	
	@RequestMapping("get/{id}")
	public String get(@PathVariable("id")int id, Model model) {
		Editor editor = editorService.get(id);
		model.addAttribute("editor", editor);
		return "petshow/all_editor_form";
	}
	
	@RequestMapping("get_self/{id}")
	public String get_self(@PathVariable("id")int id, Model model) {
		Editor editor = editorService.get(id);
		model.addAttribute("editor", editor);
		return "petshow/self_editor_form";
	}
	
	@ResponseBody
	@RequestMapping("delete")
	public Msg delete(String ids) {
		editorService.remove(ids);
		return new Msg(true);
	}
}
