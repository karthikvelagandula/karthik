package com.slokam.controller;

import java.util.List;

import org.dom4j.rule.Mode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.slokam.pojo.Person;
import com.slokam.pojo.login;
import com.slokam.service.Service;
@Controller
public class NewController
{
	@Autowired
	private Service service;

	public void setService(Service service) {
		this.service = service;
	}
	@RequestMapping("login")
	public ModelAndView Validate(login login)
	{
		boolean result=service.loginService(login);
		System.out.println(result);
		
		if(result)
		{
			return new ModelAndView("register.jsp","user",new Person());
		}
		else
		{
			return new ModelAndView("login.jsp");
		}
		
		
	}
	
	
	@RequestMapping("insert")
public ModelAndView saveController(Person p)
{
	service.saveService(p);
	return new ModelAndView("register.jsp" ,"user",new Person());
}
	@RequestMapping("update")
	public ModelAndView updateController(Person p)
	{
		service.updateService(p);
		return new ModelAndView("register.jsp","user",new Person());
	}
	@RequestMapping("delete")
	public ModelAndView deleteController(Person p)
	{
		service.deleteService(p);
		return new ModelAndView("register.jsp","user",new Person());
	}
	@RequestMapping("getall")
	public ModelAndView getallController()
	{
	List list=	service.getallService();
	return new ModelAndView("getAll.jsp","user" ,list);
	}
	@RequestMapping("getiddata")
	public ModelAndView getidController(Integer pid)
	{
	Person pojo=service.getidService(pid);
	return new ModelAndView("register.jsp","user",pojo);
	}
}
