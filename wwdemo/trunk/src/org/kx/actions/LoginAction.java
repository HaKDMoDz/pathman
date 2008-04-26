package org.kx.actions;


import org.kx.dao.User;

import com.opensymphony.xwork.ActionSupport;

public class LoginAction extends ActionSupport {
    private User user = new User();

    public String execute() throws Exception {
	return SUCCESS;
    }

//    public void validate() {
//	addFieldError("user.name", "invalid name");
//    }
    
    public String loginx() throws Exception {
	return SUCCESS;
    }

    public User getUser() {
	return user;
    }

    public void setUser(User user) {
	this.user = user;
    }
}
