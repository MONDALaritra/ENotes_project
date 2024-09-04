package com.packages.dao;

import java.util.List;

import com.packages.entity.Notes;
import com.packages.entity.User;

public interface UserDao {
	public int saveUser(User user);
	
	public User loginUser(String email, String password);
	
	public int saveNotes(Notes notes);
	
	public List<Notes> getNotesByUser(User user);
	
	public Notes getNotesById(int id);
	
	public void deleteNode(int id);
	
	public void updateNotes(Notes n);
}
