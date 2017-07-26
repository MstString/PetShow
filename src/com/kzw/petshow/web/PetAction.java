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
import com.kzw.petshow.entity.Pet;
import com.kzw.petshow.entity.User;
import com.kzw.petshow.service.PetService;

@Controller
@RequestMapping("/user_pet")
public class PetAction {
	
	@Autowired
	private PetService petService;
	
	@RequestMapping("view")
	public String view() {
		return "petshow/pet_info_view";
	}

	@RequestMapping("list")
	public void list(PageRequest pageRequest, HttpServletRequest request, HttpServletResponse response) {
		List<StringPropertyFilter> filters = StringPropertyFilter.buildFromHttpRequest(request);
		User user = (User)request.getSession().getAttribute("USER");
		filters.add(new StringPropertyFilter("EQI_user.id", user.getId()+""));
		Page<Pet> page = petService.search2(pageRequest, filters);
		
		String json = new JSON(page).buildWithFilters(3);
		ResponseUtils.renderJson(response, json);
	}
	
	@RequestMapping("listAll")
	public String listAll(PageRequest pageRequest, HttpServletRequest request, Model model) {
		// 因为需要展示所有宠物的照片，所以不需要从Sesssion中取出用户
		String hql = "from Pet";
		List<Pet> list = petService.findByHQL(hql);
		model.addAttribute("list", list);
		String hql_user = "from User";
		List<Pet> list_user = petService.findByHQL(hql_user);
		model.addAttribute("list_user", list_user);
		
		return "petshow_front/index";
	}
	
	@ResponseBody
	@RequestMapping("save")
	public Msg save(Pet pet) {
		if (pet.getId() == null) {
			petService.saveOrUpdate(pet);
		} else {
			Pet orgUser = petService.get(pet.getId());
			try {
				BeanUtil.copyNotNullProperties(orgUser, pet);
				petService.saveOrUpdate(orgUser);
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		return new Msg(true);
	}
	
	@RequestMapping("get/{id}")
	public String get(@PathVariable("id")int id, Model model) {
		Pet pet = petService.get(id);
		model.addAttribute("pet", pet);
		return "petshow/pet_info_form";
	}
	
	@ResponseBody
	@RequestMapping("delete")
	public Msg delete(String ids) {
		petService.remove(ids);
		return new Msg(true);
	}
}
