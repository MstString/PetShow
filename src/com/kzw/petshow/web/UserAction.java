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
import com.kzw.petshow.entity.User;
import com.kzw.petshow.service.UserService;

@Controller
@RequestMapping("/user")
public class UserAction {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("view")
	public String view() {
		return "petshow/all_user_view";
	}
	
	@RequestMapping("self_view")
	public String self_view() {
		return "petshow/self_user_view";
	}
	
	@RequestMapping("login")
	public String login(HttpServletRequest request, String username, String password) {
		// 查询数据库中的username
		User user = userService.findUniqueBy("username", username);

		if(user!=null && user.getPassword().equals(MD5.encode(password))) {
			request.getSession().setAttribute("USER", user);
			return "forward:/user_pet/listAll";
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
		
		
		Page<User> page = userService.search2(pageRequest, filters);
		String json = new JSON(page).buildWithFilters(3);
		ResponseUtils.renderJson(response, json);
	}
	
	@RequestMapping("self_list")
	public void selfList(PageRequest pageRequest, HttpServletRequest request, HttpServletResponse response) {
		List<StringPropertyFilter> filters = StringPropertyFilter.buildFromHttpRequest(request);
		User user = (User)request.getSession().getAttribute("USER");
		// 增加一个条件
		filters.add(new StringPropertyFilter("EQI_id", user.getId()+""));
		
		Page<User> page = userService.search2(pageRequest, filters);
		String json = new JSON(page).buildWithFilters(3);
		ResponseUtils.renderJson(response, json);
	}
	
	@ResponseBody
	@RequestMapping("save")
	public Msg save(User user) {
		user.setPassword(MD5.encode(user.getPassword()));
		if (user.getId() == null) {
			userService.saveOrUpdate(user);
		} else {
			User orgUser = userService.get(user.getId());
			try {
				BeanUtil.copyNotNullProperties(orgUser, user);
				userService.saveOrUpdate(orgUser);
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		return new Msg(true);
	}
	
	@RequestMapping("get/{id}")
	public String get(@PathVariable("id")int id, Model model) {
		User user = userService.get(id);
		model.addAttribute("user", user);
		return "petshow/all_user_form";
	}
	
	@RequestMapping("get_self/{id}")
	public String get_self(@PathVariable("id")int id, Model model) {
		User user = userService.get(id);
		model.addAttribute("user", user);
		return "petshow/self_user_form";
	}
	
	@ResponseBody
	@RequestMapping("delete")
	public Msg delete(String ids) {
		userService.remove(ids);
		return new Msg(true);
	}
}
