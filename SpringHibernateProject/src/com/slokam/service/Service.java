package com.slokam.service;

import java.util.List;

import com.slokam.dao.Dao;
import com.slokam.pojo.Person;
import com.slokam.pojo.login;


public class Service
{
	private Dao dao;

	public void setDao(Dao dao) {
		this.dao = dao;
	}

	public void saveService(Person p) 
	{
		dao.saveDao(p);
		
	}

	public void updateService(Person p) 
	{
		dao.updateDao(p);
		
		
	}

	public void deleteService(Person p) 
	{
		dao.deleteDao(p);
	}

	public List<Person> getallService()
	{
	List<Person> list=dao.getallDao();
	return list;
		
	}

	public Person getidService(Integer pid)
	{
		Person per=dao.getidDao(pid);
		return per;
	}

	

	public boolean loginService(login login) {
		boolean result=dao.loginDao(login);
		return result;
		
	}

	

	
}
