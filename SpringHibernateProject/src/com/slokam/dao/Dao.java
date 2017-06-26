package com.slokam.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.slokam.pojo.Person;
import com.slokam.pojo.login;

public class Dao 
{
	private SessionFactory factory;

	public SessionFactory getFactory() {
		return factory;
	}

	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}

	public void saveDao(Person p)
	{
		Session session=factory.openSession();
		Transaction tx=session.beginTransaction();
		session.save(p);
		tx.commit();
		session.close();
	}

	public void updateDao(Person p)
	{
		Session session=factory.openSession();
		Transaction tx=session.beginTransaction();
		session.update(p);
		tx.commit();
		session.close();
	}

	public void deleteDao(Person p) 
	{
		Session session=factory.openSession();
		Transaction tx=session.beginTransaction();
		session.delete(p);
		tx.commit();
		session.close();
		
		
	}

	public List<Person> getallDao()
	{
	Session session=factory.openSession();
	Query query=session.createQuery("from Person");
	List<Person> list=query.list();
	return list;
		
	}

	public Person getidDao(Integer pid) 
	
	{
		Person person=null;
		Session session=factory.openSession();
		Query query=session.createQuery("from Person p where p.pid= ?");
		query.setParameter(0, pid);
		List<Person> list=query.list();
		for(Person pjo:list)
		{
			person= pjo;
		}
		session.close();
		return person;
		
		
		
	}

	public boolean loginDao(login login) {
		
boolean result=false;
		
		Session session=factory.openSession();

		Query query=session.createQuery(" from login where username=? and password=?");
		query.setParameter(0, login.getUsername());
		query.setParameter(1, login.getPassword());
		
		List<login> list=query.list();
		
		if(list.size()>0)
		{
			result=true;
		}
		
		
		return result;
	}
}
