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
import com.kzw.petshow.entity.PetBeauty;
import com.kzw.petshow.service.PetBeautyService;

@Controller
@RequestMapping("/pet_beauty")
public class PetBeautyAction {
	
	@Autowired
	private PetBeautyService petbeautyService;
	
	@RequestMapping("view")
	public String view() {
		return "petshow/pet_beauty_view";
	}

	@RequestMapping("list")
	public void list(PageRequest pageRequest, HttpServletRequest request, HttpServletResponse response) {
		List<StringPropertyFilter> filters = StringPropertyFilter.buildFromHttpRequest(request);
		Page<PetBeauty> page = petbeautyService.search2(pageRequest, filters);
		String json = new JSON(page).buildWithFilters(3);
		ResponseUtils.renderJson(response, json);
	}
	
	@RequestMapping("listAll")
	public String listAll(PageRequest pageRequest, HttpServletRequest request, Model model) {
		String hql = "from PetBeauty";
		List<PetBeauty> list = petbeautyService.findByHQL(hql);
		model.addAttribute("list", list);
		
		return "petshow_front/pet_beauty";
	}
	
	@ResponseBody
	@RequestMapping("save")
	public Msg save(PetBeauty petbeauty) {
		if (petbeauty.getId() == null) {
			petbeautyService.saveOrUpdate(petbeauty);
		} else {
			PetBeauty orgUser = petbeautyService.get(petbeauty.getId());
			try {
				BeanUtil.copyNotNullProperties(orgUser, petbeauty);
				petbeautyService.saveOrUpdate(orgUser);
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		return new Msg(true);
	}
	
	@RequestMapping("get/{id}")
	public String get(@PathVariable("id")int id, Model model) {
		PetBeauty petbeauty = petbeautyService.get(id);
		model.addAttribute("petbeauty", petbeauty);
		return "petshow/pet_beauty_form";
	}
	
	@ResponseBody
	@RequestMapping("delete")
	public Msg delete(String ids) {
		petbeautyService.remove(ids);
		return new Msg(true);
	}
}
