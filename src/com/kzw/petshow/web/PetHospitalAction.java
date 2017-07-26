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
import com.kzw.petshow.entity.PetHospital;
import com.kzw.petshow.service.PetHospitalService;

@Controller
@RequestMapping("/pet_hospital")
public class PetHospitalAction {
	
	@Autowired
	private PetHospitalService pethospitalService;
	
	@RequestMapping("view")
	public String view() {
		return "petshow/pet_hospital_view";
	}

	@RequestMapping("list")
	public void list(PageRequest pageRequest, HttpServletRequest request, HttpServletResponse response) {
		List<StringPropertyFilter> filters = StringPropertyFilter.buildFromHttpRequest(request);
		Page<PetHospital> page = pethospitalService.search2(pageRequest, filters);
		String json = new JSON(page).buildWithFilters(3);
		ResponseUtils.renderJson(response, json);
	}
	
	@RequestMapping("listAll")
	public String listAll(PageRequest pageRequest, HttpServletRequest request, Model model) {
		String hql = "from PetHospital";
		List<PetHospital> list = pethospitalService.findByHQL(hql);
		model.addAttribute("list", list);
		
		return "petshow_front/pet_hospital";
	}
	
	@ResponseBody
	@RequestMapping("save")
	public Msg save(PetHospital pethospital) {
		if (pethospital.getId() == null) {
			pethospitalService.saveOrUpdate(pethospital);
		} else {
			PetHospital orgUser = pethospitalService.get(pethospital.getId());
			try {
				BeanUtil.copyNotNullProperties(orgUser, pethospital);
				pethospitalService.saveOrUpdate(orgUser);
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		return new Msg(true);
	}
	
	@RequestMapping("get/{id}")
	public String get(@PathVariable("id")int id, Model model) {
		PetHospital pethospital = pethospitalService.get(id);
		model.addAttribute("pethospital", pethospital);
		return "petshow/pet_hospital_form";
	}
	
//	@RequestMapping("get_jsp/{id}")
//	public String get_jsp(@PathVariable("id")int id, Model model) {
//		PetHospital pethospital = pethospitalService.get(id);
//		model.addAttribute("pethospital", pethospital);
//		return "petshow_front/pet_hospital";
//	}

	@ResponseBody
	@RequestMapping("delete")
	public Msg delete(String ids) {
		pethospitalService.remove(ids);
		return new Msg(true);
	}
}
