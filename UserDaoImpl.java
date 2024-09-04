package com.packages.dao;

import java.util.List;

import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.packages.entity.Notes;
import com.packages.entity.User;

@Repository
@Transactional
public class UserDaoImpl implements UserDao{

	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	public int saveUser(User user) {
		int i = (int) hibernateTemplate.save(user);
		return i;
	}
	@SuppressWarnings("deprecation")
	@Override
	public User loginUser(String email, String password) {
		String sql = "from User where email=:em and password=:pwd";
		
		User us = (User)hibernateTemplate.execute(s->{
			Query q = s.createQuery(sql);
			q.setString("em", email);
			q.setString("pwd", password);
			return q.uniqueResult();
		});
		return us;
		
	}
	@Override
	public int saveNotes(Notes notes) {
		int j = (int) hibernateTemplate.save(notes);
		return j;
	}
	@Override
	public List<Notes> getNotesByUser(User user) {
		String sql = "from Notes where user=:us";
		
		List<Notes> list = hibernateTemplate.execute(s->{
			Query q = s.createQuery(sql);
			q.setEntity("us",user);
			return q.getResultList();			
		});
		return list;
	}
	@Override
	public Notes getNotesById(int id) {
		Notes notes = hibernateTemplate.get(Notes.class,id);
		return notes;
	}
	@Override
	public void deleteNode(int id) {
		Notes notes = hibernateTemplate.get(Notes.class,id);
		hibernateTemplate.delete(notes);
	}
	@Override
	public void updateNotes(Notes n) {
		hibernateTemplate.update(n);
		
	}

}
