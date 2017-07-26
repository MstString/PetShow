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
import com.kzw.petshow.entity.PetShop;
import com.kzw.petshow.service.PetShopService;

@Controller
@RequestMapping("/pet_shop")
public class PetShopAction {
	
	@Autowired
	private PetShopService petshopService;
	
	@RequestMapping("view")
	public String view() {
		return "petshow/pet_shop_view";
	}

	@RequestMapping("list")
	public void list(PageRequest pageRequest, HttpServletRequest request, HttpServletResponse response) {
		List<StringPropertyFilter> filters = StringPropertyFilter.buildFromHttpRequest(request);
		Page<PetShop> page = petshopService.search2(pageRequest, filters);
		String json = new JSON(page).buildWithFilters(3);
		ResponseUtils.renderJson(response, json);
	}
	
	@RequestMapping("listAll")
	public String listAll(PageRequest pageRequest, HttpServletRequest request, Model model) {
		String hql = "from PetShop";
		List<PetShop> list = petshopService.findByHQL(hql);
		model.addAttribute("list", list);
		
		return "petshow_front/pet_shop";
	}
	
	@ResponseBody
	@RequestMapping("save")
	public Msg save(PetShop petshop) {
		if (petshop.getId() == null) {
			petshopService.saveOrUpdate(petshop);
		} else {
			PetShop orgUser = petshopService.get(petshop.getId());
			try {
				BeanUtil.copyNotNullProperties(orgUser, petshop);
				petshopService.saveOrUpdate(orgUser);
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		return new Msg(true);
	}
	
	@RequestMapping("get/{id}")
	public String get(@PathVariable("id")int id, Model model) {
		PetShop petshop = petshopService.get(id);
		model.addAttribute("petshop", petshop);
		return "petshow/pet_shop_form";
	}
	
	@ResponseBody
	@RequestMapping("delete")
	public Msg delete(String ids) {
		petshopService.remove(ids);
		return new Msg(true);
	}
}
