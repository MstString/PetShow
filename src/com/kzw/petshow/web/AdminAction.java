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
import com.kzw.petshow.entity.Admin;
import com.kzw.petshow.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminAction {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping("view")
	public String view() {
		return "petshow/admin_information_view";
	}
	
	@RequestMapping("login")
	public String login(HttpServletRequest request, String adminname, String password) {
		// 查询数据库中的adminname
		Admin admin = adminService.findUniqueBy("adminname", adminname);

		if(admin!=null && admin.getPassword().equals(MD5.encode(password))) {
			request.getSession().setAttribute("ADMIN", admin);
			return "redirect:/admin_main.jsp";
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
		Page<Admin> page = adminService.search2(pageRequest, filters);
		String json = new JSON(page).buildWithFilters(3);
		ResponseUtils.renderJson(response, json);
	}
	
	@ResponseBody
	@RequestMapping("save")
	public Msg save(Admin admin) {
		admin.setPassword(MD5.encode(admin.getPassword()));
		if (admin.getId() == null) {
			adminService.saveOrUpdate(admin);
		} else {
			Admin orgUser = adminService.get(admin.getId());
			try {
				BeanUtil.copyNotNullProperties(orgUser, admin);
				adminService.saveOrUpdate(orgUser);
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		return new Msg(true);
	}
	
	@RequestMapping("get/{id}")
	public String get(@PathVariable("id")int id, Model model) {
		Admin admin = adminService.get(id);
		model.addAttribute("admin", admin);
		return "petshow/admin_information_form";
	}
	
	@ResponseBody
	@RequestMapping("delete")
	public Msg delete(String ids) {
		adminService.remove(ids);
		return new Msg(true);
	}
}
