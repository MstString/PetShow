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
import com.kzw.core.util.web.ResponseUtils;
import com.kzw.petshow.entity.Editor;
import com.kzw.petshow.entity.Essay;
import com.kzw.petshow.service.EditorService;
import com.kzw.petshow.service.EssayService;

@Controller
@RequestMapping("/essay")
public class EssayAction {
	
	@Autowired
	private EssayService essayService;
	
	@Autowired
	private EditorService editorService;
	
	@RequestMapping("view")
	public String view() {
		return "petshow/essay_view";
	}

	@RequestMapping("list")
	public void list(PageRequest pageRequest, HttpServletRequest request, HttpServletResponse response) {
		List<StringPropertyFilter> filters = StringPropertyFilter.buildFromHttpRequest(request);
		Editor editor = (Editor)request.getSession().getAttribute("EDITOR");
		filters.add(new StringPropertyFilter("EQI_editor.id", editor.getId()+""));
		Page<Essay> page = essayService.search2(pageRequest, filters);
		
		String json = new JSON(page).buildWithFilters(3);
		ResponseUtils.renderJson(response, json);
	}
	
	@RequestMapping("listAll")
	public String listAll(PageRequest pageRequest, HttpServletRequest request, Model model) {
		String hql_essay = "from Essay";
		List<Essay> list_essay = essayService.findByHQL(hql_essay);
		model.addAttribute("list", list_essay);
		String hql_editor = "from Editor";
		List<Editor> list_editor = editorService.findByHQL(hql_editor);
		model.addAttribute("editorlist", list_editor);
		
		
		return "petshow_front/petshow_essay";
	}
	
	@ResponseBody
	@RequestMapping("save")
	public Msg save(Essay essay) {
		if (essay.getId() == null) {
			essayService.saveOrUpdate(essay);
		} else {
			Essay orgUser = essayService.get(essay.getId());
			try {
				BeanUtil.copyNotNullProperties(orgUser, essay);
				essayService.saveOrUpdate(orgUser);
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		return new Msg(true);
	}
	
	@RequestMapping("get/{id}")
	public String get(@PathVariable("id")int id, Model model) {
		Essay essay = essayService.get(id);
		model.addAttribute("essay", essay);
		return "petshow/essay_form";
	}
	
	@ResponseBody
	@RequestMapping("delete")
	public Msg delete(String ids) {
		essayService.remove(ids);
		return new Msg(true);
	}
}
