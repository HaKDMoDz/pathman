package org.kx.actions;

import org.kx.dao.User;

import com.opensymphony.xwork.ActionSupport;

public class UserAction extends ActionSupport {

    private User user;
    private User[] allUsers;

    public User getUser() {
	return user;
    }

    public void setUser(User user) {
	this.user = user;
    }

    public User[] getAllUsers() {
	return allUsers;
    }

    public void setAllUsers(User[] allUsers) {
	this.allUsers = allUsers;
    }

    public String execute() throws Exception {
	// TODO Auto-generated method stub
	return super.execute();
    }

}
